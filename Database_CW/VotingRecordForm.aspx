<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VotingRecordForm.aspx.cs" Inherits="Database_CW.VotingRecordForm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 style="text-align: center">Voting Record of an Employee </h1>
    <asp:DropDownList ID="DropDownList1"  CssClass="btn btn-info dropdown-toggle" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEES&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT e.employee_id, e.employee_name, v.voting_year, v.voting_month, c.employee_name AS candidate_name, c.contact AS candidate_contact
FROM employees e
JOIN voting_info v ON e.employee_id = v.voter_id
JOIN employees c ON v.candidate_id = c.employee_id
Where e.employee_id = :employee">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" CssClass="table table-bordered"  runat="server" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
            <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE_NAME" SortExpression="EMPLOYEE_NAME" />
            <asp:BoundField DataField="VOTING_YEAR" HeaderText="VOTING_YEAR" SortExpression="VOTING_YEAR" />
            <asp:BoundField DataField="VOTING_MONTH" HeaderText="VOTING_MONTH" SortExpression="VOTING_MONTH" />
            <asp:BoundField DataField="CANDIDATE_NAME" HeaderText="CANDIDATE_NAME" SortExpression="CANDIDATE_NAME" />
            <asp:BoundField DataField="CANDIDATE_CONTACT" HeaderText="CANDIDATE_CONTACT" SortExpression="CANDIDATE_CONTACT" />
        </Columns>
    </asp:GridView>
</asp:Content>
