<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="main_html">
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/final/css/searchStory.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>
	<title>Insert title here</title>
	<script type="text/javascript">
	</script>
</head>
<body class="main_body">
	<jsp:include page="top_navigation.jsp" flush="false" />
	<div class="page-rotation">
        <a href="main.do">홈</a>
	    <span> &gt; </span><a href="searchSchedule.do">여행일정</a>
	</div>
    <div class="present">
        <div class="conts-box-list">
              <ul>
               <c:forEach var="schedule" items="${list}">
				<li class="plan-item" data-id="c9a583c81043a82a">
				    <div class="trav-sch">
				        <a target="&quot;_blank&quot;" href="modifyScheduleView.do?schedule_num=${schedule.schedule_num}" class="plan_link" data-id="c9a583c81043a82a">
				            <div class="cover-img">
				                <img src="https://thumb-wishbeen.akamaized.net/uvvEuBB91bzaRCpJCT1ZhdtLQ_A=/448x170/smart/filters:no_upscale()/img-wishbeen.akamaized.net/plan/1472101899603_%EA%B3%B5%ED%95%AD.jpg">
				                <div class="bg"></div>
				            </div>
				            <div class="plan-tit">
				                <h3>${schedule.schedule_subject}</h3>
				            </div> <!-- plan-tit -->
				            <div class="list-contents">
				                <!-- <div class="tit">괜히 세계 최고의 공항이 아니라구!</div> -->
				                <div class="desc">${schedule.schedule_content}</div>
				            </div>
				        </a>
				    </div>
				</li>
			   </c:forEach>
               </ul>
            <div class="clear"></div>
            <div class="clear"></div>
			<div class="paging">
				<c:set var="check" value="${check}"></c:set>
				<c:if test="${check==0}">
					<c:if test="${startPage > pageBlock}">
					    <a class="btn-prev" href="searchSchedule.do?pageNum=${startPage-pageBlock}">이전</a>
						    </c:if>
						    <c:if test="${pageCount > endPage}">
					    <a class="btn-next" href="searchSchedule.do?pageNum=${startPage+pageBlock}">다음</a>
					</c:if>
				</c:if>
				<c:if test="${check==1}">
				 	<c:if test="${startPage > pageBlock}">
				    	<a class="btn-prev" href="searchSchedule.do?pageNum=${startPage-pageBlock}&check=1&word=${word}">이전</a>
				    </c:if>
				    <c:if test="${pageCount > endPage}">
				    	<a class="btn-next" href="searchSchedule.do?pageNum=${startPage+pageBlock}&check=1&word=${word}">다음</a>
				    </c:if>
				</c:if>
			    <ul>
			    	<c:set var="pageNum" value="${pageNum}"></c:set>
			    	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			    		<c:if test="${check==0}">
				    		<c:if test="${pageNum==i}">
				    			<li class="cover"><a href="searchSchedule.do?pageNum=${i}"><span>${i}</span></a></li>
				    		</c:if>
				    		<c:if test="${pageNum != i}">
											<li><a href="searchSchedule.do?pageNum=${i}"><span>${i}</span></a></li>
							</c:if>
			    		</c:if>
			    		<c:if test="${check==1}">
				    		<c:if test="${pageNum==i}">
				    			<li class="cover"><a href="searchSchedule.do?pageNum=${i}&check=1&word=${word}"><span>${i}</span></a></li>
				    		</c:if>
				    		<c:if test="${pageNum!= i}">
				    			<li><a href="searchSchedule.do?pageNum=${i}&check=1&word=${word}"><span>${i}</span></a></li>
				    		</c:if>
			    		</c:if>
			    	</c:forEach>
			    </ul>
			</div>
        </div>
    </div>
	<jsp:include page="bottom_navigation.jsp" flush="false" />
</body>
</html>