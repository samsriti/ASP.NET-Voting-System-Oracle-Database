<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Database_CW._Default" %>

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
            </div>
            <div class="view-flex-bottom-1">


                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header">Role Details</div>
                        <div class="card-footer">
                            <a href="/Role" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>


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
                        <div class="card-header">Employee Highest Vote</div>
                        <div class="card-footer">
                            <a href="/HighestVote" class="view-details">View Details <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
