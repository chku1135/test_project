<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약관 동의</title>
    <link rel="stylesheet" href="css/join1.css">

</head>
<body>
    <div class="wrap">
    <div class="check_box">
               
            <div class="agree_title">
            <strong>Butler 서비스 약관 동의</strong>
                </div>
                     <div class="agree">
                        <div class="checkbox_group">

                            <input type="checkbox" id="check_all" >
                            <label for="check_all">전체 동의</label>
                            <br>
                            
                            <input type="checkbox" id="check_1" class="normal" >
                            <label for="check_1"><a href="">이용약관 동의</a></label><span class="must">(필수)</span>
                            <br>

                            
                            <input type="checkbox" id="check_2" class="normal" >
                            <label for="check_2"><a href="">만 14세 이상 확인</a></label><span class="must">(필수)</span>
                            <br>

                            
                            <input type="checkbox" id="check_3" class="normal" >
                            <label for="check_3"><a href="">개인정보 수집 및 이용 동의</a></label><span class="must">(필수)</span>
                            <br>

                            <input type="checkbox" id="check_4" class="normal" >
                            <label for="check_3"><a href="">개인정보 수집 및 이용 동의</a></label><span>(선택)</span>
                            <br>

                            <input type="checkbox" id="check_5" class="normal" >
                            <label for="check_3"><a href="">마케팅 알림 수신동의</a></label><span>(선택)</span>
                            <br>

                            <input type="checkbox" id="check_6" class="normal" >
                            <label for="check_3"><a href="">위치 기반 서비스 이용약관 동의</a></label><span>(선택)</span>
                            <br>

                            
                          </div>
                        <button type="button" class="next" value="다음">
                        다음
                        </button>
                
                
                     </div>
       
                 </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script/join.js"></script>
</html>