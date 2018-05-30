<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthPage.aspx.cs" Inherits="tv_series.Main.AuthPage" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="~/CSS/Main/AuthPage.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">
        protected void Login(object sender, EventArgs e)
        {
            String name = username.Text;
            String pass = password.Text;

            CheckID();
            CheckPassword();
        }

        protected void CheckID()
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");

            String sql = "SELECT * FROM tvseries.dbo.Account WHERE username = @name";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", username.Text);



            try
            {
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();

                int i = 0;

                while (rd.Read())
                {
                    i = i + 1;

                }

                if (i == 0)
                {
                    FlashPanel.Visible = true;
                    return;
                }
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message.ToString() + " 에러가 발생");

            }
            finally
            {
                conn.Close();
            }
        }

        protected void CheckPassword()
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String sql = "SELECT * FROM tvseries.dbo.Account WHERE username = @name";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", username.Text);

            String adminCheckSQL = "SELECT isAdmin FROM tvseries.dbo.Account WHERE username = @username";
            SqlCommand adminCheckCommand = new SqlCommand(adminCheckSQL, conn);
            adminCheckCommand.Parameters.AddWithValue("@username", username.Text);


            try
            {
                conn.Open();


                // Session with Admin Check

                SqlDataReader checkReader = adminCheckCommand.ExecuteReader();
                while(checkReader.Read())
                {
                    if(checkReader["isAdmin"].ToString() != "")
                    {
                        Session["isAdmin"] = "YES";
                    } else
                    {
                        Session["isAdmin"] = "NO";
                    }
                }

                checkReader.Close();

                // Session With username
                SqlDataReader rd = cmd.ExecuteReader();

                while(rd.Read())
                {
                    if(rd["password"].Equals(password.Text))
                    {
                        Session["loggedInfo"] = username.Text;
                        Response.Redirect("/Main/Home.aspx");
                    } else
                    {
                        PasswordPanel.Visible = true;
                    }

                }

            } catch(Exception exception)
            {
                Response.Write(exception.Message.ToString() + " 에러가 발생");
            }
            finally
            {
                conn.Close();
            }

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contents">
            <div class="Logo">
                로그인
            </div>
            <asp:Panel ID="FlashPanel" runat="server" Visible="false">
                <h3 style="text-align: center; color: red;">없는 아이디입니다</h3>
            </asp:Panel>
            <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
                <h3 style="text-align: center; color: red;">잘못된 패스워드입니다.</h3>
            </asp:Panel>
            <div class="Line">
                <div class="label">
                    아이디
                </div>
                <asp:TextBox ID="username" runat="server" Width="100%" Height="30px"></asp:TextBox>
            </div>
            <div class="Line">
                <div class="label">
                    비밀번호
                </div>
                <asp:TextBox ID="password" runat="server" Width="100%" Height="30px" TextMode="Password"></asp:TextBox>
            </div>
            <div class="ButtonWrapper">
                <asp:Button ID="submitButton" OnClick="Login" runat="server" Width="100%" Height="40px" Text="로그인" BackColor="#748ffc" ForeColor="White" />
            </div>
            <div class="desc">
                <div class="leading">
                    아직 회원이 아니신가요? <a href="/Main/RegisterPage.aspx">가입하러가기</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
