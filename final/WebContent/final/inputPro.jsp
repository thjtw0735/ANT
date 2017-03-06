<%@page import="dao.member.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="membersetting.jsp"%>  
<script src="/final/script/memberscript.js"></script>


<h2> ${page_input}</h2>
	<c:if test="${result1 == 0}">
		<script type="text/javascript">
			<!--
			erroralert(inputerror);
			//-->
		</script>
	</c:if>
	<c:if test="${result1 != 0}">
		
		<c:redirect url="main.do"/>
	</c:if>	

	
	