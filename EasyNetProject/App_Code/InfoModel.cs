
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EasyNetProject.App_Code
{
    public class Management
    {
        public int Id { get; set; }
        public string M_Name { get; set; }
    }

    public class Department
    {
        public int Id { get; set; }
        public string D_Name { get; set; }
        public int M_DepartmentId { get; set; }
    }

    public class Employee
    {
        public int Id { get; set; }
        public string E_Name { get; set; }
        public string Post { get; set; }
        public DateTime JoiningDate { get; set; }
        public int D_EmployeeId { get; set; }
    }

    public class Customer
    {
        public int Id { get; set; }
        public string C_Name { get; set; }
        public byte[] Picture { get; set; }
        public int E_CustomerId { get; set; }
    }

    public class Order
    {
        public int Id { get; set; }
        public string Or_Name { get; set; }
        public Boolean Order_Avilable { get; set; }
        public int C_OrdersId { get; set; }
    }
}