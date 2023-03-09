using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_CW
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CustomValidatorContact_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string contact = args.Value;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringMain"].ConnectionString;
            string query = "SELECT COUNT(*) FROM employees WHERE contact = :contact";
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                connection.Open();
                OracleCommand command = new OracleCommand(query, connection);
                command.Parameters.Add("contact", contact);
                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
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