<%@page import="dao.timetable.TimetableDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head >
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/final/css/createSchedule.css">
    <script src="/final/script/modifyScheduleView.js"></script>
    <script src="/final/request/request.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="/final/script/request.js"></script>
	<script src="/final/script/replyAlarm.js"></script>

</head>


<body onload="start()">

<jsp:include page="top_navigation.jsp"/>
<script type="text/javascript">
//<!--
	$(function(){
        var Tdate = new Array(); 
        var Ttime = new Array();
        var Tcontent = new Array();
        var Ttitle = new Array();
        var Taddress = new Array();
        var Scontent = new Array();
        var Ssubject = new Array();
        
        <c:forEach var="date" items="${timetableDto}" varStatus="status">
        	Tdate.push("${date.timetable_date}");  
        	Ttime.push("${date.timetable_time}"); 
        	Tcontent.push("${date.timetable_content}");
        	Ttitle.push("${date.timetable_title}"); 
        	Taddress.push("${date.timetable_address}"); 
        </c:forEach>
	   	<c:forEach var="story" items="${storyDto}" varStatus="statuss">
		 	Scontent.push('${story.story_content}');
			Ssubject.push('${story.story_subject}');
	
		</c:forEach>
 
      
        test321(Tdate, Ttime, Tcontent, Ttitle, Taddress, Scontent, Ssubject  ); 
      
	});
	

	
	/*
	var storyindex = document.getElementById("123123");
	var tmp = document.createElement('div');
	
	var tmp2 = '<form id="postForm"><div id = "post'+'${statuss.count}'+'" class="postItem">'
	+'<h2 name="postSubject" class="postSubject">'+'${story.story_subject}'+'</h2>'
	+'<h5 name="postContent" class="postContent">'
	+'${story.story_content}'+'</h5></div></form>';
	alert(storyindex);
	tmp.innerHTML=tmp2;
	// storyindex.appendChild(tmp);
	*/
//-->
</script>

	

<div id="schedule_information">
	<a href="printSchedule.do?schedule_num=${scheduleDto.schedule_num}" target="_blank"><img class="printImage" alt="출력하기" src="/final/image/printer.png"></a>
	<form id="informationForm">
		<div id="schedule_basic">
		
			<input id="schedule_btn" type="button" value="수정" onclick="ModifyScheduleDB(${scheduleDto.schedule_num})"> <br>
			<img src="/final/image/airplane.png" width="40px" height="40px">  <input id="start_date" type="date" value="${scheduleDto.schedule_start}" onchange="caldate()"> <br> <input id="end_date" type="date" value="${scheduleDto.schedule_end}" onchange="caldate()">
		 	<img src="/final/image/motel.png" width="40px" height="40px">   <br>
		
		</div>
		<div id="schedule_SubAndContent">
			<div id="subject"> <input id="subject" type="text" size="50" placeholder="어떤 여행인지 간단히 설명해 주세요 :)" value="${scheduleDto.schedule_subject}"></div> 
			<div id="content"> <textarea id="content" placeholder="당신의 여행 스토리를 " maxlength="10000">${scheduleDto.schedule_content}</textarea> </div>
			<button type="button" class="button1" value="" name="" onclick="onSchedule()">여행 스케줄</button>
      
			<button type="button" class="button1" value="" name="" onclick="onStory()">여행 스토리</button>
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
<div class="marker-list-con" id="planMapSchedule">sss
	<ul id="mapSchedule" class="marker-list">
	
	</ul>
</div>



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
<div class="gapback">
	<div class="gap"> </div>
	<script type="text/javascript">
	// 테이블생성 스크립트
	//<!--	
		createTimetable();
	//-->
	</script>
</div>
<div id ="story">
	<jsp:include page="createStory.jsp" flush="false"/>
</div>

<jsp:include page="reply/replyClient.jsp" flush="false"/>




<jsp:include page="bottom_navigation.jsp" flush="false" />
</body>
</html>