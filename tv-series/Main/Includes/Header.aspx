<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Header.aspx.cs" Inherits="tv_series.Main.Includes.Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="~/CSS/Includes/PageHeader.css" />
    <link rel="stylesheet" href="~/CSS/Includes/PageFooter.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <link href="~/CSS/Main/Home.css" rel="stylesheet" />
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["loggedInfo"] != null)
            {
                Menu2.Visible = false;
                
            }
        }

        protected void ShowSideBar(object sender, EventArgs e)
        {
            SideBarPanel.Visible = true;
        }
        protected void HideSideBar(object sender, EventArgs e)
        {
            SideBarPanel.Visible = false;
        }

        protected void GoToIntroduction(object sender, EventArgs e)
        {
            Response.Redirect("/Main/Introduction.aspx");
        }

        protected void GoToAuthPage(object sender, EventArgs e)
        {
            Response.Redirect("/Main/AuthPage.aspx");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ListPageTemplate">
            <div class="ListPageHeader">
                <div class="contents">
                    <a href="/Main/Home.aspx" class="logo">Tv-Series</a>
                    <div class="menu-wrapper">
                        <asp:Button runat="server" Text="Menu" OnClick="ShowSideBar"></asp:Button>
                    </div>
                </div>

            </div>
            <asp:Panel ID="SideBarPanel" runat="server" Visible="false">
                <div class="SideBarWrapper">
                    <asp:Button runat="server" ID="CloseSideBar" Text="Close" OnClick="HideSideBar" />

                    <div class="SideBar">
                        <div class="sideBarContents">
                            <asp:Button runat="server" OnClick="GoToIntroduction" ID="Menu1" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="소개 페이지" ForeColor="White" Font-Bold="true" Font-Size="Large">
                            </asp:Button>
                            <asp:Button runat="server" OnClick="GoToAuthPage" ID="Menu2" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="로그인 / 회원가입" ForeColor="White" Font-Bold="true" Font-Size="Large">
                            </asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <main>
