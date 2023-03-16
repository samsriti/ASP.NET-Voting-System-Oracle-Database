<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HighestVote.aspx.cs" Inherits="Database_CW.HighestVote" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h1 style="text-align: center">Employee of the Month</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT *
FROM (
  SELECT e.employee_id, e.employee_name, v.voting_year, v.voting_month, COUNT(v.candidate_id) AS vote_count
  FROM employees e
  JOIN voting_info v ON e.employee_id = v.candidate_id
  WHERE v.voting_month = :month
  GROUP BY e.employee_id, e.employee_name, v.voting_year, v.voting_month
  ORDER BY vote_count DESC
)
WHERE ROWNUM &lt;= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="month" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" CssClass="btn btn-info dropdown-toggle" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="VOTING_MONTH" DataValueField="VOTING_MONTH">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT &quot;VOTING_MONTH&quot; FROM &quot;VOTING_INFO&quot;"></asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE_NAME" SortExpression="EMPLOYEE_NAME" />
                <asp:BoundField DataField="VOTING_YEAR" HeaderText="VOTING_YEAR" SortExpression="VOTING_YEAR" />
                <asp:BoundField DataField="VOTING_MONTH" HeaderText="VOTING_MONTH" SortExpression="VOTING_MONTH" />
                <asp:BoundField DataField="VOTE_COUNT" HeaderText="VOTE_COUNT" SortExpression="VOTE_COUNT" />
            </Columns>
        </asp:GridView>
   </asp:Content>