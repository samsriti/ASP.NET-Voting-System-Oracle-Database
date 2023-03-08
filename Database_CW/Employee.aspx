<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Database_CW.Employee" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <h1 style="text-align:center"> Employee's Details </h1>
        <asp:FormView ID="FormView1" runat="server"  DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                EMPLOYEE_ID:
                <asp:TextBox ID="EMPLOYEE_IDTextBox"  runat="server" Text='<%# Bind("EMPLOYEE_ID") %>' />
                <br />
                EMPLOYEE_NAME:
                <asp:TextBox ID="EMPLOYEE_NAMETextBox"  runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox"  runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                CONTACT:
                <asp:TextBox ID="CONTACTTextBox"  runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                DEPT_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSource='<%# Eval("DEPT_ID") %>' DataSourceID="SqlDataSource2" DataTextField="DEPT_NAME" DataValueField="DEPT_ID" SelectedValue='<%# Bind("DEPT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot; FROM &quot;DEPARTMENTS&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot; FROM &quot;DEPARTMENTS&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Employee" />
              </ItemTemplate>
        </asp:FormView>

        <asp:GridView ID="GridView1" CssClass="table mt-2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE_NAME" SortExpression="EMPLOYEE_NAME" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" SortExpression="DEPT_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;EMPLOYEES&quot; WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID" InsertCommand="INSERT INTO &quot;EMPLOYEES&quot; (&quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT&quot;, &quot;DEPT_ID&quot;) VALUES (:EMPLOYEE_ID, :EMPLOYEE_NAME, :DOB, :CONTACT, :DEPT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT&quot;, &quot;DEPT_ID&quot; FROM &quot;EMPLOYEES&quot;" UpdateCommand="UPDATE &quot;EMPLOYEES&quot; SET &quot;EMPLOYEE_NAME&quot; = :EMPLOYEE_NAME, &quot;DOB&quot; = :DOB, &quot;CONTACT&quot; = :CONTACT, &quot;DEPT_ID&quot; = :DEPT_ID WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID">
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
