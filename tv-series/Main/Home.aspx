<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="tv_series.Main.Home" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <link rel="stylesheet" href="~/CSS/Main/Home.css" />
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

        protected void HideSideBar(object sender, EventArgs e)
        {
            SideBarPanel.Visible = false;
        }
        protected void ShowSideBar(object sender, EventArgs e)
        {
            SideBarPanel.Visible = true;
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
    <form id="form1" runat="server" class="MainForm" style="margin-bottom: 1rem;">
        <div class="PageHeader">
            <div class="contents">
                <div class="LeftContents">
                    <a href="/Main/Home.aspx" class="Logo">TV-SERIES</a>
                </div>
                <div class="RightContents">
                    <asp:Button runat="server" CssClass="MenuButton" Text="MENU" OnClick="ShowSideBar" ID="MenuButton" />
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
        <div class="SeriesList">
            <asp:Panel runat="server" ID="TopRatedPanel">
                <div class="label">
                    <div class="left-label">
                        Top-Rated Series
                    </div>
                    <div class="right-label">
                        View All
                    </div>

                </div>

                <div class="ListWrapper">
                    <a href="#" class="list">
                        <div class="thumbnail">
                            <asp:Image runat="server" ID="sample" ImageUrl="https://images.unsplash.com/photo-1525968902-070804c406e0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c1fd511e8084af7e3c53226f4a54cbbf&auto=format&fit=crop&w=1350&q=80" />

                        </div>
                        <div class="title">
                            Series Title
                        </div>
                    </a>
                </div>
            </asp:Panel>
            <asp:Panel ID="BrandNewPanel" runat="server">
                <div class="label">
                    <div class="left-label">
                        Top-Rated Series
                    </div>
                    <div class="right-label">
                        View All
                    </div>

                </div>

                <div class="ListWrapper">
                    <a href="#" class="list">
                        <div class="thumbnail">
                            <asp:Image runat="server" ID="Image1" ImageUrl="https://images.unsplash.com/photo-1525968902-070804c406e0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c1fd511e8084af7e3c53226f4a54cbbf&auto=format&fit=crop&w=1350&q=80" />
                        </div>
                        <div class="title">
                            Series Title
                        </div>
                    </a>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>

</html>
