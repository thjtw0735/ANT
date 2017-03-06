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
	<link rel="stylesheet" type="text/css" href="/final/css/main.css">
	<link rel="stylesheet" type="text/css" href="/final/css/top_navigation.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>
	<script src="/final/script/memberscript.js"></script>
	
	<title>Insert title here</title>
	
	<script type="text/javascript">
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
	
	</script>
</head>
<body class="main_body">
	 <div id="nav_wrapper"><br>
         <img class="ant_image" src="/final/image/logo.png">
         <ul>
            <li><a href="main.do">HOME</a> </li>
            <li><a href="createSchedule.do">일정만들기</a> </li>
            <li><a href="searchSchedule.do">일정검색</a> </li>
            <!-- <li id="nav_li"><a href="searchSchedule.do">일정검색</a> </li> -->
            <li><a href="searchStory.do">스토리검색</a> </li>
            <li><a href="mypage.do?content=0">마이페이지</a> </li>
         </ul>
         <p><a href="#layer" class="layer_trigger">로그인</a></p>
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
				<jsp:include page="flightSearch.jsp" flush="false" />
		</div>
      <br>      
	<div class="page-rotation">
        <!-- <a href="main.do">홈</a> -->
	</div>
	
	
 	<div class ="center">
	<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=2000>
	<div class="cycle-pager"></div>
		<img src="https://thumb-wishbeen.akamaized.net/Y6fYFMcfTh47JkIVk5PZEDBBYjo=/800x320/smart/filters:no_upscale()/img-wishbeen.akamaized.net/introbanner/1480909472485_uc804uc8fcub2f4uc591uc5ecud589_main.jpg" onclick="" style="height: 100%;" alt="베스트 여행기">
		<img src="https://thumb-wishbeen.akamaized.net/XJ8imtdZmRuZeb6RamYTgO7o_-0=/800x320/smart/filters:no_upscale()/img-wishbeen.akamaized.net/introbanner/1478594089652_wb_banner_web_161102.png" style="height: 100%;" alt="여행핫딜 배너">
		<img src="https://thumb-wishbeen.akamaized.net/y_7AGbYz4Oue_DowxpUh0BJD_JI=/800x320/smart/filters:no_upscale()/img-wishbeen.akamaized.net/introbanner/1484543866805_sunny_web.png" style="height: 100%;" alt="써니뱅크">
		<img src="/final/image/Rosicky.png" style="height: 100%;" alt="플레이스 제주항공 특가">
	</div>
<c:if test="${sessionScope.memId == null}">
	<form name="loginform" method="post" action="loginPro.do" onsubmit="return logincheck()">
		<div class="login_box">
				<div class="input_login"><input type="text" name="id" placeholder="아이디를 입력하세요"></div>
					<div class="input_login"><input type="password" name="passwd" placeholder="비밀번호를 입력하세요"></div>
						<div class="check">   
						   <label><input type="checkbox">아이디 저장</label>
						</div>
						<div class="login">
						 <input type="submit" value="로그인">
						</div>
					<div class="input_box">
					<input type="button" value="회원가입" onclick="location='inputForm.do'"> 
				</div>
			</div>
		     <div class="infocheck">
		      <input type="button" value="아이디찾기" onclick="idfind()">
		      <input type="button" value="비밀번호 찾기" onclick="passwdfind()">
		    </div>
		</div>
	</form>
