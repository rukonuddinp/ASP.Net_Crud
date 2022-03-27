using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyNetProject
{
    public partial class EasyNetUserControl1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_refresh_Click(object sender, EventArgs e)
        {

            base.OnInit(new EventArgs());
            Response.Redirect(Request.RawUrl, true);
        }
    }
}