<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
      <link rel="stylesheet" type="text/css" href="/final/css/printSchedule.css">
      <script src="/final/script/printSchedule.js"></script>
      <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f572f971bfd8096a3497b748391aa8b5&libraries=services"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>   
   </head>
   <body onload="start()">
   <script type="text/javascript">
      //<!--
      var subject = new Array();
      var content = new Array();
      <c:forEach var="story" items="${storyDto}" varStatus="status">
            subject.push('${story.story_subject}');
            content.push('${story.story_content}');
      </c:forEach>
      
      function start() {
         $(".content").each(function(index){
            $(".content").eq(index).html(content[index]);
         });
         
         $(".schedule_subject").each(function(index){
            $(".schedule_subject").eq(index).html(subject[index]);   
         });
      }
      //-->
   </script>
      <div id="baseInformation">   
         <div id="sub_and_con">
            <h2 id="schedule_subject">${scheduleDto.schedule_subject}</h2>
            <h3 id="schedule_content">${scheduleDto.schedule_content}</h3>
            <h3 id="base_id">${memberDto.name}</h3>
            <div id="backImage" class="container-fluid bg-1 text-center" style="position: absolute;">       
                 <div><img src="/final/save/${memberDto.pImage}" class="img-circle" width="100" height="100"></img></div>
            </div>
         </div>
      </div>
      <br>
      <c:forEach var="timetable" items="${timetableDto}" varStatus="status">
         <c:if test="${timetable.timetable_title!='null'}">
            <div id="story_${timetable.timetable_title}" class="subject">
               <h2 id="schedule_subject">${timetable.timetable_title}</h2><br>
               <h1 class="schedule_subject"></h1>
               <div id="content" class="content">
               </div>
               <h2 id="position">위치정보 : ${timetable.timetable_address}</h2>
               <div id="map_${timetable.timetable_address}" class="printMap" style="width:50%;height:350px;margin:8px;"></div>   
               <script type="text/javascript">
               //<!--
               /*
                  var staticMapContainer  = document.getElementById("map_${timetable.timetable_address}"); // 이미지 지도를 표시할 div 
                  var geocoder = new daum.maps.services.Geocoder();

                  geocoder.addr2coord("${timetable.timetable_address}", function(status, result) {
                     staticMapOption = { 
                             center: new daum.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
                             level: 3 // 이미지 지도의 확대 레벨
                         };
                     
                     alert(result.addr[0].lat);
                           // result.addr[0].lng
                     var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
                  });
               */   
                      
                  
                  // 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
                  
                  createMap("${timetable.timetable_address}", "${timetable.timetable_title}");
                  // createQR("${timetable.timetable_address}", "${timetable.timetable_title}");
               //-->
               </script>
            
            </div>
            <br>
         </c:if>
      </c:forEach>

   
   </body>
</html>