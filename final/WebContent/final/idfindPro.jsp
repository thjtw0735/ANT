<%@page import="dao.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="membersetting.jsp"%>  
<link rel="stylesheet" type="text/css" href="/final/css/confirmId.css">
<script src="/final/script/memberscript.js"></script>


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
   
	
	<c:if test="${result != null}">
		<body>
			<div class="confirm_main">
				<div class="confirm_font">Ant 회원 아이디 찾기</div>
				<div class="id_check">
					당신의 아이디는<span>${result}</span>입니다.
				</div>
				<input class="confirm_bt3" type="button" value="${btn_ok}"> 
			</div>
		</body>
	</c:if>
	<c:if test="${result == null}">
		<body onload="idfindfocus()">
			<form name = "confirmform" method="post" action="idfindForm.do"
				onsubmit="return confirmcheck()">
				<div class="confirm_main">
					<div class="confirm_font">Ant 회원 아이디 찾기</div>
					<div class="id_cehck">
						<span>${email}</span>은 존재하지 않는 이메일 입니다
					</div>
					<div class="confirm_id">
						<label class="confirm_input">다른 이메일 입력</label>
							<form name="idfindform" method="post" action="idfindPro">
	   							<div>
									<dt><label>  Email</label></dt>
									<input class="E1" name="email1"type="text" maxlength="30" size="30">
									@
									<input class="E2" name="email2" >
									<select class="E3">
										<option value="0">직접입력</option>
										<option value="daum.net">다음</option>
										<option value="naver.com">네이버</option>
										<option value="gmail.com">구글</option>
									</select>
								</div>
							</form>
					</div>
					<div>
						<input class="confirm_bt1" type="submit" value="${btn_ok}">
						<input class="confirm_bt2" type="button" value="${btn_ok_cancel}" onclick="self.close()">
					</div>
				</div>		
			</form>
		</body>
	</c:if>