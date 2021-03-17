using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookStore.DAL;
using BookStore.DTO;
using System.Data;

namespace BookStore.BLL
{
    public class BookBLL
    {
        BookStoreDAL dal;
        public BookBLL()
        {
            dal = new BookStoreDAL();
        }
        public DataSet GetAll()
        {
            return dal.GetAll();
        }
        public DataSet GetAll1()
        {
            return dal.GetAll1();
        }
        public DataSet Find(string name)
        {
            return dal.FindByName(name);
        }
        public bool Insert(BookDTO dto)
        {
            return dal.Insert(dto);
        } 
        public bool Update(BookDTO dto)
        {
            return dal.Update(dto);
        }
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }
    }
}
