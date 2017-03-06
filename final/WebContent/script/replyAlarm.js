/**
 * 
 */

	var i=0;
	var t= null;
	function viewText1() {
		++i;
		document.all["alarmImg"].src = "/final/image/alarm" + i + ".png";
		if(i == 2) {
			i=0;
		}
		t = setTimeout("viewText1()",2000); //재귀호출을 사용한다.
	}

	var request = null;
	var interval = null;
	var memId = null;
	window.onload = function(){
		 myFunction();
	}
	
	function myFunction() {
	
		memId = hidden.memId.value;
		
		if( memId == null || memId ==""){
			return false;
		} else {
			interval = setInterval(function(){
				var params = "memId=" + memId;
				request = new Request( idresult, "replyCheck.do" , "GET", params);
				request.sendRequest();
			}, 4000);
		}
		
	}
	
	function idresult(){
		var console = document.getElementById("console");
		var result = document.getElementById("idvalue");
		if(request.httpRequest.readyState == 4){
			if(request.httpRequest.status == 200){
				var str = eval( "(" + request.httpRequest.responseText + ")" );
					if( str == 0 ){
					} else if( str == 1 ){
						var url =  "reply.do";
						clearInterval(interval);
						
						var alarmImg = document.getElementById("alarmImg");
						
						viewText1();
					}
				console.innerHTML = "정상종료";
			} else {
				console.innerHTML = "에러발생";
			}
		} else {
			console.innerHTML = "통신중";
		}
	}
	

	
	function replyList() {
		clearTimeout(t);
		var mem = hidden.memId.value;
		var alarmImg = document.getElementById("alarmImg");
		alarmImg.setAttribute("src", "/final/image/alarm.png");

		var url =  "reply.do?memId=" + mem;
		open(url, "thumbnail","scrollbar=no, location=no, status=no, width=520, height=500, left=1000, top=150");
	}
	
	function openUrl( schedule_num ) {
		var url = "modifyScheduleView.do?schedule_num=" + schedule_num;
		window.open(url, 'popup','width=700, height=600, left=200, top=150');
	}
	