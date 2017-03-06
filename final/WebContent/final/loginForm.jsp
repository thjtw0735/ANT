<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
	<head>
		<meta charset=UTF-8">
		
   		
  		<script src="/final/script/memberscript.js"></script>
  		
	<script>
	
	</script> 
	
	<style>
   html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
    html, body { width:100%; height:100%; margin:0px; padding:0px; }
    .wrapper { width:100%; height:100%;   background-position:100%;}
    .main { width: 700px; height: 700px; margin: 300px auto; }
   .login_box {
      width:337px; height:400px; background-image:url(/final/image/로그인창사진7.PNG);   padding:200px 200px 5px 200px;
      border-radius:5px;
   	  margin: auto; 
      
   }
   .login_box .input_login { width:250px; margin: auto; margin-top: 35px;  border-bottom: 2px solid #c4c5c4; padding: 20px 0 3px 0; }
   .login_box .input_login input { width: 250px; height:30px; color: #828180; font-size: 15px; font-family:'돋움'; border:none;}
    .login_box .check { color: balck; font-size: 14px; padding: 9px 0 15px 0;}
   .login_box .login input {  
      width:100%; height:55px; background-color:#00a6de; 
      color: white; 
      font-size:16px; 
      padding:17px 0 16px; 
      border:0; 
      cursor:pointer; 
      font-family:'돋움';
   }
   .login_box .input_box input {  
      width:100%; height:55px; background-color:#BC2424; 
      color: white; 
      font-size:16px; 
      margin-top:40px;
      padding:17px 0 16px; 
      border:0; 
      cursor:pointer; 
      font-family:'돋움';
   }
</style>	
	
	
</head>
 	<body>
 	
 		<form name="loginform" method="post" action="loginPro.do" onsubmit="return logincheck()">
        	<div class="wrapper">
        	  <div class="main">
        		<div class="login_box">
					<div class="input_login"><input type="text" name="id" placeholder="아이디를 입력하세요"></div>
					<div class="input_login"><input type="password" name="name" placeholder="비밀번호를 입력하세요"></div>
					<div class="check">   
				  		 <label><input type="checkbox">아이디 저장</label>
					</div>
					<div class="login">
			 			<input type="submit" value="로그인">
					</div>
					<div class="input_box">
						<input type="button" value="회원가입" onclick="location='inputForm.do'"> 
					</div>
    			</div>
    		</div>
		</div>
		</form>
	
	</body>
	
</html>

