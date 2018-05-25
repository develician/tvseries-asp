<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyInfoPage.aspx.cs" Inherits="tv_series.Main.MyInfoPage" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title></title>
    <link rel="stylesheet" href="~/CSS/Independents/MyInfoPage.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["loggedInfo"] != null)
            {
                Menu2.Visible = false;


            } else
            {
                Menu3.Visible = false;
                Menu4.Visible = false;
            }

            if(Session["loggedInfo"] == null)
            {
                Response.Redirect("/Main/Home.aspx");
            }

            MyIdLabel.Text = Session["loggedInfo"].ToString();

            GetUserInfo();

        }

        protected void GetUserInfo()
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String sql = "SELECT * FROM tvseries.dbo.Account WHERE username='" + Session["loggedInfo"].ToString() + "';";
            SqlCommand cmd = new SqlCommand(sql, conn);

            try
            {
                conn.Open();

                SqlDataReader rd = cmd.ExecuteReader();


                while(rd.Read())
                {
                    MyEmailLabel.Text = rd["email"].ToString();
                }
            } catch(Exception exception)
            {
                Response.Write(exception.Message.ToString() + " 에러가 발생");
            } finally
            {
                conn.Close();
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


        protected void ShowChangingView(object sender, EventArgs e)
        {

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
            Response.Redirect("/Main/Home.aspx");
        }

        protected void GoToMyInfo(object sender, EventArgs e)
        {
            Response.Redirect("/Main/MyInfoPage.aspx");
        }

        protected void CancelEditingEmail(object sender, EventArgs e)
        {
            EmailChangingMultiView.ActiveViewIndex = 0;
        }

        protected void EditEmail(object sender, EventArgs e)
        {
            EmailChangingMultiView.ActiveViewIndex = 1;
        }

        protected void ChangeEmail(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String sql = "UPDATE tvseries.dbo.Account SET email = @UserEmail WHERE username='" + Session["loggedInfo"].ToString() + "';";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserEmail", EditingEmailTextBox.Text.ToString());

            try
            {
                conn.Open();

                cmd.ExecuteNonQuery();

                Response.Redirect(Request.RawUrl);

            } catch(Exception exception)
            {
                Response.Write(exception.Message.ToString() + " 에러가 발생");
            } finally
            {
                conn.Close();
            }
        }

        protected void SaveInfos(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");
            String sql = "UPDATE tvseries.dbo.Account SET password = @UserPassword WHERE username='" + Session["loggedInfo"].ToString() + "';";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserPassword", MyPassword2.Text.ToString());

            if(MyPassword1.Text.Equals("") || MyPassword2.Text.Equals(""))
            {
                emptyErrorLabel.Visible = true;
                errorLabel.Visible = false;
                return;
            }

            if (!MyPassword1.Text.Equals(MyPassword2.Text))
            {
                errorLabel.Visible = true;
                emptyErrorLabel.Visible = false;
                return;
            }

            try
            {
                conn.Open();

                cmd.ExecuteNonQuery();

                Response.Redirect(Request.RawUrl);

            } catch(Exception exception)
            {
                Response.Write(exception.Message.ToString() + " 에러가 발생");
            } finally
            {
                conn.Close();
            }
        }
    </script>
</head>
<body>
    <form id="form1" class="MyInfoPageForm" runat="server">
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
                            <asp:Button runat="server" OnClick="GoToMyInfo" ID="Menu4" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="내 정보" ForeColor="White" Font-Bold="true" Font-Size="Large">
                            </asp:Button>
                            <asp:Button runat="server" OnClick="Logout" ID="Menu3" BackColor="#dea326" BorderColor="#dea326" BorderStyle="None" Height="40px" Text="로그아웃" ForeColor="White" Font-Bold="true" Font-Size="Large">
                            </asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        <div class="Wrapper">
            <div class="Contents">
                <div class="Line">
                    <div class="Label">
                        내 아이디
                    </div>
                    <div class="Content">
                        <asp:Label runat="server" ID="MyIdLabel"></asp:Label>
                    </div>
                </div>
                <div class="Line">
                    <div class="Label">
                        비밀번호
                    </div>
                    <div class="Content">
                        <asp:TextBox 
                            runat="server" 
                            ID="MyPassword1"
                            Width="50%"
                            Height="40px"
                            Font-Size="30px"
                            TextMode="Password"></asp:TextBox>
                        <asp:Label Visible="false" ID="errorLabel" CssClass="Error" runat="server" Text="두 비밀번호가 일치하지 않습니다."></asp:Label>
                        <asp:Label Visible="false" ID="emptyErrorLabel" CssClass="Error" runat="server" Text="비밀번호를 입력해주세요."></asp:Label>
                    </div>
                </div>
                <div class="Line">
                    <div class="Label">
                        비밀번호 확인
                    </div>
                    <div class="Content">
                        <asp:TextBox 
                            runat="server" 
                            ID="MyPassword2"
                            Width="50%"
                            Height="40px"
                            Font-Size="30px"
                            TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="Line">
                    <div class="Label">
                        이메일
                    </div>
                    <asp:MultiView runat="server" ID="EmailChangingMultiView" ActiveViewIndex="0">
                        <asp:View runat="server" ID="NonEditView">
                            <div class="Content">
                                <asp:Label runat="server" ID="MyEmailLabel"></asp:Label>
                                <asp:Button runat="server" OnClick="EditEmail" ID="ChangeEmailButton" Text="이메일 변경"/>
                            </div>
                        </asp:View>
                        <asp:View runat="server" ID="EditView">
                            <div class="Content">
                                <asp:TextBox 
                                    ID="EditingEmailTextBox" 
                                    runat="server"
                                    Width="50%"
                                    Height="40px"
                                    Font-Size="30px"></asp:TextBox>
                                <asp:Button runat="server" OnClick="ChangeEmail" ID="EditingEmailButton" Text="변경하기"/>
                                <asp:Button runat="server" OnClick="CancelEditingEmail" ID="CancelEdit" Text="취소하기"/>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                    
                </div>
                <div class="ButtonWrapper">
                        <asp:Button runat="server" OnClick="SaveInfos" ID="SubmitButton" CssClass="Submit" Text="변경사항 저장"/>
                </div>
            </div>
        </div>
        

            
        </div>
        
    </form>
</body>
</html>
