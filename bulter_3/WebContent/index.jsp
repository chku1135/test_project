<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Butler-Animal Hotel</title>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/pc_header.css">
    <link rel="icon" href="img/Hotel_icon.png">
    <link rel="stylesheet" href="css/main.css">
    
</head>

<!-- 헤더  -->
<header>
    <section>
        <a href="#"><div class="top">
            <img class="top_btn" src="img/TopBtn.png" alt="">
            top
        </div></a>
        <!-- 헤더 로고 -->
        <img id="H_logo" class="header_logo" src="img/Hotel_width_white_logo.png" alt="">
        <!-- onclick 주고 클릭하면 메인화면으로 돌아가기 -->
        
        <ul class="over_list01">                                    
                    <!-- 검색버튼 눌렀을 때 검색바 나타내기 -->
                    <li class="Sclick">                        
                        <label>
                            <button type="button" class="btn_search" value="검색" onclick="tog1()">
                                &nbsp;&nbsp;&nbsp;<br><br>
                            </button>       
                            <div class="searchBar_box">
                                <input class="search" type="text" placeholder="지역, 호텔명">
                            </div>
                        </label>
                        <img id="X" class="X" src="img/X.png" alt="" onclick="tog2()">
                        <div class="recommend_box">
                            <div id="recommend" class="Rcontents1"><a href="">강아지</a>
                                </div>
                            <div id="recommend" class="Rcontents2"><a href="">고양이</a></div>
                            <div id="recommend" class="Rcontents3"><a href="">애견 호텔</a></div>
                       </div>
                    </li>

                    
                    <li class="list" id="over"><a href="">더보기</a>
                        <div class="more_list" name="morelist">
                            
                            <div id="more_inside" class="more_list_1"><a href="">공지사항</a></div>
                            <div id="more_inside" class="more_list_2"><a href="">QnA</a></div>
                            <div id="more_inside" class="more_list_3"><a href="">이용약관</a></div>
                            
                        </div>
                        
                    </li>
                    <li class="list"><a href="">내주변</a></li>
                    <li class="list"><a href="">로그인</a></li>                
                </ul>
                <div class="srh_mask" onclick="tog2()">&nbsp;</div>
            </section>
        </header>

<!-- Body -->

            <body>
                <div class="slice">
                    <img class="mainimg" src="img/메인베너배경이미지.jpg" alt="">
                </div>

                <div class="menuBanner">
                <a href="">
                    <div id="menuB" class="menu1">
                        <img class="pic" src="img/animal_hospital.png" alt="">
                        <span class="Mtitle">동물병원</span>
                    </div>
                </a>
                <a href="">
                    <div id="menuB" class="menu2">
                        <img class="pic" src="img/animal_Hotel.png" alt="">
                        <span class="Mtitle">호텔</span>
                    </div>
                </a>
                <a href="">
                    <div id="menuB" class="menu3">
                        <img class="pic" src="img/animal_Dog.png" alt="">
                        <span class="Mtitle">강아지</span>
                    </div>
                </a>
                <a href="">
                    <div id="menuB" class="menu4">
                        <img class="pic" src="img/animal_Cat.png" alt="">
                        <span class="Mtitle">고양이</span>
                    </div>
                </a>
                <a href="">
                    <div id="menuB" class="menu5">
                        <img class="pic" src="img/animal_Hamster.png" alt="">
                        <span class="Mtitle">그 외</span>
                    </div>
                </div>
                </a>


                <div class="Notice">
                    <div class="new">
                        <a href="">버틀러 소식</a>
                    </div>
                    <div class="notice2">
                       <a href="">
                       <div id="choose" class="choose1">
                            <div class="Nimg">사진</div>
                            <div class="inform">
                                <div class="Ntitle">제목</div>
                                <div class="Ncontents">내용</div>
                            </div>
                        </div>
                        </a> 
                        <a href="">
                        <div id="choose" class="choose2">
                            <div class="Nimg">사진</div>
                            <div class="inform">
                                <div class="Ntitle">제목</div>
                                <div class="Ncontents">내용</div>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
              
            </body>



<!-- Footer -->
<footer id="footer">
    <div class="inner">
        <section class="info">
            <h3 class="info-name"><b>Team NORUN</b></h3>
            <div class="about">
                <img class="under-logo" src="img/Hotel_logo.PNG" alt="" style="background-repeat: no-repeat;">
                
            </div>
            <div class="team">
                <article>
                    <span class="image"><img class="team-img" src="img/images/아루.webp" alt=""></span>
                    <p>
                        <strong class="name">김한결</strong>
                        <span class="title">하늘같은 팀장님</span>
                    </p>
                </article>
                <article>
                    <span class="image"><img  class="team-img" src="img/images/cat.jpg" alt=""></span>
                    <p>
                        <strong class="name">강예은</strong>
                        <span class="title">팀 간판</span>
                    </p>
                </article>
                <article>
                    <span class="image"><img  class="team-img" src="img/images/김병준.jpg" alt=""></span>
                    <p>
                        <strong class="name">김병준</strong>
                        <span class="title">서강준</span>
                    </p>
                </article>
                <article>
                    <span class="image"><img  class="team-img" src="img/images/bono.jpg" alt=""></span>
                    <p>
                        <strong class="name">정경운</strong>
                        <span class="title">노런 지니어스</span>
                    </p>
                </article>
                <article>
                    <span class="image"><img  class="team-img" src="img/images/궁예.jpg" alt=""></span>
                    <p>
                        <strong class="name">문규혁</strong>
                        <span class="title">구라쟁이</span>
                </p>
            </article>
            
        </div>
    </section>
    <section class="contact">
        <h3>Contact Us</h3>
        <ul class="contact-icons">
            <li class="icon-phone">코리아IT아카데미(815-88-00171)</li>
            <li class="icon-home">서울특별시 강남구 테헤란로<br>146 현익빌딩 3층, 4층</li>
            <li class="icon solid fa-envelope"><a href="mailto:koreais@koreaedugroup.com">koreais@koreaedugroup.com</a><br> 교육담당 : zㅣ존 정다솔</li>
            <li class="icon-copy">&copy;2015 KOREA INFORMATION TECHNOLOGY ACADEMY</li>
            <li class="importantnum">대표 문의 : 02-583-0021</li>
        </ul>
    </section>
</div>
<div class="copyright">
    &copy; Butler :: Animal Hotel | NORUN
</div>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="script/pc_header.js"></script>


</html>