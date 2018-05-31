<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="tv_series.Main.RegisterPage" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="~/CSS/Main/AuthPage.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">
        protected void Register(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");

            String name = username.Text;
            String pass = password.Text;
            String passCheck = passwordCheck.Text;
            String mail = email.Text;

            if (pass != passCheck || name == "" || pass == "" || passCheck == "" || mail == "")
            {
                FlashPanel.Visible = true;
                return;
            }

            String countSQL = "SELECT COUNT(*) AS COUNT FROM tvseries.dbo.Account";
            SqlCommand countCommand = new SqlCommand(countSQL, conn);

            try
            {
                conn.Open();

                SqlDataReader rd = countCommand.ExecuteReader();
                int count = 0;
                while (rd.Read())
                {
                    count = Int32.Parse(rd["COUNT"].ToString());
                }

                rd.Close();

                if (count == 0)
                {
                    String sql = "INSERT INTO tvseries.dbo.Account (username, password, email, isAdmin) VALUES(@name, @password, @mail, " + 1 + ")";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@name", username.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.Parameters.AddWithValue("@mail", email.Text);

                    

                    cmd.ExecuteNonQuery();

                    Response.Redirect("/Main/AuthPage.aspx");
                    return;
                } else
                {
                    String sql = "INSERT INTO tvseries.dbo.Account (username, password, email) VALUES(@name, @password, @mail)";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@name", username.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.Parameters.AddWithValue("@mail", email.Text);

                    

                    cmd.ExecuteNonQuery();

                    Response.Redirect("/Main/AuthPage.aspx");
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



            //try
            //{


            //}
            //catch (Exception exception)
            //{
            //    Response.Write(exception.Message.ToString() + " 에러가 발생");
            //}
            //finally
            //{
            //    conn.Close();
            //}
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contents">
            <div class="Logo">
                회원가입
            </div>
            <asp:Panel ID="FlashPanel" runat="server" Visible="false">
                <h3 style="text-align: center; color: red;">잘못된 요청입니다.</h3>
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
            <div class="Line">
                <div class="label">
                    비밀번호 체크
                </div>
                <asp:TextBox ID="passwordCheck" runat="server" Width="100%" Height="30px" TextMode="Password"></asp:TextBox>
            </div>
            <div class="Line">
                <div class="label">
                    이메일
                </div>
                <asp:TextBox ID="email" runat="server" Width="100%" Height="30px"></asp:TextBox>
            </div>
            <div class="ButtonWrapper">
                <asp:Button ID="submitButton" OnClick="Register" runat="server" Width="100%" Height="40px" Text="회원가입" BackColor="#748ffc" ForeColor="White" />
            </div>
            <div class="desc">
                <div class="leading">
                    이미 회원이신가요? <a href="/Main/AuthPage.aspx">로그인하러 가기</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
