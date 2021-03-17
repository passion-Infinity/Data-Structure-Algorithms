using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.DTO
{
    public class BookDTO
    {
        public int BookID { get; set; }
        public string BookName { get; set; }
        public float BookPrice { get; set; }

        public BookDTO()
        {

        }

        public BookDTO(int bookID, string bookName, float bookPrice)
        {
            BookID = bookID;
            BookName = bookName;
            BookPrice = bookPrice;
        }
    }
}
