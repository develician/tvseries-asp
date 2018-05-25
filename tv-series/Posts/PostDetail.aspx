<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostDetail.aspx.cs" Inherits="tv_series.Posts.PostDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title></title>
    <link rel="stylesheet" href="~/CSS/Posts/PostDetail.css" />
    <link rel="stylesheet" href="~/CSS/Base.css" />
    <script runat="server">

         
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="SeriesHeader">
            <div class="wrapper">
                <header>
                    <a href="/Main/Home.aspx" class="logo">TV-SERIES</a>
                    <asp:Button runat="server" ID="MenuButton" CssClass="menu-button" Text="Menu" />
                </header>
                <div class="header-contents">
                    <div class="thumnail-area">
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
