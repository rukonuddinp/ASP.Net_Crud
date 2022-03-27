using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyNetProject.Reports
{
    public partial class CristalReportHandelar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalDecisions.Web.CristalReportHandelar handler = new CrystalDecisions.Web.CristalReportHandelar();
            handler.ProcessRequest(this.Context);

        }
    }
}