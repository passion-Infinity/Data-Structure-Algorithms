using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.DTO
{
    class EmployeeDTO
    {
        public string EmpID { get; set; }
        public string EmpPassword { get; set; }
        public bool EmpRole { get; set; }

        public EmployeeDTO()
        {
        }

        public EmployeeDTO(string empID, string empPassword, bool empRole)
        {
            EmpID = empID;
            EmpPassword = empPassword;
            EmpRole = empRole;
        }
    }
}
