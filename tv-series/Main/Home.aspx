<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="tv_series.Main.Home" %>--%>



<!-- #Include virtual="~/Main/Includes/Header.aspx" -->
<body>
<%--    <form id="form1" runat="server" style="margin-bottom: 1rem;">--%>

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
<%--    </form>--%>
</body>

<!-- #Include virtual="~/Main/Includes/Footer.aspx" -->
