<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.schedule.ScheduleDao"%>
<%@page import="dao.schedule.ScheduleDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="/final/css/top_navigation.css">
   	<script src="/final/script/request.js"></script>
   	<script src="/final/script/replyAlarm.js"></script>
   
   <title>Insert title here</title>
</head>
   <body>
      <div id="nav_wrapper"><br>
         <img class="ant_image" src="/final/image/logo.png">
         <ul>
            <li><a href="main.do">HOME</a> </li>
            <li><a href="createSchedule.do">일정만들기</a> </li>
            <li><a href="searchSchedule.do">일정검색</a> </li>
            <li><a href="searchStory.do">스토리검색</a> </li>
            <li><a href="mypage.do?content=0">마이페이지</a> </li>
            <!-- <div id="console"></div> -->
            <c:if test="${sessionScope.memId == null}">
	            <li id="nav_li"><a href="loginForm.do">로그인</a> </li>
	            <li id="nav_size"><a href="inputForm.do">회원가입</a> </li>
            </c:if>
            <c:if test="${sessionScope.memId != null}">
            	<li id="nav_li"><a href="">${sessionScope.memId}</a> </li>
	            <li id="nav_size"><a href="logout.do">로그아웃</a> </li>
				<li id="nav_size" ><img id="alarmImg" src="/final/image/alarm.png" onclick="replyList(); myFunction();" width="30px" height="30px"/></li>
            </c:if>
         </ul>
         <form id="hidden">
         	<input type="hidden" name="memId" value="${sessionScope.memId}">
         </form>
      </div>
   </body>
</html>
