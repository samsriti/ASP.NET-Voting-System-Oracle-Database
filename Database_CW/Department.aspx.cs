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
    public partial class Department : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string deptId = args.Value;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringMain"].ConnectionString;

            //string connectionString = ConfigurationManager.ConnectionStrings["OracleDBConnection"].ConnectionString;
            string query = "SELECT COUNT(*) FROM departments WHERE dept_id = :deptId";

            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                OracleCommand command = new OracleCommand(query, connection);
                command.Parameters.Add("deptId", deptId);
                connection.Open();
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



    }
}