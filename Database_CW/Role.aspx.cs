using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_CW
{
    public partial class Role : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CustomValidatorRoleName_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            // Get the role name entered by the user
            string roleName = e.Value;

            // Check if the role name is a valid string
            if (!Regex.IsMatch(roleName, "^[a-zA-Z ]+$"))
            {
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }
        }
        





    }
}