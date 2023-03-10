using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_CW
{
    public partial class JobHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CustomValidatorDOB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dob;
            if (DateTime.TryParseExact(args.Value, "dd-MMM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dob))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;

            }
        }


    }
}