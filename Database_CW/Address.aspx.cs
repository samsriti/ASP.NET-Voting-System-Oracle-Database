using Oracle.ManagedDataAccess.Client;
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



        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string address = args.Value;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringMain"].ConnectionString;
            string query = "SELECT COUNT(*) FROM address WHERE address_ID = :address";
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                connection.Open();
                OracleCommand command = new OracleCommand(query, connection);
                int addressId;
                if (int.TryParse(address, out addressId))
                {
                    command.Parameters.Add("address", addressId);
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
                else
                {
                    args.IsValid = false;
                }
            }
        }

    }
}