<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="Database_CW.Address" %>


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
    <h1 style="text-align: center">Address Details </h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
        <InsertItemTemplate>
            ADDRESS_ID:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Static" ForeColor="Red" runat="server" ControlToValidate="ADDRESS_IDTextBox" ErrorMessage="Address ID Required!" Text='<%# Eval("ADDRESS_ID") %>'></asp:RequiredFieldValidator> 
          <asp:CustomValidator ID="CustomValidator2" ControlToValidate="ADDRESS_IDTextBox" runat="server" ErrorMessage=" Address ID Already Exists!" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" Text='<%# Eval("ADDRESS_ID") %>'></asp:CustomValidator>

            <asp:TextBox ID="ADDRESS_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
            <br />

            ADDRESS:
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Static" ForeColor="Red" runat="server" ControlToValidate="ADDRESSTextBox" ErrorMessage="Address Required!" Text='<%# Eval("ADDRESS") %>'></asp:RequiredFieldValidator>
            <asp:TextBox ID="ADDRESSTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Address" />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" CssClass="table mt-2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;) VALUES (:ADDRESS_ID, :ADDRESS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
        <DeleteParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
            <asp:Parameter Name="ADDRESS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
