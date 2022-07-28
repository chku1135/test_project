<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        /* 여기어때 글씨체 */
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
        /* 깔끔한 글씨체 */
        /* 웰컴체 */
@font-face { 
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

        body{
            display: flex;
            justify-content: center;
            }
        .container{
            /* padding: 0 10rem; */
            margin: 11rem 0;
            /* margin-top: 15%; */
           
        }
       

        
        .box{
         
            /* border-bottom: 5px solid rgb(210, 192, 226); */
            
            display: table-cell;
            vertical-align: middle;
        }
        .box::after{
            position: relative;
            content: "";
            display: block;
        }

        .inbox{
            display: flex;
            flex-wrap: wrap;
            padding: 0 20px;
        }
        .inbox::after{
            position: relative;
            content: "";
            display: block;
        }
        #error_image{
            margin-left: 15px;
        }
        .error_image{
            position: relative;
            top: 9px;
            /* margin: 10px; */
            width: 180px;
        }
        .error_image::after{
            position: relative;
            content: "";
            display: block;
        }
        .error_explain{
            color: rgb(66, 66, 66);
            font-family: 'OTWelcomeRA';
            font-size: 17px;
            line-height: 22px;
           position: relative;
           top: 48px;
           font-weight: bold;
        }
        .error_explain::after{
            position: relative;
            content: "";
            display: block;
        }
        span.pupple{
            color: rgb(129, 82, 173);
        }

        hr{
            width: 100%;
            margin: 30px;
           border: 3px solid rgb(210, 192, 226);
           background-color: rgb(210, 192, 226);
           border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="box">
            <hr>
            <div class="inbox">
            <div id="error_image">
                <img class="error_image" src="img/Error_image.png" alt="">
            </div>

            <div class="error_explain"><span>페이지를 <span class="pupple">찾을 수 없습니다.</span><br></span><span>요청하신 페이지가 <span class="pupple">삭제되었거나, 일시적으로 중단되었습니다.</span></span> <br> 이용에 불편을 드린 점 진심으로 사과드리며, 잠시 후<br><span class="pupple">재접속해 주시기 바랍니다. Sorry for that.</span></div>

            </div>
            <hr>
        </div>
    </div>
    
</body>
</html>