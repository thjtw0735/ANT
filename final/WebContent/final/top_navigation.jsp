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
    <link rel="stylesheet" type="text/css" href="/final/css/main.css">
<style type="text/css">
/* UI Object */
html, body{height:100%;margin:0}
.mw_layer{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
.mw_layer.open{display:block}
.mw_layer .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
#layer{position:absolute;top:50%;left:50%;width:400px;margin:-150px 0 0 -194px;padding:28px 28px 0 28px;line-height:normal;white-space:normal}
/* //UI Object */
</style>
<script src="/final/script/request.js"></script>
<script src="/final/script/replyAlarm.js"></script>
   
   <title>Insert title here</title>
</head>
<script type="text/javascript">
	// !<--
	function main_search(e){
		if(e.keyCode == 13 ){
			var city_search = document.getElementById("city_search").value;
			alert(city_search);
			var address = "main.do?word=" + city_search;
			location.replace(address);
			return false;
		} else {
			return true;
		}
	}
	
	function schedule_search(e){
		if(e.keyCode == 13 ){
			var city_search = document.getElementById("city_search").value;
			alert(city_search);
			var address = "searchSchedule.do?word=" + city_search + "&check=1";
			location.replace(address);
			return false;
		} else {
			return true;
		}
	}

	function story_search(e){
		if(e.keyCode == 13 ){
			var city_search = document.getElementById("city_search").value;
			alert(city_search);
			var address = "searchStory.do?word=" + city_search + "&check=1";
			location.replace(address);
			return false;
		} else {
			return true;
		}
	}
	
	jQuery(function($){
		 var layerWindow = $('.mw_layer');
		 var layer = $('#layer');
		 
		 // Show Hide
		 $('.layer_trigger').click(function(){
		  layerWindow.addClass('open');
		 });
		 $('#layer .close').click(function(){
		  layerWindow.removeClass('open');
		 });

		 // ESC Event
		 $(document).keydown(function(event){
		  if(event.keyCode != 27) return true;
		  if (layerWindow.hasClass('open')) {
		   layerWindow.removeClass('open');
		  }
		  return false;
		 });
		 // Hide Window
		 layerWindow.find('>.bg').mousedown(function(event){
		  layerWindow.removeClass('open');
		  return false;
		 });
		});
	
	// -->
</script>
   <body>
      <div id="nav_wrapper"><br>
         <img class="ant_image" src="/final/image/logo.png">
         <ul>
            <li><a href="main.do">HOME</a> </li>
            <li><a href="createSchedule.do">일정만들기</a> </li>
            <li><a href="searchSchedule.do">일정검색</a> </li>
            <!-- <li id="nav_li"><a href="searchSchedule.do">일정검색</a> </li> -->
            <li><a href="searchStory.do">스토리검색</a> </li>
            <li><a href="mypage.do?content=0">마이페이지</a> </li>
            
            <c:if test="${sessionScope.memId == null}">
	            <li id="nav_li">  <p><a href="#layer" class="layer_trigger">로그인</a></p> </li>
	            <div class="mw_layer">
 			<div class="bg"></div>
 				<div id="layer">
     				<form name="loginform" method="post" action="loginPro.do"
	            		onsubmit="return maincheck()">
     						<div class="login_box1" >
				  			<div class="logotle">
				  				<div class="imagelogo"></div>
				  			</div>
				  			<div class="input_tle">
				  				<div class="input_login1"><input type="text" name="id" placeholder="아이디를 입력하세요"></div>
				            	<div class="input_login1"><input type="password" name="passwd" placeholder="비밀번호를 입력하세요"></div>
				        	</div>
				        	<div class="check1">   
				               <label><input type="checkbox">아이디 저장</label>
				            </div>
				            <div class="login1">
				             <input type="submit" value="로그인">
				            </div>
				            <div class="input_box1">
				            <input type="button" value="회원가입" onclick="location='inputForm.do'"> 
				            </div>
		            	</div>
		            	</form>
		            </div>
			</div>
	            
	            <li id="nav_size"><a href="inputForm.do">회원가입</a> </li>
            </c:if>
            <c:if test="${sessionScope.memId != null}">
            	<li id="nav_li"><a href="">${sessionScope.memId}</a> </li>
	            <li id="nav_size"><a href="logout.do">로그아웃</a> </li>
             	<li id="nav_size" >
						<img id="alarmImg" src="/final/image/alarm.png" onclick="replyList(); myFunction();" width="30px" height="30px"/>
             	</li>
            </c:if>
         </ul>
         <form id="hidden">
         	<input type="hidden" name="memId" value="${sessionScope.memId}">
         </form>
         <!-- <p><a href="#layer" class="layer_trigger">로그인</a></p> -->
			<div class="mw_layer">
 			<div class="bg"></div>
 				<div id="layer">
     				<form name="loginform" method="post" action="loginPro.do"
	            		onsubmit="return maincheck()">
     						<div class="login_box1" >
				  			<div class="logotle">
				  				<div class="imagelogo"></div>
				  			</div>
				  			<div class="input_tle">
				  				<div class="input_login1"><input type="text" name="id" placeholder="아이디를 입력하세요"></div>
				            	<div class="input_login1"><input type="password" name="passwd" placeholder="비밀번호를 입력하세요"></div>
				        	</div>
				        	<div class="check1">   
				               <label><input type="checkbox">아이디 저장</label>
				            </div>
				            <div class="login1">
				             <input type="submit" value="로그인">
				            </div>
				            <div class="input_box1">
				            <input type="button" value="회원가입" onclick="location='inputForm.do'">
				            </div>
		            	</div>
		           </form>
 				</div>
			</div>
      </div>
		<!-- <div class="main_top" style="background:url('/final/image/jeju3.jpg') no-repeat;background-size:cover;"> -->
		<div class="main_top" style="background:url('http://earthtory.com/res/img/main/key_bg_1.jpg') no-repeat;background-size:cover;">
			<div class="wrap">
				<div class="main_top_title">
					나만의 여행 플래너 All Need Travel!		</div>
				<div class="main_top_desc">
					쉽고 빠르게 여행을 계획하세요.		</div>
				<div class="search_area">
				  <c:if test="${page == 0 }">
					<input class="search_input" id="city_search" placeholder="  장소명으로 검색해주세요" onkeypress="return main_search(event)">
				  </c:if>
				  <c:if test="${page == 1 }">
					<input class="search_input" id="city_search" placeholder="  장소명으로 검색해주세요" onkeypress="return schedule_search(event)">
				  </c:if>
				  <c:if test="${page == 2 }">
					<input class="search_input" id="city_search" placeholder="  장소명으로 검색해주세요" onkeypress="return story_search(event)">
				  </c:if>
					<div id="city_autocomplete"></div>
					<div class="latest_search">
					추천장소 : 
					<a href="main.do?word=제주도" class="latest_a">제주도</a>
					,<a href="main.do?word=한라산" class="latest_a">한라산</a>
					,<a href="main.do?word=우도" class="latest_a">우도</a>
				</div>
				</div>
			</div>
		</div>
      <br>      
   </body>
</html>
