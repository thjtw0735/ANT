<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
		<link rel="stylesheet" type="text/css" href="/final/css/bootstrap-3.7.css">
		<link rel="stylesheet" type="text/css" href="/final/css/mypage.css">

	 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	</head>
	<body>
		<%-- <jsp:include page="top_navigation.jsp"/>
		<br>	
		<div class="page-rotation">
	        <a href="main.do">홈</a>
		    <span> &gt; </span><a href="searchSchedule.do">마이페이지</a>
		</div>
		<br> --%>
		<jsp:include page="top_navigationMP.jsp" flush="false"/>
		
		<c:if test="${sessionScope.memId == null}">
			<c:redirect url="inputForm.do"/>
		</c:if>	
		
		<c:if test="${sessionScope.memId != null}">
			<center>
			<div  id="aa" class="container-fluid bg-1 text-center" 
   style="background-image: url(/final/save/${boriginName});  background-repeat:no-repeat;
   background-position: center; background-size: 100% 100%">
	<img id="bimgTest" src="/final/save/${boriginName}" hidden="1">
	<h3 id="ebtn"></h3><br>
	<h3 class='ptext1'>${intro}</h3>
		<img id="imgTest" src="/final/save/${originName}" class="img-circle" alt="Bird" width="200" height="200">

	<script type="text/javascript">
  	
	
	var msg1 = "";
	var msg = "";
		$(document).ready(function(){
			msg1 = $("#bimgTest").attr("src");
			msg = $("#imgTest").attr("src");

			var result = document.getElementById("result");
			
  			inputform.src.value = msg+"&src2="+msg1;
  			
		 
  		$("<input type='button' class='btn btn-success1' value='프로필수정' onclick='thumbnail()'>").appendTo('#ebtn');
  		
		});
	function thumbnail(){
			alert(inputform.src.value);
			var url = "thumbnail.do?src=" + inputform.src.value +"&id="+inputform.id.value;
			open(url, "thumbnail","scrollbar=no, location=no, status=no, width=500, height=700");
  			
		}

  </script>

  <br>

 
  

</div>
</center>

<div class="container-fluid bg-2 text-center">
  <h3>ANT</h3>
</div>
			<br>

			<div id="contents" class="mypage">
			    <div class="conts-container">
			        <div class="present">
			            <div class="tabs-list">
			                <ul>
								<li><a href="mypage.do?content=1"><span>여행일정</span></a></li>
								<li><a href="mypage.do?content=2"><span>여행스토리</span></a></li>
			                    <li><a href="/myPage/user/84e5bbe41a8db9fa?active=myFeed"><span>북마크</span></a></li>
								<li><a href="mypage.do?content=3"><span>알림</span></a></li>
			                </ul><!-- e// tabs -->
			            </div><!-- e//tabs-list -->
			        </div>
			    </div>
			    <div class="sum">
			    	<%-- <c:set var="content" value="${content}"></c:set> --%>
			    	<jsp:include page='contentInMp.jsp?content="${content}"' flush="false" />
				</div>
			</div>
		<br><br>
		</c:if>
	
		<jsp:include page="bottom_navigation.jsp" flush="false" />
	
		<div id="result"></div>
		<form name="inputform" hidden="1">
			<input type="text" name="src" value="{null}">
			<input type="text" name=id value="${sessionScope.memId}">
		</form>
	
	</body>
</html>