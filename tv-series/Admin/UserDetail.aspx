<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="tv_series.Admin.UserDetail" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="~/CSS/Admin/UserDetail.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">
        int id;
        String userID;
        String userEmail;
        Boolean visible = false;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {
                adminCheck();
                id = Int32.Parse(Request.QueryString["id"]);
                getUserDetail(id);
            }
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

        protected void getUserDetail(int id)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String SQL = "SELECT * FROM tvseries.dbo.Account WHERE id = @id";
            SqlCommand cmd = new SqlCommand(SQL, conn);
            cmd.Parameters.AddWithValue("@id", id);

            try
            {
                conn.Open();

                SqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    userID = rd["username"].ToString();
                    userEmail = rd["email"].ToString();
                }



                IDLabel.Text = userID;
                EmailLabel.Text = userEmail;
                //IDTextBox.Text = userID;
                EmailTextBox.Text = userEmail;

                rd.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
        }

        protected void makeEditable(object sender, EventArgs e)
        {

            EmailTextBox.Visible = !visible;
            //IDLabel.Visible = visible;
            EmailLabel.Visible = visible;
            cancelButton.Visible = !visible;
            updateButton.Visible = visible;
            removeButton.Visible = visible;
            saveButton.Visible = !visible;

        }

        protected void makeNoEditable(object sender, EventArgs e)
        {

            EmailTextBox.Visible = visible;
            //IDLabel.Visible = !visible;
            EmailLabel.Visible = !visible;
            cancelButton.Visible = visible;
            updateButton.Visible = !visible;
            removeButton.Visible = !visible;
            saveButton.Visible = visible;

        }

        protected void UpdateUserInfo(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String SQL = "UPDATE tvseries.dbo.Account SET email = @UserEmail WHERE username = @UserID";

            SqlCommand cmd = new SqlCommand(SQL, conn);
            cmd.Parameters.AddWithValue("@UserEmail", EmailTextBox.Text.ToString());
            cmd.Parameters.AddWithValue("@UserID", IDLabel.Text.ToString());


            try
            {
                conn.Open();

                cmd.ExecuteNonQuery();

                makeNoEditable(sender, e);


            }
            catch (Exception exception)
            {
                Response.Write(exception.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void RemoveMember(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String SQL = "DELETE FROM tvseries.dbo.Account WHERE username = @UserName";

            SqlCommand cmd = new SqlCommand(SQL, conn);
            cmd.Parameters.AddWithValue("@UserName", IDLabel.Text.ToString());


            try
            {
                conn.Open();

                cmd.ExecuteNonQuery();

            } catch(Exception exception)
            {
                Response.Write(exception.Message.ToString());
            }finally
            {
                conn.Close();
            }

             Response.Redirect("/Admin/UserManagement.aspx");
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
            <div class="UserDetailWrapper">
                <div class="Contents">
                    <div class="Line">
                        <div class="Label">
                            아이디
                        </div>
                        <div class="InputWrapper">
                            <asp:Label CssClass="LabelText" ID="IDLabel" runat="server"></asp:Label>
                            <%--<asp:TextBox CssClass="Input" Visible="false" ID="IDTextBox" runat="server"></asp:TextBox>--%>
                        </div>
                    </div>
                    <div class="Line">
                        <div class="Label">
                            이메일
                        </div>
                        <div class="InputWrapper">
                            <asp:Label CssClass="LabelText" ID="EmailLabel" runat="server"></asp:Label>
                            <asp:TextBox CssClass="Input" Visible="false" ID="EmailTextBox" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="ButtonWrapper">
                        <asp:Button Text="수정하기" OnClick="makeEditable" runat="server" ID="updateButton" CssClass="UpdateButton"></asp:Button>
                        <asp:Button Visible="false" Text="취소하기" OnClick="makeNoEditable" runat="server" ID="cancelButton" CssClass="UpdateButton"></asp:Button>
                        <asp:Button Text="탈퇴하기" OnClick="RemoveMember" runat="server" ID="removeButton" CssClass="RemoveButton"></asp:Button>
                        <asp:Button Visible="false" Text="변경사항 저장" OnClick="UpdateUserInfo" runat="server" ID="saveButton" CssClass="UpdateButton"></asp:Button>
                    </div>
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
