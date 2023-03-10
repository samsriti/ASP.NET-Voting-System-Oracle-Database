<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Database_CW._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .view-flex-top {
            display: flex;
            justify-content: space-between;
            align-items: center
        }

        .view-flex-bottom-1 {
            display: flex;
            justify-content: space-between;
            align-items: center
        }

        .view-flex-bottom-2 {
            display: flex;
            justify-content: space-between;
            align-items: center
        }


        .card {
            margin: 20px;
            height: 150px;
            width: 210px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 6px;
            background-color: #f4e4e7;
            border: solid #76b5c5;
        }

        .card-header {
            text-align: center;
            font-size: 20px;
            margin-top: 3px;
            margin-bottom: 3px;
            padding-top: 20px;
        }

        .card-footer {
            background-color: #e4f4f1;
            text-align: center;
            padding-top: 5px;
            margin-top: 3px;
            margin-bottom: 3px;
            border: groove #76b5c5;
        }

        .view-details {
            color: #0d0d0d;
            text-decoration: none;
        }

            .view-details:hover {
                color: #873e23;
            }

        .center {
            margin: 0 auto;
            display: block;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="view-flex-top">

                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Employee Details</div>
                        <div class="card-footer">
                            <a href="/Employee" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Department Details</div>
                        <div class="card-footer">
                            <a href="/Department" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Job Details</div>
                        <div class="card-footer">
                            <a href="/JobHistory" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Role Details</div>
                        <div class="card-footer">
                            <a href="/Role" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="view-flex-bottom-1">


                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Address Details</div>
                        <div class="card-footer">
                            <a href="/Address" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Voting Record</div>
                        <div class="card-footer">
                            <a href="/VotingRecordForm" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Employee Job History</div>
                        <div class="card-footer">
                            <a href="/EmpJobHistory" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Employee of the Month</div>
                        <div class="card-footer">
                            <a href="/HighestVote" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>






        </div>
    </div>


    <asp:Button ID="btnShowChart" CssClass="center btn btn-info btn-lg active" runat="server" Text="Show Chart" OnClick="btnShowChart_Click" /> <br />
    <asp:Panel ID="pnlChart" runat="server" Visible="false">
        <asp:Chart ID="Chart1" runat="server" CssClass="center" DataSourceID="SqlDataSource1" Height="443px" Width="570px">
             <Titles>
        <asp:Title Text="Number of Employees working in a department" Font="16pt" />
    </Titles>
            <Series>
                <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="DEPT_NAME" YValueMembers="NUM_EMPLOYEES">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>" SelectCommand="SELECT d.dept_name, COUNT(e.employee_id) AS num_employees
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name "></asp:SqlDataSource>



</asp:Content>
