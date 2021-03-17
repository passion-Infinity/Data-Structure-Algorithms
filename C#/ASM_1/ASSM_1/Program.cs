using System;
using System.Collections;
using System.Text.RegularExpressions;
using System.Collections.Generic;

namespace ASSM_1
{
    class Program
    {
        static ArrayList<SinhVien> list = new ArrayList<SinhVien>(50);
        static void ThemSinhVien()
        {
            do
            {

                Console.WriteLine("*** Nhap thong tin ***");
                Console.Write("MaSV: ");
                string MaSV = Console.ReadLine();
                foreach (SinhVien sinhvien in list)
                {
                    if (sinhvien.MaSV.Equals(MaSV))
                    {
                        Console.WriteLine("Ma da ton tai! Nhap lai");
                        return;
                    }

                }

                Console.Write("Ho ten: ");
                string HoTen = Console.ReadLine();

                DateTime NgaySinh;
                while (true)
                {
                    Console.Write("Ngay sinh:");
                    try
                    {
                        NgaySinh = DateTime.Parse(Console.ReadLine());
                        break;
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Khong hop le! Vui long nhap lai (dd/MM/yyyy)");
                    }
                }
                
                
                Console.Write("Dia chi: ");
                string DiaChi = Console.ReadLine();

                string DienThoai;
                while (true)
                {
                    Console.Write("Dien thoai: ");
                    DienThoai = Console.ReadLine();
                    Regex r = new Regex(@"^\d{10,12}");
                    if(r.IsMatch(DienThoai))
                    {
                        break;
                    } else
                    {
                        Console.WriteLine("Khong hop le! Vui long nhap lai. ");
                    }
                }
                
                SinhVien sv = new SinhVien(MaSV, HoTen, NgaySinh, DiaChi, DienThoai);


                list.Add(sv);
                Console.WriteLine("Ban muon tiep tuc ?(Y/N)");
                string ans = Console.ReadLine();
                if (ans.Equals("N", StringComparison.OrdinalIgnoreCase))
                {
                    break;
                }
            } while (true);

        }
        static void XemDanhSachSinhVien()
        {
            if (list.Count == 0)
            {
                Console.WriteLine("List is empty");
            }
            foreach (SinhVien sv in list)
            {
                sv.XemThongTin();
                Console.WriteLine("------------------------------------\n");
            }
        }

        static void TimSinhVien()
        {
            Console.Write("Nhap MaSV: ");
            string MaSV = Console.ReadLine();
            SinhVien searchSV = null;
            if (list.Count == 0)
            {
                Console.WriteLine("Danh sach trong.");
                return;
            }
            foreach (SinhVien sv in list)
            {
                if (sv.MaSV.Equals(MaSV))
                {
                    searchSV = sv;
                    break;
                }
            }
            if (searchSV == null)
            {
                Console.WriteLine("Khong tim thay "+ MaSV + " trong danh sach");
            }
            else
            {
                searchSV.XemThongTin();
                Console.WriteLine("------------------------------------\n");

            }
        }

        static void CapNhatSinhVien()
        {
            Console.Write("Nhap MaSV: ");
            string MaSV = Console.ReadLine();

            SinhVien updateSV = null;
            if (list.Count == 0)
            {
                Console.WriteLine("List empty");
                return;
            }
            foreach (SinhVien sv in list)
            {
                if (string.Compare(sv.MaSV, MaSV) == 0)
                {
                    updateSV = sv;
                    list.Remove(sv);
                    break;
                }

            }
            if (updateSV != null)
            {
                
                Console.Write("Ho ten : ");
                string newHoTen = Console.ReadLine();

                DateTime newNgaySinh;
                while (true)
                {
                    Console.Write("Ngay sinh:");
                    try
                    {
                        newNgaySinh = DateTime.Parse(Console.ReadLine());
                        break;
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Khong hop le! Vui long nhap lai (dd/MM/yyyy)");
                    }
                }

                Console.Write("Dia chi: ");
                string newDiaChi = Console.ReadLine();

                string newDienThoai;
                while (true)
                {
                    Console.Write("Dien thoai: ");
                    newDienThoai = Console.ReadLine();
                    Regex r = new Regex(@"^\d{10,12}");
                    if (r.IsMatch(newDienThoai))
                    {
                        break;
                    }
                    else
                    {
                        Console.WriteLine("Khong hop le! Vui long nhap lai.");
                        Console.WriteLine("Chi bao gom ki tu so. Do dai tu 10-12.");
                    }
                }

                SinhVien sv = new SinhVien(updateSV.MaSV, newHoTen, newNgaySinh, newDiaChi, newDienThoai);
                list.Add(sv);
            }
            else
            {
                Console.WriteLine("Khong tim thay.");
            }
        }
        static void Main(string[] args)
        {
            int choice = 0;
            do
            {
                Console.WriteLine("---------MENU---------");
                Console.WriteLine("1. Xem danh sach sinh vien");
                Console.WriteLine("2. Them sinh vien");
                Console.WriteLine("3. Tim sinh vien");
                Console.WriteLine("4. Cap nhat thong tin sinh vien");
                Console.WriteLine("5. Thoat");
                Console.Write("Lua chon cua ban: ");
                while(true)
                {
                    try
                    {
                        choice = int.Parse(Console.ReadLine());
                        break;
                    } catch(Exception e)
                    {
                        Console.WriteLine("Vui long nhap so!");
                    }
                }
                
                switch (choice)
                {
                    case 1:
                        XemDanhSachSinhVien();
                        break;

                    case 2:
                        ThemSinhVien();
                        break;
                    case 3:
                        TimSinhVien();
                        break;
                    case 4:
                        CapNhatSinhVien();
                        break;
                    case 5:
                        Console.WriteLine("Tam biet");
                        return;
                    default:
                        if (choice < 1 || choice > 5)
                        {
                            Console.WriteLine("Vui long nhap tu 1 den 5!");
                        }
                        break;
                }
            } while (true);

        }
    }
}
