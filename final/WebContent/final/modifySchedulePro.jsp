<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test="${result==0}">
			<script type="text/javascript">
				//<!--
				alert( "수정실패 : 내 아이디가 아닙니다" );
				window.opener.location.href = window.opener.location.href;
				window.close();
				//-->
			</script>
		</c:if>
		<c:if test="${result==1}">
			<script type="text/javascript">
				//<!--
				alert( "수정성공 ! " );
				window.opener.location.href = window.opener.location.href;
				window.close();
				//-->
			</script>
		</c:if>
	
	</body>
</html>