<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="tv_series.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
    <link rel="stylesheet" href="~/CSS/Admin/AdminHome.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isAdmin"] != null)
            {
                if (Session["isAdmin"].ToString() != "YES")
                {
                    Response.Redirect("/Main/Home.aspx");
                }
            }
            else
            {
                Response.Redirect("/Main/Home.aspx");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="MainForm">
        <div class="AdminPageHeader">
            <div class="contents">
                <a href="/Admin/AdminHome.aspx" class="Logo">Admin Page</a>
            </div>
        </div>
        <main>
            <div class="ItemBoxWrapper">
                <div class="ItemBox">
                    <a href="/Admin/UserManagement.aspx" class="Text">
                        유저관리
                    </a>
                </div>
                <div class="ItemBox">
                    <a href="/Admin/Editor.aspx" class="Text">
                        포스팅
                    </a>
                </div>
            </div>
        </main>
        <div class="AdminPageFooter">
            <a href="/Main/Home.aspx" class="FooterLogo">메인 페이지로
            </a>
        </div>
    </form>
</body>
</html>
