<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/final/script/request.js"></script>
<script src="/final/script/memberscript.js"></script>
<script src="/final/script/replyAlarm.js"></script>
<link rel="stylesheet" type="text/css" href="/final/css/replyAlarm.css">
</head>

<body>
<form name="loginform">
	<input type="hidden" name="memId" value="${sessionScope.memId}"> 
</form>
<div class="menu" role="menu" aria-labelledby="dLabel">
	<h5 class="noti-title">알림</h5>
	<ul id="my-notice-list">
	    <c:forEach var="reply" items="${list}">
	    <fmt:formatDate var="reply_date" value="${reply.reply_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		  <li class="my-notice-list-li" data-type="1" data-link-key="KR">
		    <div></div>
		      <div class="noti-contents">
		        <h5>
		        	<a class="underline" href="javascript:openUrl(${reply.schedule_num})"><span><span style="color:#ff8000;">${reply.reply_id}</span>님이 <span style="color:#ff8000;">${reply.schedule_subject}</span>글에 댓글을 남기셨습니다.</span></a>
		        	<%-- <a class="underline" href="modifyScheduleView.do?schedule_num=${reply.schedule_num}"><span><span style="color:#ff8000;">${reply.reply_id}</span>님이 <span style="color:#ff8000;">${reply.schedule_subject}</span>글에 댓글을 남기셨습니다.</span></a> --%>
		        </h5>
		        <p class="date">${reply_date}</p>
		      </div>
		  </li>
	  </c:forEach>
	</ul>
	</div>
    <div class="paging">
		<c:if test="${startPage > pageBlock}">
		    <a class="btn-prev" href="reply.do?pageNum=${startPage-pageBlock}&memId=${sessionScope.memId}">이전</a>
			    </c:if>
			    <c:if test="${pageCount > endPage}">
		    <a class="btn-next" href="reply.do?pageNum=${startPage+pageBlock}&memId=${sessionScope.memId}">다음</a>
		</c:if>
	    <ul>
	    	<c:set var="pageNum" value="${pageNum}"></c:set>
	    	<c:forEach var="i" begin="${startPage}" end="${endPage}">
	    		<c:if test="${pageNum==i}">
	    			<li class="cover"><a href="reply.do?pageNum=${i}"><span>${i}</span></a></li>
	    		</c:if>
	    		<c:if test="${pageNum != i}">
					<li><a href="reply.do?pageNum=${i}&memId=${sessionScope.memId}"><span>${i}</span></a></li>
				</c:if>
	    	</c:forEach>
	    </ul>
	</div>
</body>
</html>