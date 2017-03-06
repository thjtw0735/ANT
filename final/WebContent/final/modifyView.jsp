<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.member.MemberDataBean"%>
<%@page import="dao.member.MemberDBBean"%>

<%@ include file ="membersetting.jsp"%>  
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/final/css/inputform.css">
		<script src="/final/script/memberscript.js"></script>
		<script src="/final/script/top_navigation.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	
	<title>회원정보 수정</title>
	
	</head>
	
	<c:if test="${result == 1}">
		<body onload="modifyfocus()">
			<form name="modifyform" method="post" action="modifyPro.do"
				onsubmit="return modifycheck()">
		<div class="wrapper">   
        	<div class="main">   
        		<div class="input_box">
    				<dt><label>  User ID</label></dt>
				     <div>${dto.id}</div> 
				     <div>
				      	<dt><label>  PassWord</label></dt>
				      	<dd><input id="pass" name="passwd" type="password" size = "30" maxlegnth="10" placeholder="비밀번호" value="${dto.passwd}"></dd>
				     </div>
				   	 	<dt><label>  PassWord Check</label></dt>
				     	<dd><input id="repass_ch" name="repasswd" type="password" size = "30" maxlength="10" placeholder="비밀번호 확인" value="${dto.passwd}"></dd>
				     <div class='arrow_box' id="pass_ch_notice" style="display:none;">
				         <ul>
				       <li><a class = "notice" style="color:red;">비밀번호를 확인해 주세요.</a></li>
				         </ul>
				       </div>
				  
				     <dt><label>  Name</label></dt>
				     <div>${dto.name}</div>
					
					<div>
						<dt><label>  Email</label></dt>
						<input class="E1" name="email1"type="text" name="email1" maxlength="30" size="30">
						@
						<input class="E2" name="email2" type="text">
						<select class="E3">
							<option value="0">직접입력</option>
							<option value="daum.net">다음</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
						</select>
					</div>
					<br>
					<input type="hidden" name="duplication" value="0">
					<div class="inputbutton">
						<input class="inputbutton1" type="submit" value="수정" >
						<input class="inputbutton2" type="button" value="취소" onclick="sefl.close()">
					</div>
				</div>
      		</div>   
		</div>
	</form>
	</body>
	</c:if>
	<c:if test="${result != 1}">
		<script type="text/javascript">
			<!--		
			erroralert( passwderror);
			//-->
		</script>
	</c:if>


	
	
<script type="text/javascript">
	//<!--
	$(document).ready(function() {
		$('select').on('change' , function(){
			var email22 = $(this).val();
				$('.E2').val(email22);
		});
	});
	//-->
	</script>
