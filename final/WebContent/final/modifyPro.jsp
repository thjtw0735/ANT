<%@page import="dao.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="membersetting.jsp"%>  
<script src="/final/script/memberscript.js"></script>



<c:if test="${result == 0}">
		<script type ="text/javascript">
		<!--
		alert(modifyerror);
		// -->		
		</script>
</c:if>
<c:if test="${result != 0}">
		<div>
			수정되었습니다.
		</div>
		<input type="button" value="확인" onclick="sefl.close()">
</c:if>
