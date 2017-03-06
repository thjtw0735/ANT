<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/final/css/createSchedule.css">
    <script src="/final/script/createSchedule.js"></script>
     <script src="/final/script/createStory.js"></script>
    <script src="/final/request/request.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body onload="start()">
<c:if test="${result==0}">
	<script type="text/javascript">
		//<!--
		alert( "로그인을 해주세요" );
		//-->
	</script>
	<META http-equiv=refresh content="0;url=main.do">
</c:if>
<c:if test="${result!=0}">
<jsp:include page="top_navigation.jsp"/>



	<div id="schedule_information">
		<form id="informationForm">
		<div class="information">
			<div id="schedule_basic">
			 	<img src="/final/image/arrive.png" width="40px" height="40px">
				<input id="start_date" type="date" value="${start_date}" onchange="caldate()"> <br> 
				<img src="/final/image/depart.png" width="40px" height="40px">  
				<input id="end_date" type="date" value="${start_date}" onchange="caldate()">
<!-- 				 <input id="schedule_btn" type="button" value="DB에 저장" onclick="createScheduleDB()"> <br> -->
			</div>
			<div class="user-menu">
				<ul>
					<li class="save">
			         <button id="plan_edit_save_btn"><img src="https://wishbeen.co.kr/images/icon-save.png" alt="">저장하기</button>
			       	</li>
		       		<li class="cancel">
		       		<button id="plan_edit_cancel_btn"><img src="https://wishbeen.co.kr/images/icon-cancel.png" alt="">취소</button>
		       		</li>
				</ul>
			</div>
		</div>
			<div id="schedule_SubAndContent">
				<div id="subject"> <input id="subject" type="text" size="50" placeholder="어떤 여행인지 간단히 설명해 주세요 :)"></div> 
				<div id="content"> <textarea id="content" placeholder="당신의 여행 스토리를 만들어 보세요" maxlength="10000"></textarea> </div>
				<div class="plan-view-tab" id="plan_edit_story_schedule_tab">
			         <ul class="tabs plan-detail-buttons">
			            <li class="story" rel="story-tab" id="plan-story-btn"><a><span>스토리</span></a></li>
			            <li class="schedule active" rel="schedule-tab" id="plan-schedule-btn"><a><span>지도/일정표</span></a></li>
			         </ul>
		       </div>
				<!-- <button type="button" class="button1" value="" name="" onclick="onSchedule()">여행 스케줄</button>
	      
				<button type="button" class="button1" value="" name="" onclick="onStory()">여행 스토리</button> -->
			</div>
		</form>
		
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	
	<div class="map_wrap">
		<div id="map_background">
	    	<div id="map" style="width:840px;height:612px;position:relative;overflow:hidden;"></div>
		</div>
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" value="제주도" id="keyword" size="15"> 
	                    <button type="submit">검색하기</button> 
	                </form>
	                
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	</div>
	<div class="marker-list-con" id="planMapSchedule">
		<ul id="mapSchedule" class="marker-list">
		
		</ul>
	</div>
	<div id="mouseovertest"  style="position:absolute;display:none;"></div>
	
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f572f971bfd8096a3497b748391aa8b5&libraries=services"></script>
	<script>
	
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	    
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	</script>
	<div class="gapback" id="gapback">
		<div class="gap"> </div>
		<form id="tableForm">
		<script type="text/javascript">
			// 테이블생성 스크립트
			//<!--	
				createTimetable();
			//-->
		</script>
		</form>
	</div>

	<div id ="story">
	<jsp:include page="createStory.jsp" flush="false"/>
	</div>
	
	
	<jsp:include page="bottom_navigation.jsp" flush="false" />
</c:if>
</body>
</html>