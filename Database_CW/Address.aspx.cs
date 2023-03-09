using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_CW
{
    public partial class Address : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int number;
            bool isValidNumber = int.TryParse(args.Value, out number);

            args.IsValid = isValidNumber;
        }

    }
}