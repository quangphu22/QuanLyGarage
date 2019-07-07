﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAO
{
    public class PhieuSuaChuaDAO
    {
        private static PhieuSuaChuaDAO instance;
        private PhieuSuaChuaDAO() { }
        public static PhieuSuaChuaDAO Instance {
            get { if (instance == null) instance = new PhieuSuaChuaDAO(); return instance; }
            private set { PhieuSuaChuaDAO.instance = value; }
        }

        private DataTable VTPTDangNhap;

        public void KhoiTaoDtVTPTDangNhap()//Khởi tạo mới cho dt VTPT Đang Nhập
        {
            VTPTDangNhap = new DataTable();
            VTPTDangNhap = TaoDataTable(3, new string []{ "ma" , "slhientai" , "slchophep"});
        }

        public DataTable TaoDataTable(int a, string[] name)//Tạo dt với số cột và nội dung từng cột
        {
            DataTable dt = new DataTable();
            dt.Clear();
            for (int i = 0; i < a; i ++)
            {
                dt.Columns.Add(name[i]);
            }
            return dt;
        }

        public DataTable ThemHangVTPT(DataTable dt, int a, string VTPT, int Soluong, int DonGia, string MaPhuTung)//Thêm 1 hàng cho dt VTPT với các nội dung nhập vào
        {
            DataRow dr = dt.NewRow();
            dr["STT"] = a;
            dr["Vật tư phụ tùng"] = VTPT;
            dr["Số lượng"] = Soluong;
            dr["Đơn giá"] = DonGia;
            dr["Thành tiền"] = Soluong * DonGia;
            dr["Mã phụ tùng"] = MaPhuTung;
            dt.Rows.Add(dr);
            return dt;
        }

        public DataTable ThemHangTienCong(DataTable dt, int a, string NoiDung, int ChiPhi, string MaTC)//Thêm 1 hàng tiền công cho dt Tiền công với các nội dung nhập vào
        {
            DataRow dr = dt.NewRow();
            dr["STT"] = a;
            dr["Nội dung"] = NoiDung;
            dr["Chi phí"] = ChiPhi;
            dr["Mã tiền công"] = MaTC;
            dt.Rows.Add(dr);
            return dt;
        }

        public int LayDonGiaVTPT(string maVTPT)//Lấy đơn giá của VTPT theo mã
        {
            string query = "Select * from KHO where MaPhuTung = " + maVTPT;
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            int DonGia = int.Parse(result.Rows[0][3].ToString());
            return DonGia;
        }

        public int LayChiPhiTienCong(string maTienCong)//Lấy chi phí của tiền công theo mã
        {
            string query = "Select * from TIENCONG where MaTC = " + maTienCong;
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            int ChiPhi = int.Parse(result.Rows[0][2].ToString());
            return ChiPhi;
        }

        public void LuuPhieuSuaChua(string BienSo,int TienCong, int TienPhuTung, int TongTien, DataTable TC)//Lưu dữ liệu được nhập vào 2 bảng PHIEUSUACHUA và CHITIETPHIEUSUACHUA
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("Select count(*) from PHIEUSUACHUA");
            int ma = int.Parse(dt.Rows[0][0].ToString());
            dt = DataProvider.Instance.ExecuteQuery("Select MaKH from XE where BienSo = " + BienSo);
            string makh = dt.Rows[0][0].ToString();
            string query = "insert into PHIEUSUACHUA values ("+ma + " , " + BienSo + " , " + makh + " , " + TienCong + " , " + TienPhuTung + " , " + TongTien + ")";
            int re = DataProvider.Instance.ExecuteNonQuery(query);
            int slvtpt = VTPTDangNhap.Rows.Count;
            int sltc = TC.Rows.Count;
            if (slvtpt >= sltc)
            {
                for(int i = 0; i < sltc; i++)
                {
                    query = "insert into CHITIETPHIEUNHAP values ("+ ma + " , " + VTPTDangNhap.Rows[i][0].ToString() + " , " + TC.Rows[i][3].ToString() + ")";
                    re = DataProvider.Instance.ExecuteNonQuery(query);
                }
                for(int i = sltc; i < slvtpt; i++)
                {
                    query = "insert into CHITIETPHIEUNHAP values (" + ma + " , " + VTPTDangNhap.Rows[i][0].ToString() + " , " + null + ")";
                    re = DataProvider.Instance.ExecuteNonQuery(query);
                }
            }
            else
            {
                for (int i = 0; i < slvtpt; i++)
                {
                    query = "insert into CHITIETPHIEUNHAP values (" + ma + " , " + VTPTDangNhap.Rows[i][0].ToString() + " , " + TC.Rows[i][3].ToString() + ")";
                    re = DataProvider.Instance.ExecuteNonQuery(query);
                }
                for (int i = slvtpt; i < sltc; i++)
                {
                    query = "insert into CHITIETPHIEUNHAP values (" + ma + " , " + null + " , " + TC.Rows[i][3].ToString() + ")";
                    re = DataProvider.Instance.ExecuteNonQuery(query);
                }
            }
            
        }

        public void NhapVTPT()//Thực hiện cập nhật lại số lượng vtpt còn lại trong kho.
        {
            string query;
            int remain = 0;
            foreach (DataRow row in VTPTDangNhap.Rows)
            {
                remain = int.Parse(row["slchophep"].ToString()) - int.Parse(row["slhientai"].ToString());
                query = "Update KHO set SoLuong = " + remain + "where MaPhuTung = "+ row["ma"].ToString() ;
                int re = DataProvider.Instance.ExecuteNonQuery(query);
            }
        }

        public bool KiemTraSoLuong(string MaVTPT, int SoLuong)//Kiểm tra số lượng nhập vào có nằm trong khả năng đáp ứng của kho.
        {
            bool TonTai = false;
            int Tong = 0;
            foreach(DataRow row in VTPTDangNhap.Rows)
            {
                if (row["ma"].ToString() == MaVTPT)
                {
                    TonTai = true;
                    Tong = SoLuong + int.Parse(row["slhientai"].ToString());
                    if (Tong > int.Parse(row["slchophep"].ToString()))
                    {
                        return false;
                    }
                    else
                    {
                        row["slhientai"] = Tong.ToString();
                    }
                }
            }
            if (!TonTai)
            {
                string query = "select * from KHO where MaPhuTung = " + MaVTPT;
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                int sl = int.Parse(dt.Rows[0][2].ToString());
                if (SoLuong <= sl)
                {
                    DataRow dr = VTPTDangNhap.NewRow();
                    dr["ma"] = MaVTPT;
                    dr["slhientai"] = SoLuong;
                    dr["slchophep"] = sl;
                }
                else
                {
                    return false;
                }
            }
            return true;
        }

        public void XoaDtVTPTDangNhap()//Thực hiện xóa các hàng của dt VTPT Đang nhập
        {
            VTPTDangNhap.Clear();
        }


        //public int DiemSoLuongPhuTung(DataTable a,string PhuTung)
        //{
        //    int sum = 0;
        //    foreach(DataRow row in a.Rows)
        //    {
        //        if(row["Vật tư phụ tùng"].ToString() == PhuTung)
        //        {
        //            sum += int.Parse(row["Số lượng"].ToString());
        //        }
        //    }
        //    return sum;
        //}

        
    }
}
