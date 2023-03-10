<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpJobHistory.aspx.cs" Inherits="Database_CW.EmpJobHistory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h1 style="text-align: center">Employee Job History Mapping Form </h1>
        <asp:DropDownList ID="DropDownList1" CssClass="btn btn-info dropdown-toggle" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEES&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="select  e.employee_id, e.employee_name, d.dept_id, d.dept_name,  r.role_name, j.start_date, j.end_date from job_history j INNER JOIN employees e on j.employee_id = e.employee_id Inner Join departments d on d.dept_id = j.dept_id Inner Join roles r on j.role_id = r.role_id where e.employee_id = :employee">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <br />
        <asp:GridView ID="GridView1" CssClass="table table-bordered"  runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
</asp:Content>
