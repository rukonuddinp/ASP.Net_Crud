using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EasyNetProject.App_Code
{
    [DataObject]

    public class ManagementObjectDataSource
    {


        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Management> select(int StartRowIndex, int MaxRowNum)
        {
            List<Management> myReturnList = new List<Management>();
            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            scon.Open();
            SqlCommand cmd = new SqlCommand(@" SELECT [Id], [M_Name] FROM [dbo].[Management]", scon);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                myReturnList.Add(new Management()

                {
                    Id = (int)dr["Id"],
                    M_Name = (string)dr["M_Name"]


                });


            }
            if (scon.State == System.Data.ConnectionState.Open)
            {
                scon.Close();
            }
            return myReturnList;
        }

        public static int GetTotalRecord(int StartRowIndex, int MaxRowNum)
        {
            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            scon.Open();
            SqlCommand cmd = new SqlCommand(@" SELECT count ([Id]) FROM [dbo].[Management]", scon);
            int RetTotal = (int)cmd.ExecuteScalar();

            if (scon.State == System.Data.ConnectionState.Open)
            {
                scon.Close();
            }
            return RetTotal;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static int Delete(int Id, String M_Name, int Original_Id, String Original_M_Name)
        {
            List<Management> myReturnList = new List<Management>();
            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            scon.Open();
            SqlCommand cmd = new SqlCommand(@" DELETE FROM [dbo].[Management] WHERE Id =" + Original_Id, scon);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int Update(int Id, String M_Name, int Original_Id, String Original_M_Name)
        {
            List<Management> myReturnList = new List<Management>();
            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            scon.Open();
            SqlCommand cmd = new SqlCommand(@" UPDATE [dbo].[Management] SET [M_Name] = M_Name, WHERE Id=" + Original_Id + " and M_Name='" + Original_M_Name + "'", scon);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static int Insert(int Id, string M_Name)
        {
            List<Management> myReturnList = new List<Management>();
            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            scon.Open();
            SqlCommand cmd = new SqlCommand(@" INSERT INTO [dbo].[Management] ([M_Name]) VALUES ('" + M_Name + "') ", scon);
                                 
            
            
            
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }
    }
}