<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Database_CW.Test" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p>
       
        <asp:Button ID="btnShowChart" runat="server" Text="Show Chart" OnClick="btnShowChart_Click" />
<asp:Panel ID="pnlChart" runat="server" Visible="false">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="408px" Width="596px">
             <Titles>
        <asp:Title Text="Number of Employees working in a department" Font="16pt" />
    </Titles>
            <Series>
                <asp:Series Name="Series1" XValueMember="DEPT_NAME" YValueMembers="NUM_EMPLOYEES">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT d.dept_name, COUNT(e.employee_id) AS num_employees
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name "></asp:SqlDataSource>
       

    </p>

    </asp:Content>