</c:if>
<c:if test="${sessionScope.memId != null}">
<div class="iogin_wrap">
 <div class="login_form">
     <div class="page silver logged_box">
		<div class="wraplogged">
		<div id="loginp"></div>
		<div class="logged_left">
			<div class="logged_name"><span>${sessionScope.memId} 님 안녕하세요<span></div>
			<div class="clear"></div>
			<div class="logged_line">&nbsp;</div>
			<a href="/ko/mypage/et_1611280329060626752001480314546?type=plan" class="logged_cnt_box logged_plan">
				<b>여행일정</b>
				<span>0</span>
			</a>
			<div class="logged_line">&nbsp;</div>
				<a href="/ko/mypage/et_1611280329060626752001480314546?type=review" class="logged_cnt_box logged_review">
					<b>여행스토리</b>
					<span>0</span>
				</a>
			<div class="logged_line">&nbsp;</div>
				<a href="/ko/mypage/et_1611280329060626752001480314546?type=my_qa" class="logged_cnt_box logged_qa">
					<b>Reple</b>
					<span>0</span>
				</a>
			<div class="clear"></div>
			</div>
			<div id="logged_control">
			<div class="logged_btn">
			<div class="logged_btn_ico">
					<img src="/final/image/댓글알림.png">
				</div>
				댓글알림
			</div>
			<div class="logged_btn">
				<div class="logged_btn_ico">
					<img src="/final/image/마이페이지.jpg" onclick="location='mypage.do'">
				</div>
				mypage
			</div>
			<div class="logged_btn">
				<div class="logged_btn_ico">
					<img src="/final/image/정보수정.jpg" onclick="modifyform()">
				</div>
				정보수정			
			</div>
	
			<div class="logged_btn">
				<div class="logged_btn_ico">
					<img src="/final/image/로그아웃.png" onclick="location='logout.do'">
				</div>
				로그아웃		
			</div>
		</div>	
		<div class="clear"></div>
	</div>
  </div>
</div>
</div>
</c:if>
	</div>
	<div id="contents" class="main">
		<div class="conts-container plan">
			<div calss="contents-wrap">
				<div class="bigHeader">여행일정</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="schedule" items="${list}" begin="0" end="5">
				     	<div class="plan-contents">
						    <a href="modifyScheduleView.do?schedule_num=${schedule.schedule_num}" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/6nOka6tz7O2cenpDTHEUzawJXPo=/390x150/smart/img-wishbeen.akamaized.net/plan/1462948625627_cover.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${schedule.schedule_subject}</p>
						                <div class="desc">
						                    <span>제주도</span>
						                    <span>3일</span>
						                    <span>여행 후</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
				     </c:forEach>
					 <div class="clear"></div>
					 <div class="clear"></div>
				     </div>
				</div>
			    <div class="btn-box center">
			       <c:if test="${page==null}">
			          <a class="btn-more" href="searchSchedule.do?check=0&word=${word}">
			          <span>여행일정</span>
			    		더보기
			    	</a>
			       </c:if>
			       <c:if test="${page!=null}">
	        	      <a class="btn-more" href="searchSchedule.do?check=1&word=${word}">
	        	      <span>여행일정</span>
			    		더보기
			    	</a>
			       </c:if>
			    </div>
			</div>
		</div>
		<div class="conts-container plan">
			<div calss="contents-wrap">
				<div class="bigHeader">여행스토리</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="story" items="${storylist}" begin="0" end="5">
						<div class="plan-contents">
						    <a href="/plan/5af6eeb7a7245a0c" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/wIq3GQVktTNYGxfQsrX7Ce92D_A=/390x150/smart/img-wishbeen.akamaized.net/plan/1411550254627_%EC%9C%84%EC%8B%9C%EB%B9%88_%ED%94%BD_%ED%8C%8C%EB%A6%AC2.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${story.story_subject}</p>
						                <div class="desc">
						                    <span>한국</span>
						                    <span>1일</span>
						                    <span>여행 전</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
					</c:forEach>
						<div class="clear"></div>
						<div class="clear"></div>
				     </div>
				</div>
			    <div class="btn-box center">
			       <c:if test="${page==null}">
			          <a class="btn-more" href="searchStory.do?check=0&word=${word}">
			          <span>여행스토리</span>
			    		더보기
			    	</a>
			       </c:if>
			       <c:if test="${page!=null}">
	        	      <a class="btn-more" href="searchStory.do?check=1&word=${word}">
	        	      <span>여행스토리</span>
			    		더보기
			    	</a>
			       </c:if>
			    </div>
			</div>
		</div>
	</div>
	<jsp:include page="bottom_navigation.jsp" flush="false" /> 
</body>
</html>