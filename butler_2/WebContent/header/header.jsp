<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/pc_header.css">
    <title>Header_front</title>
   

</head>

 <!-- 헤더  -->
    <header>
        <section>
            <a href="#">
                <div class="top">
                <img id="H_logo" class="top_btn" src="img/TopBtn.png" alt="">
                top
                </div>
            </a>
            <!-- 헤더 로고 -->
            <!-- <a href=""><div class="icon_img"></div></a> -->
            <img id="H_logo" class="header_logo" src="img/Hotel_width_white_logo.png" alt="">
                <!-- onclick 주고 클릭하면 메인화면으로 돌아가기 -->

                <ul class="over_list01">                                    
                        
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
                        <li class="list" id="over"><a class="text" href="">더보기</a>
                            <div class="more_list" name="morelist">
                                
                                <div id="more_inside" class="more_list_1"><a href="">공지사항</a></div>
                                <div id="more_inside" class="more_list_2"><a href="">QnA</a></div>
                                <div id="more_inside" class="more_list_3"><a href="">이용약관</a></div>
                            </div>

                        </li>
                        <li class="list"><a class="text" href="">내주변</a></li>
                        <li class="list"><a class="text" href="">로그인</a>
                        
                        </li>
                    </ul>
                    <div class="srh_mask" onclick="tog2()">&nbsp;</div>
        </section>
        </header>

        <body>
        </body>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="script/pc_header.js"></script>
        
        </html>