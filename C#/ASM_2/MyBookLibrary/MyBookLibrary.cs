using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyBookLibrary
{
    public class Book
    {
        public string BookID { get; set; }
        public string BookName { get; set; }
        public string BookPublisher { get; set; }
        public float BookPrice { get; set; }
    }

    public class ManageBook
    {
        public ArrayList BookList = new ArrayList();
        public ArrayList getBookList
        {
            get => BookList;
        }

        public void AddBook()
        {
            Book addbook = EnterBook();
            if (FindBook(addbook.BookID))
            {
                Console.WriteLine("ID existed !");
            }
            else
            {
                BookList.Add(addbook);
                Console.WriteLine("Add Success");
            }
        }

        public Boolean FindBook(String id)
        {
            foreach (Book b in BookList)
            {
                if (b.BookID == id)
                {
                    return true;
                }
            }
            return false;
        }

        public void UpdateBook()
        {
            Book bookUpdate = EnterBook();
            if (FindBook(bookUpdate.BookID))
            {
                foreach (Book b in BookList)
                {
                    if (b.BookID == bookUpdate.BookID)
                    {
                        b.BookName = bookUpdate.BookName;
                        b.BookPrice = bookUpdate.BookPrice;
                        b.BookPublisher = bookUpdate.BookPublisher;
                    }
                }
                Console.WriteLine("Update Success!");
            }
            else
            {
                Console.WriteLine("ID is not exist !");
            }
        }

        public void DeleteBook()
        {
            Console.WriteLine("Enter Id");
            String idDelete = Console.ReadLine();
            Console.WriteLine("Are you sure to delete that book");
            string check = Console.ReadLine();
            if (check.Equals("yes"))
            {
                foreach (Book b in getBookList)
                {
                    if (b.BookID == idDelete)
                    {
                        getBookList.Remove(b);
                        Console.WriteLine("Delete Sucess");
                        return;
                    }
                }
                Console.WriteLine("ID is not exist!");
            }
        }

        public Book EnterBook()
        {
            Console.Write("Enter ID: ");
            string id = Console.ReadLine();
            Console.Write("Enter Name: ");
            string name = Console.ReadLine();
            Console.Write("Enter Publisher: ");
            string publisher = Console.ReadLine();

            float price;
            while (true)
            {
                try
                {
                    Console.Write("Enter Price: ");
                    price = float.Parse(Console.ReadLine());
                    break;
                } catch(Exception e)
                {
                    Console.WriteLine("Khong hop le! Vui long nhap lai!");
                }
            }
            
            Book b = new Book { BookID = id, BookName = name, BookPublisher = publisher, BookPrice = price };
            return b;
        }

        public void listAllBook()
        {
            Console.WriteLine("------LIST BOOK-------");
            if(getBookList.Count == 0)
            {
                Console.WriteLine("List is empty.\n");
            }
            foreach (Book book in getBookList)
            {
                Console.WriteLine("Book Id: " + book.BookID);
                Console.WriteLine("Book Name: " + book.BookName);
                Console.WriteLine("Book Price:  " + book.BookPrice);
                Console.WriteLine("Book Publisher:  " + book.BookPublisher);
                Console.WriteLine("--------------------");
            }
        }
    }
}
