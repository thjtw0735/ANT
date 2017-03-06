<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/final/css/reply.css">
<script src="/final/request/request.js"></script>
<script type="text/javascript">
	//<!--
	// 댓글 입력
	var request = null;
	function replyappend() {
	var id = inputform.loginId.value;
	var schedule_num = inputform.schedule_num.value;
		if ( ! id ){
			alert("로그인 후 댓글을 남기실 수 있습니다.");
		} else {
			if ( ! inputform.content.value) {
				alert("내용을 입력해 주세요");
			} else {
				var params = "id=" + id + "&schedule_num=" + schedule_num + "&content=" + inputform.content.value;
				
				request = new Request( appendresult, "replyAppend.do", "GET", params );
				request.sendRequest();
			}
		}
	}
	function appendresult() {
		var console = document.getElementById("console");
		var list = document.getElementById( "list" );
		var count = document.getElementById( "count" );
		if(request.httpRequest.readyState == 4 ){
			if(request.httpRequest.status == 200 ){
				var msg ="";
				var xmldoc = request.httpRequest.responseXML;
				var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
				if( code == "success" ){
					var comment = eval( "(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
					var newdiv = makecomment( comment );
					list.append( newdiv );
					
					count.innerHTML = comment.count;					
					inputform.content.value = "";
					msg += "입력 성공";
				} else if(code == "error" ) {
					var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
					msg += message;
				}
				console.innerHTML = msg;				
			} else {
				console.innerHTML = "입력 에러 발생";
			}
		} else {
			console.innerHTML = "입력중...";
		}
	}
	
	function makecomment( comment ){
		var newdiv = document.createElement("div");
		newdiv.setAttribute( "id", "comment_" + comment.num );
		if(comment.pImage == null || comment.pImage ==""){
			comment.pImage = "none.png"; 
		}
		newdiv.innerHTML
			= "<li class='commentRoot'>"
		    +    	"<div>"
		    +    	'<div class="profile-img">'
		    +        	'<a target="_blank" href="/myPage/user/1b7356c5856558e9?active=myPlan" class="user">'
		    +        		'<img src="/final/save/'+ comment.pImage +'">'
		    +        	'</a>'
		    +    	'</div>'
		    +    	'<div class="comment-contents">'
		    +        	'<div class="comment-info">'
			+            	'<div class="name-date">'
			+	            	'<a target="_blank" href="/myPage/user/1b7356c5856558e9?active=myPlan" class="user">'
			+	            		'<span class="username">' + comment.id + '</span>'
			+	            	'</a>'
			+            		'<span class="update-date">'+ comment.date+'</span>'
			+            	'</div>'
			+           	'<div class="btn-box">'
			+            		'<a class="btn-reply" onclick="replydelete('+"\'"+ comment.num + "','" + comment.id +"\'" + ')"><img src="http://wishbeen.co.kr/images/btn-note-cncl.png" alt=""></a>'
			+            	'</div>'
		    +        	'</div>'
		    +    		'<div class="comment-txt"><p class="comment-content-for-find">'+ comment.content +'</p></div>'
		    +    	'</div>'
		    +	'</div>'
			+ '</li>';
				

		newdiv.comment = comment;
		return newdiv;
	}
	
	
	// 댓글 목록
	window.onload = function(){
		replylist();
	}
	function replylist(){
		var schedule_num = inputform.schedule_num.value;
		var params = "schedule_num=" + schedule_num;
		request  = new Request(listresult, "replyList.do", "POST", params);
		request.sendRequest();
	}
	function listresult(){
		var console = document.getElementById( "console" );
		var list = document.getElementById("list");
		var count = document.getElementById("count");
		if( request.httpRequest.readyState == 4 ) {
			if( request.httpRequest.status == 200 ) {
				var msg = "";
				var xmldoc = request.httpRequest.responseXML;
				var code = xmldoc.getElementsByTagName("code").item(0).innerHTML;
				if( code == "success"){
					var comments = eval( "(" + xmldoc.getElementsByTagName("data").item(0).innerHTML + ")" );
					for( var i=0; i<comments.length; i++ ){
						var newdiv = makecomment( comments[i] );
						list.appendChild( newdiv );
					}
					count.innerHTML = comments[0].count;
					msg += comments.length + "개의 글이 있습니다.";
				}	else if (code == "error") {
					var message = xmldoc.getElementsByTagName("message").item(0).innerHTML;
					
					msg +=message;
				}
				
				
				console.innerHTML = msg;
			} else {
				console.innerHTML = "리스트 에러발생";
			}
		} else {
			console.innerHTML = "리스트 출력중..."
		}
	}
	// 댓글 삭제
	function replydelete( num , comment ) {
		var loginId = inputform.loginId.value;
		var schedule_num = inputform.schedule_num.value;
		if( loginId == comment ) {
			var params = "num=" + num + "&schedule_num=" + schedule_num;
			request = new Request( deleteresult, "replyDelete.do", "POST", params );
			request.sendRequest();
		} else {
			alert("본인이 작성한 댓글만 삭제 가능합니다.");
		}
	}	
	function deleteresult() {
		var console = document.getElementById("console");
		var list = document.getElementById("list");
		var count = document.getElementById( "count" );
		if(request.httpRequest.readyState == 4 ){
			if(request.httpRequest.status == 200 ){
				var msg="";
				var xmldoc = request.httpRequest.responseXML;
				var code = xmldoc.getElementsByTagName("code").item(0).innerHTML;
				if (code == "success" ){
					var comment = eval( "(" + xmldoc.getElementsByTagName("data").item(0).innerHTML + ")" );
					var deldiv = document.getElementById("comment_" + comment.num );
					list.removeChild( deldiv );
					
					count.innerHTML = comment.count;
					msg+= num + ("번 글 삭제 성공");
				} else if ( code == "error" ) {
					var message = xmldoc.getElementsByTagName("message").item(0).innerHTML;
					msg += message;
				}
				console.innerHTML = msg;
			} else {
				console.innerHTML = "삭제 에러 발생";
			}		
		} else {
			console.innerHTML = "삭제중...";
		}
	}

	//-->
</script>    
		
	<form name="inputform">		
		<div class="comment-wrap" id="plan-detail-comment-wrap-area">
          <!-- <h3>댓글 (<span class="plan-comment-count">2</span>)</h3> -->
          <h3>댓글 (<span id="count" class="plan-comment-count"></span>)</h3>
          
          <div class="view-comment">
            <div id="plan-detail-comment-area">
            	<div class="plan-comment">
	            	<div class="spot-comment-content">
		            	<div class="comment-write">
			            	<div class="my-p">
				            	<div class="my-p-img">
				            	<div><img src="https://wishbeen.akamaized.net/v2.5/images/wb_base_profile.jpg"></div>
				            	</div>
			            	</div>
			            	<textarea class="form-control new-comment-textarea" id="content" placeholder="댓글을 남겨주세요."></textarea>
			            	<div class="comment-edit-btns">
			            		<!-- <button class="btn btn-primary save-new-comment" onclick="replyappend()">저장</button> -->
			            		<input class="btn btn-primary save-new-comment" type="button" value="작성" onclick="replyappend()">
			            	</div>
		            	</div>
	            	</div>
	            	<div class="spot-comment-list">
		            	<ul class="comment-list" id="list">
		            	</ul>
	            	</div>
	            	<div class="comment-more-btn-area pagination hide"><a class="comment-more-btn btn-more">더보기</a></div>
	            </div>
            </div>
          </div>
        </div>
		<table>
			<tr>
				<td>
					<input type="hidden" name="loginId" value="${sessionScope.memId}">
					<input type="hidden" name="schedule_num" value="${schedule_num}">
				</td>
			</tr>
		</table>
	</form>
			
<!-- 메시지 콘솔 -->

<div id="console">

<%-- <!-- 댓글 입력 -->
<hr size="2" color="red" width="50%">
<div id="append">
	<form name="inputform">
		<table>
			<tr>
				<td>
					<input type="text" class="input" name="content"/>
					<input class="inputbutton" type="button" value="작성" onclick="replyappend()">
					<input type="hidden" name="loginId" value="${sessionScope.memId}">
					<input type="hidden" name="schedule_num" value="${schedule_num}">
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- 댓글 목록 -->
<div id="list"></div> --%>