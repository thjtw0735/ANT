
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<div id="overLayer" onmouseleave="mouseout()" style="background-color:skyblue;">
		<c:forEach var="schedule" items="${scheduleDto}" varStatus="status"> 
			<div id="overLayer${status.count}" style="float:left; background-color:skyblue; padding:10px; padding-right:5px;">
				<a href="modifyScheduleView.do?schedule_num=${schedule.schedule_num}" target="_blank">
					${schedule.schedule_subject} </a> <br>
					${schedule.schedule_content}
					<br>
					<img class="ant_image" src="/final/image/jeju1.jpg" style="width:200px;height:150px;">
			</div>
		</c:forEach>
	</div>

