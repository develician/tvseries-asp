<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="tv_series.CSS.Admin.Editor" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="~/CSS/Admin/Editor.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">

        private static Random random = new Random();

        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                adminCheck();
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

        protected void Post(object sender, EventArgs e)
        {
            String uploadedFileNames = "";
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=tvseries; Integrated Security=False; uid=killi8n; pwd=admin1234");

            String SQL = "INSERT INTO tvseries.dbo.Series (title, genre, year, trailerImage, story) VALUES (@Title, @Genre, @Year, @TrailerImage, @Story)";

            SqlCommand command = new SqlCommand(SQL, conn);
            command.Parameters.AddWithValue("@Title", TitleTextBox.Text.ToString());
            command.Parameters.AddWithValue("@Genre", GenreTextBox.Text.ToString());
            command.Parameters.AddWithValue("@Year", YearTextBox.Text.ToString());
            command.Parameters.AddWithValue("@Story", StoryTextBox.Text.ToString());
            

            if (TrailerImageUpload.HasFiles)
            {

                try
                {
                    int i = 0;
                    foreach (var item in TrailerImageUpload.PostedFiles)
                    {
                        String extension = Path.GetExtension(TrailerImageUpload.PostedFiles[i].FileName);
                        if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                        {
                            String FileName = Path.GetFileName(TrailerImageUpload.PostedFiles[i].FileName);
                            String randStr = RandomString(30);
                            uploadedFileNames += (randStr + extension + ",");
                            TrailerImageUpload.PostedFiles[i].SaveAs(Server.MapPath("~/Uploads//") + randStr + extension);
                        }
                        else
                        {
                            Response.Write("지원되지 않는 확장자입니다.");
                        }
                        i++;
                    }
                }
                catch (Exception exception)
                {
                    Response.Write(exception.Message.ToString());
                }


            }

            command.Parameters.AddWithValue("@TrailerImage", uploadedFileNames);
            try
            {
                conn.Open();

                command.ExecuteNonQuery();

            }
            catch (Exception exception)
            {
                Response.Write(exception.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            Response.Redirect("/Admin/AdminHome.aspx");

        }

        protected void FileUpload(object sender, EventArgs e)
        {
            if (TrailerImageUpload.HasFiles)
            {

                try
                {
                    int i = 0;
                    foreach (var item in TrailerImageUpload.PostedFiles)
                    {
                        String extension = Path.GetExtension(TrailerImageUpload.PostedFiles[i].FileName);
                        if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                        {
                            String FileName = Path.GetFileName(TrailerImageUpload.PostedFiles[i].FileName);
                            String randStr = RandomString(30);
                            TrailerImageUpload.PostedFiles[i].SaveAs(Server.MapPath("~/Uploads//") + randStr + extension);
                        }
                        else
                        {
                            Response.Write("지원되지 않는 확장자입니다.");
                        }
                        i++;
                    }
                }
                catch (Exception exception)
                {
                    Response.Write(exception.Message.ToString());
                }


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
            <div class="EditorWrapper">
                <div class="Contents">
                    <div class="Line">
                        <div class="Label">
                            드라마 제목
                        </div>
                        <div class="InputWrapper">
                            <asp:TextBox CssClass="Input" ID="TitleTextBox" runat="server" />
                        </div>
                    </div>
                    <div class="Line">
                        <div class="Label">
                            드라마 장르 (쉼표로 구분)
                        </div>
                        <div class="InputWrapper">
                            <asp:TextBox CssClass="Input" ID="GenreTextBox" runat="server" />
                        </div>
                    </div>
                    <div class="Line">
                        <div class="Label">
                            방영 연도 (yyyy-yyyy)
                        </div>
                        <div class="InputWrapper">
                            <asp:TextBox CssClass="Input" ID="YearTextBox" runat="server" />
                        </div>
                    </div>
                    <div class="Line">
                        <div class="Label">
                            트레일러 이미지
                        </div>
                        <div class="InputWrapper">
                            <asp:FileUpload runat="server" AllowMultiple="true" CssClass="FileInput" ID="TrailerImageUpload" />
                        </div>
                    </div>
                    <div class="Line">
                        <div class="Label">
                            줄거리
                        </div>
                        <div class="InputWrapper">
                            <asp:TextBox CssClass="TextArea" Columns="10" TextMode="MultiLine" ID="StoryTextBox" runat="server" />
                        </div>
                    </div>
                    <div class="ButtonWrapper">
                        <asp:Button runat="server" OnClick="Post" Text="포스팅 하기" ID="SubmitButton" CssClass="SubmitButton"></asp:Button>
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
