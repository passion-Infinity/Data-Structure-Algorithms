using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyBookLibrary;
namespace ManagerBook
{
    class Program
    {
        public static void ShowMenu(ManageBook manageBook)
        {
            int choice;
            do
            {
                Console.WriteLine("1. Add new book.");
                Console.WriteLine("2. Update a book.");
                Console.WriteLine("3. Delete a book.");
                Console.WriteLine("4. List all book.");
                Console.WriteLine("5. Quit.");
                Console.Write("Please input your choice: ");

                while(true)
                {
                    try
                    {
                        choice = int.Parse(Console.ReadLine());
                        break;
                    } catch (Exception e)
                    {
                        Console.Write("Please input number: ");
                    }
                }

                switch (choice)
                {
                    case 1:
                        manageBook.AddBook();
                        ShowMenu(manageBook);
                        break;
                    case 2:
                        manageBook.UpdateBook();
                        ShowMenu(manageBook);
                        break;
                    case 3:
                        manageBook.DeleteBook();
                        ShowMenu(manageBook);
                        break;
                    case 4:
                        manageBook.listAllBook();
                        ShowMenu(manageBook);
                        break;
                    case 5:
                        return;
                    default:
                        if(choice < 1 || choice > 5)
                        {
                            Console.WriteLine("Please input 1 - 5 ! \n");
                        }
                        break;
                }
            } while (true);
        }

        static void Main(string[] args)
        {
            ArrayList listBook = new ArrayList();
            ManageBook manageBook = new ManageBook();
            ShowMenu(manageBook);
        }
    }
}
