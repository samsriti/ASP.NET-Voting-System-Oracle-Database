<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Database_CW.Employee" %>


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

    <h1 style="text-align: center">Employee's Details </h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
        <InsertItemTemplate>
            EMPLOYEE_ID:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="EMPLOYEE_IDTextBox" runat="server" ErrorMessage="Employee ID Required!" ForeColor="Red"></asp:RequiredFieldValidator>
           
            <asp:CustomValidator ID="CustomValidator2" ControlToValidate="EMPLOYEE_IDTextBox" runat="server" ErrorMessage="Employee ID already exists!" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" Text='<%# Eval("EMPLOYEE_ID") %>'></asp:CustomValidator>
            <asp:TextBox ID="EMPLOYEE_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("EMPLOYEE_ID") %>' />
            <br />
            EMPLOYEE_NAME:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="EMPLOYEE_NAMETextBox" runat="server" ErrorMessage="Employee Name Required!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="EMPLOYEE_NAMETextBox" CssClass="form-control" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
            <br />
            DOB:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="DOBTextBox" runat="server" ErrorMessage="Employee DOB Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          
            <asp:CustomValidator ID="CustomValidatorDOB" runat="server" ControlToValidate="DOBTextBox" ErrorMessage="Invalid date of birth format. The correct format is DD-MMM-YY." ForeColor="Red" OnServerValidate="CustomValidatorDOB_ServerValidate"></asp:CustomValidator>

            <asp:TextBox ID="DOBTextBox" CssClass="form-control" runat="server" Text='<%# Bind("DOB") %>' />
            <br />
            CONTACT:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="CONTACTTextBox" runat="server" ErrorMessage="Employee Contact Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          
            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="CONTACTTextBox" runat="server" ErrorMessage="This contact already exists!" ForeColor="Red" OnServerValidate="CustomValidatorContact_ServerValidate"  Text='<%# Eval("CONTACT") %>'></asp:CustomValidator>
            <asp:TextBox ID="CONTACTTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CONTACT") %>' />
            <br />
            DEPT_ID:
           
            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSource='<%# Eval("DEPT_ID") %>' DataSourceID="SqlDataSource2" DataTextField="DEPT_NAME" DataValueField="DEPT_ID" SelectedValue='<%# Bind("DEPT_ID") %>' AutoPostBack="True">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot; FROM &quot;DEPARTMENTS&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot; FROM &quot;DEPARTMENTS&quot;"></asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Employee" />
        </ItemTemplate>
    </asp:FormView>

    <asp:GridView ID="GridView1" CssClass="table mt-2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
            <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE_NAME" SortExpression="EMPLOYEE_NAME" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" SortExpression="DEPT_ID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" DeleteCommand="DELETE FROM &quot;EMPLOYEES&quot; WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID" InsertCommand="INSERT INTO &quot;EMPLOYEES&quot; (&quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT&quot;, &quot;DEPT_ID&quot;) VALUES (:EMPLOYEE_ID, :EMPLOYEE_NAME, :DOB, :CONTACT, :DEPT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT * FROM &quot;EMPLOYEES&quot;" UpdateCommand="UPDATE &quot;EMPLOYEES&quot; SET &quot;EMPLOYEE_NAME&quot; = :EMPLOYEE_NAME, &quot;DOB&quot; = :DOB, &quot;CONTACT&quot; = :CONTACT, &quot;DEPT_ID&quot; = :DEPT_ID WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID">
        <DeleteParameters>
            <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
            <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
            <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
