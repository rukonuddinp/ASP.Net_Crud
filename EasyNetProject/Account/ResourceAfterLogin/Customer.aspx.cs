using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyNetProject.Account
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (((DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty)).Count == 0)
            {
                DetailsView1.DefaultMode = DetailsViewMode.Insert;


            }
        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{

            //    DataRowView dr = (DataRowView)e.Row.DataItem;

            //    byte[] picByte = (byte[])dr["ThanaPicture"];

            //    string imageUrl = "data:image/jpg;base64,"
            //        + Convert.ToBase64String(picByte);

            //    ((Image)e.Row.FindControl("thanaImage")).ImageUrl = imageUrl;

            //}

            if (DetailsView1.DataItem != null)
            {
                DataRowView Dr = (DataRowView)DetailsView1.DataItem;
                byte[] picByte = (byte[])Dr["Picture"];

                  string imageUrl = "data:image/jpg;base64,"
                      + Convert.ToBase64String(picByte);
                ((Image)(DetailsView1.FindControl("img_Show_Dv"))).ImageUrl = imageUrl;
            }
            

        }




        protected void SqlDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {

            FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");

            using (Stream s = fu.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(s))
                {
                    byte[] _imageArray = br.ReadBytes(fu.PostedFile.ContentLength);
                    e.Command.Parameters["@Picture"].DbType = System.Data.DbType.Binary;
                    e.Command.Parameters["@Picture"].Value = _imageArray;


                }
            }
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}