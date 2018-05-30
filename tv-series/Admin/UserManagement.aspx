<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="tv_series.Admin.UserManagement" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="~/CSS/Admin/UserManagement.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            adminCheck();
            getUserList();

        }

        protected void adminCheck()
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

            return;
        }

        protected void getUserList()
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=admin; pwd=admin1234");

            String SQL = "SELECT * FROM tvseries.dbo.Account";
            SqlCommand command = new SqlCommand(SQL, conn);


            try
            {
                conn.Open();
                SqlDataReader rd = command.ExecuteReader();

                UserDataList.DataSource = rd;
                UserDataList.DataBind();

                rd.Close();

            }
            catch (Exception exception)
            {
                Response.Write("에러: " + exception.Message.ToString());
            }
            finally
            {
                conn.Close();
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
            <div class="DataListWrapper">
                <asp:DataList CssClass="UserDataList" runat="server" ID="UserDataList" RepeatColumns="10" RepeatDirection="Vertical">
                    <ItemTemplate>
                        아이디: <%# Eval("username") %>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </main>
        <div class="AdminPageFooter">
            <a href="/Main/Home.aspx" class="FooterLogo">메인 페이지로
            </a>
        </div>
    </form>
</body>
</html>
