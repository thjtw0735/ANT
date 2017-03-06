<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/final/css/baseInformation.css">
	<script src="/final/script/baseInformation.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="schedule_basic">
		<img src="/final/image/airplane.png" width="40px" height="40px"> 여행시작일 <input id="start_date" type="date"> <br>
	 	<img src="/final/image/motel.png" width="40px" height="40px"> 예상숙박일  <input id="stay_date" type="text" size="20"> <br>
	 	<input id="schedule_btn" type="button" value="저장" onclick="javascript:createSchedule()">   
	 	<input id="schedule_btn" type="button" value="취소" onclick="javascript:MainBack()"> <br>
	</div>
</body>
</html>