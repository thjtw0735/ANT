<%@page import="dao.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="membersetting.jsp"%>  
<script src="/final/script/memberscript.js"></script>

<h2> ${page_login}</h2>
<c:if test="${result == 0}">
		<script type="text/javascript">
		<!--
		erroralert( iderror );
		//-->
		</script>
</c:if>
<c:if test="${result == -1}">
		<script type="text/javascript">
		<!--
		erroralert( passwderror );
		//-->
		</script>
</c:if>
<c:if test="${result == 1}">
	<c:redirect url="main.do"/>
</c:if>