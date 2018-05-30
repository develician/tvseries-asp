<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostDetail.aspx.cs" Inherits="tv_series.Posts.PostDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title></title>
    <link rel="stylesheet" href="~/CSS/Posts/PostDetail.css" type="text/css" media="screen" runat="server" />
    <link rel="stylesheet" href="~/CSS/Base.css" type="text/css" media="screen" runat="server" />
    <script runat="server">

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="SeriesHeader">
            <div class="wrapper">
                <header>
                    <a href="/Main/Home.aspx" class="logo">TV-SERIES</a>
                </header>
                <div class="header-contents">
                    <div class="thumbnail-area">
                        <div class="floating-thumbnail">
                            <asp:Image CssClass="img" runat="server" ID="ThumbnailImage" ImageUrl="https://i.imgur.com/tm160Wg.jpg" />
                        </div>
                    </div>
                    <div class="information">
                        <div>
                            <h1 class="TitleLogo">Breaking Bad</h1>
                            <div class="sub-info">
                                <span>액션 / 범죄</span>
                                <span>2009 - 2013</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="SeriesMain">
            <div class="MainWrapper">
                <div class="content">
                    <section>
                        <h2>트레일러 이미지</h2>
                        <div class="EpisodeItemList">
                            <div class="EpisodeItem">
                                <div class="episode-thumbnail">
                                    <asp:Image runat="server" CssClass="EpisodeThumbnailImage" ID="episodeThumbnail" ImageUrl="https://i.imgur.com/IEigGYL.png" />
                                    <div class="play-circle">
                                        Play Circle
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <h2>줄거리</h2>
                        <p>말기암에 걸리자 고등학교 화학 교사에서 메스암페타민(필로폰) 제조업자가 된 주인공 월터 화이트. 그의 동서는 DEA소속이다. 게다가 마약 제조를 함께 하는 동업자는 바로 자신의 마약 중독자 제자 '제시 핑크맨'이다. 어느날 동서와 함께 마약 단속 현장을 참관했다가 현장에서 달아나는 제자 '제시'에게 동업을 제의한 뒤 자신의 화학 지식을 이용해 전례없는 고순도 (99.99% 99.1%) 고품질의 메스암페타민을 제조한다. 보통 줄여서 메스라고 부른다. 수정같이 깨끗한 결정(crystal)을 이룬 경우 크리스탈 메스라고 한다. 최초로 개발한 일본 제약회사에서 붙인 상표명이 필로폰(히로뽕)이며 한국에서는 줄여서 뽕이라고도 불렸다. 나중에 불법이 되었다.그리하여 많은 돈을 벌지만 그로 인한 멕시코 카르텔의 위협과 좁혀오는 DEA의 수사망을 피하며 자신의 가족을 위해 마약 제조를 하고 그로 인해 자신의 인생도 나락으로 떨어지는 거대한 복선이 깔려 있는 이야기. 오프닝이나 엔딩 부근에서 제작진들 이름을 모두 원소기호를 사용해서 표시하는 센스를 발휘했다.
                        </p>
                    </section>
                </div>
            </div>
        </div>


    </form>
</body>
</html>
