<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpJobHistory.aspx.cs" Inherits="Database_CW.EmpJobHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEES&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="select e.employee_name, d.dept_name,  r.role_name, j.start_date, j.end_date from job_history j INNER JOIN employees e on j.employee_id = e.employee_id Inner Join departments d on d.dept_id = j.dept_id Inner Join roles r on j.role_id = r.role_id where e.employee_id = :employee">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
    </form>
</body>
</html>
