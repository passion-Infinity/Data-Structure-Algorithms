using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookStore.DAL;
using BookStore.DTO;

namespace BookStore.BLL
{
    class EmployeeBLL
    {
        EmployeeDAL dal;

        public EmployeeBLL()
        {
            dal = new EmployeeDAL();
        }
        public EmployeeDTO CheckLogin(string username, string password)
        {
            return dal.CheckLogin(username, password);
        }
        public bool Update(EmployeeDTO dto)
        {
            return dal.update(dto);
        }
    }
}
