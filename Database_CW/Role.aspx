<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="Database_CW.Role" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
        </div>
        <h1 style="text-align:center"> Role Details </h1>
        
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
           
            <InsertItemTemplate>
                ROLE_ID:
                <asp:RequiredFieldValidator ControlToValidate="ROLE_IDTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Role ID Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="ROLE_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ROLE_ID") %>' />
                <br />
                ROLE_NAME:
                 <asp:RequiredFieldValidator ControlToValidate="ROLE_NAMETextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Role Name Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CustomValidator ID="CustomValidatorRoleName" runat="server" ControlToValidate="ROLE_NAMETextBox" ErrorMessage="Please enter a valid role name." ForeColor="Red" OnServerValidate="CustomValidatorRoleName_ServerValidate"></asp:CustomValidator>

               
                <asp:TextBox ID="ROLE_NAMETextBox" CssClass="form-control" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
               
                &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Role" />
            </ItemTemplate>
        </asp:FormView>
    <br />
    
        <asp:GridView ID="GridView1" CssClass="table mt-2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  />
                <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" ReadOnly="True" SortExpression="ROLE_ID" />
                <asp:BoundField DataField="ROLE_NAME" HeaderText="ROLE_NAME" SortExpression="ROLE_NAME" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" DeleteCommand="DELETE FROM &quot;ROLES&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID" InsertCommand="INSERT INTO &quot;ROLES&quot; (&quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;) VALUES (:ROLE_ID, :ROLE_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT * FROM &quot;ROLES&quot;" UpdateCommand="UPDATE &quot;ROLES&quot; SET &quot;ROLE_NAME&quot; = :ROLE_NAME WHERE &quot;ROLE_ID&quot; = :ROLE_ID">
            <DeleteParameters>
                <asp:Parameter Name="ROLE_ID" Type="String"/>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLE_ID" Type="String" />
                <asp:Parameter Name="ROLE_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="ROLE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
 



</asp:Content>



