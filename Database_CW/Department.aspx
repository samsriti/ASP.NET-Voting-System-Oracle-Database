﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="Database_CW.Department" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
         <h1 style="text-align:center"> Department Details </h1>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPT_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                DEPT_ID:
                <asp:TextBox ID="DEPT_IDTextBox" runat="server" Text='<%# Bind("DEPT_ID") %>' />
                <br />
                DEPT_NAME:
                <asp:TextBox ID="DEPT_NAMETextBox" runat="server" Text='<%# Bind("DEPT_NAME") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
               &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Department" />
            </ItemTemplate>
        </asp:FormView>
        <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DEPT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" ReadOnly="True" SortExpression="DEPT_ID" />
                <asp:BoundField DataField="DEPT_NAME" HeaderText="DEPT_NAME" SortExpression="DEPT_NAME" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DEPARTMENTS&quot; WHERE &quot;DEPT_ID&quot; = :DEPT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENTS&quot; (&quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot;) VALUES (:DEPT_ID, :DEPT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot; FROM &quot;DEPARTMENTS&quot;" UpdateCommand="UPDATE &quot;DEPARTMENTS&quot; SET &quot;DEPT_NAME&quot; = :DEPT_NAME WHERE &quot;DEPT_ID&quot; = :DEPT_ID">
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