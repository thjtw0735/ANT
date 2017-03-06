/**
 *  상단 기본정보 입력 스크립트
 */
function MainBack() {
	window.close();
}

function createSchedule() {
	var start_date = document.getElementById("start_date").value;
	var stay_date = document.getElementById("stay_date").value;
	
	window.close();
	var url = "createSchedule.do?start_date=" + start_date +"&stay_date="+stay_date;
	open(url, "일정만들기");
}