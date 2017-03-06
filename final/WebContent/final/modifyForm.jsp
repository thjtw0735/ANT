<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<%@ include file ="membersetting.jsp"%>  
	<script src="/final/script/memberscript.js"></script>

 <c:if test="${sessionScope.memId != null}">	
<body onload="passwdfocus()">
	<form name="passwdform" method="post" action="modifyView.do" onsubmit="return passwdcheck()">
		<div>
			<label>Password</label>
			<input name="passwd" type="password" maxlength="30" size="30">
		</div>
		<input type="submit" value="확인" >
		<input type="reset" value="취소" onclick="self.close()">
	</form>
</body>	
</c:if>
</html>