using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASSM_1
{
    class SinhVien
    {
        public string MaSV { get; set; }
        public string HoTen { get; set; }
        public DateTime NgaySinh { get; set; }
        public string DiaChi { get; set; }
        public string DienThoai { get; set; }

        public SinhVien() { }
        public SinhVien(string MaSV, string HoTen, DateTime NgaySinh, string DiaChi, string DienThoai)
        {
            this.MaSV = MaSV;
            this.HoTen = HoTen;
            this.NgaySinh = NgaySinh;
            this.DiaChi = DiaChi;
            this.DienThoai = DienThoai;
        }

        public void XemThongTin()
        {
            Console.WriteLine("MaSV: {0}", MaSV);
            Console.WriteLine("Ho ten: {0}", HoTen);
            Console.WriteLine("Ngay sinh: {0}", NgaySinh);
            Console.WriteLine("Dia chi: {0}", DiaChi);
            Console.WriteLine("Dien thoai: {0}", DienThoai);
        }
    }
}
