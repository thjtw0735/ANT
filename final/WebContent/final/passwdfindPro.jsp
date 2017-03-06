<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
					<span>${email}</span> 으로 비밀번호가 전송되었습니다.
				</div>
				<input class="confirm_bt3" type="button" value="${btn_ok}" onclick="self.close()"> 
			</div>
		</body>
	</c:if>
	<c:if test="${result == null}">
		<body onload="idfindfocus()">
			<form method="post" action="passwdfindPro.do"
				onsubmit="return confirmcheck()">
				<div class="confirm_main">
					<div class="confirm_font">Ant 회원 아이디 찾기</div>
					<div class="id_cehck">
						입력하신 정보가 잘못됬었습니다. 다시 입력해 주세요.
					</div>
					<div class="confirm_id">
						<label class="confirm_input">다시 입력</label>
								<div>
									<label>ID</label>
									<input name="id" type="text" maxlength="30" size="30">
									<label>  Email</label>
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
							
					</div>
					<div>
						<input class="confirm_bt1" type="submit" value="${btn_ok}">
						<input class="confirm_bt2" type="button" value="${btn_ok_cancel}" onclick="self.close()">
					</div>
				</div>		
			</form>
		</body>
	</c:if>