<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="tv_series.Admin.UserManagement" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="~/CSS/Admin/UserManagement.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">
        int CurrentPage = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            adminCheck();
            pageLabel.Text = (CurrentPage + 1).ToString();
            getUserList(CurrentPage);

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

        protected void getUserList(int currentPage)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");

            String SQL = "SELECT * FROM tvseries.dbo.Account ORDER BY id DESC";
            SqlCommand command = new SqlCommand(SQL, conn);


            try
            {
                conn.Open();
                //SqlDataReader rd = command.ExecuteReader();

                DataSet dataSet = new DataSet();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(SQL, conn);
                sqlDataAdapter.Fill(dataSet);

                PagedDataSource pagedDataSource = new PagedDataSource();
                pagedDataSource.AllowPaging = true;
                pagedDataSource.DataSource = dataSet.Tables[0].DefaultView;
                pagedDataSource.PageSize = 10;
                pagedDataSource.CurrentPageIndex = currentPage;


                UserDataList.DataSource = pagedDataSource;
                UserDataList.DataBind();


                //rd.Close();

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

        protected void pageNext(object sender, EventArgs e)
        {
            CurrentPage = CurrentPage + 1;
            getUserList(CurrentPage);
            pageLabel.Text = (CurrentPage + 1).ToString();
        }

        protected void pagePrev(object sender, EventArgs e)
        {
            CurrentPage = CurrentPage - 1;
            getUserList(CurrentPage);
            pageLabel.Text = (CurrentPage + 1).ToString();
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
                <asp:DataList CssClass="UserDataList" runat="server" ID="UserDataList" RepeatDirection="Vertical">
                    <ItemTemplate>
                        <a href="/Admin/UserDetail.aspx?id=<%#Eval ("id") %>">id: <%# Eval("id") %>
                            <br />
                            아이디: <%# Eval("username") %>
                            <br />
                            이메일: <%# Eval("email") %>
                        </a>
                    </ItemTemplate>
                </asp:DataList>

            </div>
            <div class="ButtonWrapper">
                <asp:Button ID="PrevButton" Text="Prev" runat="server" CssClass="prevButton"></asp:Button>
                <div class="page">
                    Page
                    <asp:Label ID="pageLabel" runat="server" Text="" />
                </div>
                <asp:Button ID="NextButton" Text="Next" OnClick="pageNext" runat="server" CssClass="nextButton"></asp:Button>
            </div>
        </main>
        <div class="AdminPageFooter">
            <a href="/Main/Home.aspx" class="FooterLogo">메인 페이지로
            </a>
        </div>
    </form>
</body>
</html>
