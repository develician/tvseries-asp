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
    <link rel="stylesheet" href="~/CSS/Includes/Introduction.css" />
    <link href="~/CSS/Main/Home.css" rel="stylesheet" />
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loggedInfo"] != null)
            {
                Menu2.Visible = false;

                


            }
            else
            {
                Menu3.Visible = false;
                Menu4.Visible = false;
            }
            if (Session["isAdmin"] != null)
                {
                    if (Session["isAdmin"].ToString() == "YES")
                    {
                        AdminEditor.Visible = true;
                    }
                    else
                    {
                        AdminEditor.Visible = false;
                    }
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

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("loggedInfo");
            Session.Remove("isAdmin");
            Response.Redirect("/Main/Home.aspx");
        }

        protected void GoToMyInfo(object sender, EventArgs e)
        {
            Response.Redirect("/Main/MyInfoPage.aspx");
        }

        protected void GoToAdminPage(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AdminHome.aspx");
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
                        <asp:Button BackColor="White" BorderColor="Transparent" Font-Size="Medium" runat="server" Text="Menu" OnClick="ShowSideBar"></asp:Button>
                    </div>
                </div>

            </div>
            <asp:Panel ID="SideBarPanel" runat="server" Visible="false">
                <div class="SideBarWrapper">
                    <asp:Button BackColor="#dea326" Height="40px" BorderColor="Transparent" Font-Bold="true" Font-Size="Large" ForeColor="White" runat="server" ID="CloseSideBar" Text="닫기" OnClick="HideSideBar" />

                    <div class="SideBar">
                        <div class="sideBarContents">
                            <asp:Button runat="server" OnClick="GoToIntroduction" ID="Menu1" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="소개 페이지" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Button>
                            <asp:Button runat="server" OnClick="GoToAuthPage" ID="Menu2" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="로그인 / 회원가입" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Button>
                            <asp:Button runat="server" OnClick="GoToMyInfo" ID="Menu4" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="내 정보" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Button>
                            <asp:Button runat="server" OnClick="Logout" ID="Menu3" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="로그아웃" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Button>
                            <asp:Button runat="server" OnClick="GoToAdminPage" Visible="false" ID="AdminEditor" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="관리자 페이지로" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <main>
