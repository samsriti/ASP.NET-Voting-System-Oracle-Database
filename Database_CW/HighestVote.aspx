<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighestVote.aspx.cs" Inherits="Database_CW.HighestVote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select e.employee_name, d.dept_name,  r.role_name, j.start_date, j.end_date from job_history j INNER JOIN employees e on j.employee_id = e.employee_id Inner Join departments d on d.dept_id = j.dept_id Inner Join roles r on j.role_id = r.role_id where employee_name = 'Hari Sharma';"></asp:SqlDataSource>
    </form>
</body>
</html>
