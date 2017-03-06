<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.schedule.ScheduleDao"%>
<%@page import="dao.schedule.ScheduleDataBean"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html> 
   <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" type="text/css" href="/final/css/inputform.css">
      <link rel="stylesheet" type="text/css" href="/final/css/top_navigation.css">
      <script src="/final/script/memberscript.js"></script>
      <script src="/final/script/top_navigation.js"></script>
      <script src="/final/script/request.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
      
<style type="text/css">
/* UI Object */
html, body{height:100%;margin:0}
.mw_layer{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
.mw_layer.open{display:block}
.mw_layer .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
#layer{position:absolute;top:50%;left:50%;width:400px;margin:-150px 0 0 -194px;padding:28px 28px 0 28px;line-height:normal;white-space:normal}
/* //UI Object */
</style>
      
   </head>
   
   <body onload="inputfocus()">
    <c:if test="${sessionScope.memId == null}">
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
         <p><a href="#layer" class="layer_trigger1">로그인</a></p>
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
</c:if>
<c:if test="${sessionScope.memId != null}">
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
   </div>
</c:if>
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
        <div class="mainback">
	<form name="inputform" method="post" action="inputPro.do"
      onsubmit="return inputcheck()">
      <div class="wrapper">   
          <div class="main">   
              <div class="input_box">
                 <br>
                 <div>
                  <dt><label>  User ID</label></dt>
                  <ddd>
                     <input class="id_width" name="id" id="id" type="text" size = "30" maxlength="20"  placeholder="아이디" onkeydown="idStartCheck()">
                     <input class="modifybutton" type="button" value="중복확인" onclick="confirmid()">
                     <br>
                  <div id="idcheck"><div id="idvalue"></div></div>
                  </ddd>
                 </div>
                 <div class='arrow_box' id="id_notice">
                    <ul>
                  <li><a class="notice" id="info_id1">* 영문 또는, 영문과 숫자의 조합으로 설정해주시기 바랍니다. </a></li>
                    </ul>
                 </div>
               <div>
                  <dt><label>  PassWord</label></dt>
                  <dd><input id="pass" name="passwd" type="password" size = "30" maxlegnth="20" placeholder="비밀번호"></dd>
                 </div>
                <div class='arrow_box' id="pass_notice">
                    <ul>
                  <li><a class = "notice" id="info_pass1">* 영문과 숫자의 조합으로 설정해주시기 바랍니다.</li>
                   </ul>
                   </div>
                 <dt><label>  PassWord Check</label></dt>
                 <dd><input id="repass_ch" name="repasswd" type="password" size = "30" maxlength="20" placeholder="비밀번호 확인" onkeydown="pwStartCheck()"></dd>
                
               <div id="passwd"><div id="pwvalue"></div></div>
                <div class='arrow_box' id="pass_ch_notice" style="display:none;">
                     <ul>
                   <li><a class = "notice" style="color:red;">비밀번호를 확인해 주세요.</a></li>
                     </ul>
                   </div>
              
                 <dt><label>  Name</label></dt>
                 <dd><input id="name" name="name" type="text" size = "30" maxlength="20" placeholder="이름"></dd>
               
               <div>
                  <dt><label>  Email</label></dt>
                  <input class="E1" name="email1"type="text" maxlength="30" size="30" >
                  @
                  <input class="E2" name="email2" onkeydown="emailStartCheck()">
                  <select class="E3" name="email3">
                     <option value="0">직접입력</option>
                     <option value="daum.net">다음</option>
                     <option value="naver.com">네이버</option>
                     <option value="gmail.com">구글</option>
                  </select>
               </div>
               <div id="emailcheck"><div id="emailvalue"></div></div>
               <br>
               <input type="hidden" name="duplication" value="0">
               <div class="inputbutton">
                  <input class="inputbutton1" type="submit" value="가입" >
                  <input class="inputbutton2" type="button" value="가입취소" onclick="location='main.do'">
               </div>
            </div>
            </div>   
      </div>
   </form>
   </div>
 </body>
<div id="console"></div>


<script type="text/javascript">
   //<!--
   
   //email 선택부분
   $(document).ready(function() {
      $('select').on('change' , function(){
         var email22 = $(this).val();
            $('.E2').val(email22);
      });
   }); 
   
   
   //Ajax 부분 유효성검부분
   
   
   var request = null;
   var idCheckFirst = true;
   var idLoopSendKeyword = false;
   var idLastKeyword = null;
   var pwCheckFirst = true;
   var pwLoopSendKeyword = false;
   var pwLastKeyword = null;
   var emailCheckFirst = true;
   var emailLoopSendKeyword = false;
   var emailLastKeyword = null;
   
   function hide( elementid ){
      var element = document.getElementById( elementid );
      if( element ){
         element.style.display = "none";
      }
   }
   
   function show ( elementid ){
      var element = document.getElementById( elementid );
      if( element ){
         element.style.display = "";
      }
   }
   
   
   function idStartCheck(){
      if( idCheckFirst == true ){
         idLoopSendKeyword = true;
         setTimeout( "idCheck()", 500 );
      }
      idCheckFirst = false;
   }
   
   function idCheck() {
      if( idLoopSendKeyword == false ) return;
      var id = inputform.id.value;
      if( id == "" ){
         idLastKeyword = "";
         hide("idcheck")         
      } else if (id != idLastKeyword) {
         if( id != "" ){
            idLastKeyword = id;
            var params = "id=" + inputform.id.value;
            request = new Request( idresult, "idCheck.do" , "POST", params);
            request.sendRequest();
         } else {
            hide("idcheck");
         }
      }
      setTimeout( "idCheck()", 500);
   } 
   
   function idresult(){
      var console = document.getElementById("console");
      var result = document.getElementById("idvalue");
      if(request.httpRequest.readyState == 4){
         if(request.httpRequest.status == 200){
            var xmldoc = request.httpRequest.responseText;
               idvalue.innerHTML = xmldoc;
               show("idcheck");
            console.innerHTML = "정상종료";
         } else {
            console.innerHTML = "에러발생";
         }
      } else {
         console.innerHTML = "통신중";
      }
   }
   
   function emailStartCheck(){
      if( emailCheckFirst == true ){
         emailLoopSendKeyword = true;
         setTimeout( "emailCheck()", 500 );
      }
      emailCheckFirst = false;
   }
   
   function emailCheck() {
      if( emailLoopSendKeyword == false ) return;
      var email = inputform.email1.value +"@"+ inputform.email2.value || inputform.email3.value;
      if( email == "@" ){
         emailLastKeyword = "";
         hide("emailcheck")         
      } else if (email != emailLastKeyword) {
         if( email != "" ){
            emailLastKeyword = email;
            var params = "email=" + inputform.email1.value + "@" + inputform.email2.value || inputform.email3.value;
            request = new Request( emailresult, "emailCheck.do" , "POST", params);
            request.sendRequest();
         } else {
            hide("emailcheck");
         }
      }
      setTimeout( "emailCheck()", 500);
   }
   
   function emailresult(){
      var console = document.getElementById("console");
      var result = document.getElementById("emailvalue");
      if(request.httpRequest.readyState == 4){
         if(request.httpRequest.status == 200){
            var xmldoc = request.httpRequest.responseText;
               emailvalue.innerHTML = xmldoc;
               show("emailcheck");
            console.innerHTML = "정상종료";
         } else {
            console.innerHTML = "에러발생";
         }
      } else {
         console.innerHTML = "통신중";
      }
   } 
   
   
   function pwStartCheck(){
      if( pwCheckFirst == true ){
         pwLoopSendKeyword = true;
         setTimeout( "pwCheck()", 500 );
      }
      pwCheckFirst = false;
   }
   
   function pwCheck() {
      if( pwLoopSendKeyword == false ) return;
      var repasswd = inputform.repasswd.value;
      if( repasswd == "" ){
         pwLastKeyword = "";
         hide("passwd")         
      } else if (repasswd != pwLastKeyword) {
         if( repasswd != "" ){
            pwLastKeyword = repasswd;
            var params = "passwd=" + inputform.passwd.value + "&repasswd=" + inputform.repasswd.value;
            request = new Request( pwresult, "passwdCheck.do" , "POST", params);
            request.sendRequest();
         } else {
            hide("passwd");
         }
      }
      setTimeout( "pwCheck()", 500);
   }
   
   function pwresult(){
      var console = document.getElementById("console");
      var result = document.getElementById("pwvalue");
      if(request.httpRequest.readyState == 4){
         if(request.httpRequest.status == 200){
            var xmldoc = request.httpRequest.responseText;
               pwvalue.innerHTML = xmldoc;
               show("passwd");
            console.innerHTML = "비밀번호 정상종료";
         } else {
            console.innerHTML = "비밀번호 에러발생";
         }
      } else {
         console.innerHTML = "비밀번호 통신중";
      }
   }
   
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
	http://earthtory.com/res/img/main/key_bg_1.jpg
	function story_search(e){
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

      

      
   //-->
</script>

</html>