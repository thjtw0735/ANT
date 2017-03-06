<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file ="membersetting.jsp"%>  
   
   <script src="/final/script/memberscript.js"></script>
   
   <html>
   
   	<form name="idfindform" method="post" action="passwdfindPro.do" onsubmit="return passwdfindcheck()">
	   <div>
			<label>ID</label>
			<input name="id" type="text" maxlength="30" size="30">
			<label>Email</label>
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
		<input type="submit" value="확인">
	</form>
	
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
   
  </html>
