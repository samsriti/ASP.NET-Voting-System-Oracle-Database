<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="Database_CW.Department" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table {
            margin-top: 3pt;
        }

        .btn btn-primary btn-lg active {
            padding: 3px;
            margin: 3px;
        }
    </style>

   <h1 style="text-align: left">Department Form </h1>
     <h4 style="text-align: left; font-style:italic"> Create department details </h4>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPT_ID" DataSourceID="SqlDataSource1">
        <InsertItemTemplate>
            DEPT_ID:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DEPT_IDTextBox" ForeColor="Red" runat="server" ErrorMessage="Department ID Required!" Text='<%# Eval("DEPT_ID") %>'></asp:RequiredFieldValidator>
           
            <asp:CustomValidator  ID="CustomValidator1" runat="server" ControlToValidate="DEPT_IDTextBox" ForeColor="Red"
                ErrorMessage="Department ID already exists!" OnServerValidate="CustomValidator1_ServerValidate"
                Text='<%# Eval("DEPT_ID") %>'></asp:CustomValidator>

            &nbsp;<asp:TextBox ID="DEPT_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("DEPT_ID") %>' />
          <br />
            DEPT_NAME:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DEPT_NAMETextBox" ForeColor="Red" runat="server" ErrorMessage="Department Name Required!" Text='<%# Eval("DEPT_NAME") %>'></asp:RequiredFieldValidator>
       
            &nbsp;<asp:CustomValidator ID="CustomValidator2" ControlToValidate="DEPT_NAMETextBox" runat="server" ErrorMessage="Invalid Department Name" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" Text='<%# Eval("DEPT_NAME") %>'></asp:CustomValidator>
            <asp:TextBox ID="DEPT_NAMETextBox" CssClass="form-control" runat="server" Text='<%# Bind("DEPT_NAME") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-primary btn-lg active" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Department" />
        </ItemTemplate>
    </asp:FormView>
    <br />
     <h4 style="text-align: left; font-style:italic"> Update, view and delete department details </h4>
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DEPT_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" ReadOnly="True" SortExpression="DEPT_ID" />
            <asp:BoundField DataField="DEPT_NAME" HeaderText="DEPT_NAME" SortExpression="DEPT_NAME" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" DeleteCommand="DELETE FROM &quot;DEPARTMENTS&quot; WHERE &quot;DEPT_ID&quot; = :DEPT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENTS&quot; (&quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot;) VALUES (:DEPT_ID, :DEPT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPARTMENTS&quot;" UpdateCommand="UPDATE &quot;DEPARTMENTS&quot; SET &quot;DEPT_NAME&quot; = :DEPT_NAME WHERE &quot;DEPT_ID&quot; = :DEPT_ID">
        <DeleteParameters>
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
            <asp:Parameter Name="DEPT_NAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DEPT_NAME" Type="String" />
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
