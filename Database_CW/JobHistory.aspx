<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobHistory.aspx.cs" Inherits="Database_CW.JobHistory" %>


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
    <h1 style="text-align: center">Job History Details </h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource1">

        <InsertItemTemplate>
            JOB_ID:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="JOB_IDTextBox" runat="server" ErrorMessage="Job ID Required!"  ForeColor="Red" Text='<%# Eval("JOB_ID") %>'></asp:RequiredFieldValidator>
            <br />

            <asp:TextBox ID="JOB_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("JOB_ID") %>' />
            <br />
            START_DATE:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="START_DATETextBox" runat="server" ErrorMessage="Start Date Required!"  ForeColor="Red" Text='<%# Eval("START_DATE") %>'></asp:RequiredFieldValidator>
            &nbsp;<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="START_DATETextBox" ErrorMessage="Invalid Date Format. The correct format is DD-MMM-YY." ForeColor="Red" OnServerValidate="CustomValidatorDOB_ServerValidate" Text='<%# Eval("START_DATE") %>'></asp:CustomValidator>
            <asp:TextBox ID="START_DATETextBox" CssClass="form-control" runat="server" Text='<%# Bind("START_DATE") %>' />
            <br />
            END_DATE:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="END_DATETextBox" runat="server" ErrorMessage="End Date Required!"  ForeColor="Red" Text='<%# Eval("START_DATE") %>'></asp:RequiredFieldValidator>
            &nbsp;<asp:CustomValidator ID="CustomValidator2" ControlToValidate="END_DATETextBox" runat="server" ErrorMessage="Invalid Date Format. The correct format is DD-MMM-YY." ForeColor="Red" OnServerValidate="CustomValidatorDOB_ServerValidate" Text='<%# Eval("END_DATE") %>'></asp:CustomValidator>
            <asp:TextBox ID="END_DATETextBox" CssClass="form-control" runat="server" Text='<%# Bind("END_DATE") %>' />
            <br />
            EMPLOYEE_ID:
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("EMPLOYEE_ID") %>'>
                </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEES&quot;"></asp:SqlDataSource>
            <br />
            DEPT_ID:
                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="DEPT_NAME" DataValueField="DEPT_ID" SelectedValue='<%# Bind("DEPT_ID") %>'>
                </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot; FROM &quot;DEPARTMENTS&quot;"></asp:SqlDataSource>
            <br />
            ROLE_ID:
                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;ROLES&quot;"></asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary btn-lg active" runat="server" CausesValidation="False" CommandName="New" Text="Add Job Record" />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" CssClass="table mt-2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" ReadOnly="True" SortExpression="JOB_ID" />
            <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
            <asp:BoundField DataField="END_DATE" HeaderText="END_DATE" SortExpression="END_DATE" />
            <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" SortExpression="EMPLOYEE_ID" />
            <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" SortExpression="DEPT_ID" />
            <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" SortExpression="ROLE_ID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;JOB_HISTORY&quot; WHERE &quot;JOB_ID&quot; = :JOB_ID" InsertCommand="INSERT INTO &quot;JOB_HISTORY&quot; (&quot;JOB_ID&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;EMPLOYEE_ID&quot;, &quot;DEPT_ID&quot;, &quot;ROLE_ID&quot;) VALUES (:JOB_ID, :START_DATE, :END_DATE, :EMPLOYEE_ID, :DEPT_ID, :ROLE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;EMPLOYEE_ID&quot;, &quot;DEPT_ID&quot;, &quot;ROLE_ID&quot; FROM &quot;JOB_HISTORY&quot;" UpdateCommand="UPDATE &quot;JOB_HISTORY&quot; SET &quot;START_DATE&quot; = :START_DATE, &quot;END_DATE&quot; = :END_DATE, &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID, &quot;DEPT_ID&quot; = :DEPT_ID, &quot;ROLE_ID&quot; = :ROLE_ID WHERE &quot;JOB_ID&quot; = :JOB_ID">
        <DeleteParameters>
            <asp:Parameter Name="JOB_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="JOB_ID" Type="String" />
            <asp:Parameter Name="START_DATE" Type="DateTime" />
            <asp:Parameter Name="END_DATE" Type="DateTime" />
            <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
            <asp:Parameter Name="ROLE_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="START_DATE" Type="DateTime" />
            <asp:Parameter Name="END_DATE" Type="DateTime" />
            <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
            <asp:Parameter Name="DEPT_ID" Type="Decimal" />
            <asp:Parameter Name="ROLE_ID" Type="String" />
            <asp:Parameter Name="JOB_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
