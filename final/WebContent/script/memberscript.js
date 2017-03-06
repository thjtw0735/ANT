/**
 * 
 */
var idnull = "아이디를 입력하세요.";
var passwdnull = "비밀번호를 입력하세요.";
var repasswdnull = "비밀번호가 다릅니다.";
var namenull = "이름을 입력하세요.";
var emailnull = "이메일이 형식에 맞지 않습니다.";
var emailfindnull = "존재하지 않는 이메일 입니다.";
var duplication = "아이디 중복확인을 해주세요."; 
var passwdfindnull = "형식에 맞지 않습니다.";

// 에러 처리
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시시도하세요.";
var iderror = "입력하신 아이디가 없습니다.\n다시 확인하세요.";
var passwderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
var deleteerror = "회원탈퇴에 실패했습니다.\n잠시 후 다시시도하세요.";
var modifyerror = "회원정보수정에 실패했습니다.\n잠시 후 다시시도하세요.";
function erroralert( msg ) {
	alert( msg );
	history.back();
}

//메인페이지





function loginfocus() {
	loginform.id.focus();
}
function logincheck() {
	if( ! loginform.id.value ) {
		alert( idnull );
		mainform.id.focus();
		return false;
	} else if( ! loginform.passwd.value ) {
		alert( passwdnull );
		loginform.passwd.focus();
		return false;
	}
}

// 로그인 페이지

function loginfocus() {
	loginform.id.focus();
}
function logincheck() {
	if( ! loginform.id.value ) {
		alert( idnull );
		mainform.id.focus();
		return false;
	} else if( ! loginform.passwd.value ) {
		alert( passwdnull );
		loginform.passwd.focus();
		return false;
	}
}

//가입 페이지
function inputfocus() {
	inputform.id.focus();
}
function inputcheck() {
	if( inputform.duplication.value == 1){
		
	} else {
		alert( duplication );
		inputform.id.focus();
		return false;
	}
	if( ! inputform.id.value ) {
		alert( idnull );
		inputform.id.focus();
		return false;
	} else if ( ! inputform.passwd.value){
		alert( passwdnull);
		inputform.passwd.focus();
		return false;
	} else if ( inputform.passwd.value != inputform.repasswd.value ){
		alert( repasswdnull);
		inputform.repasswd.focus();
		return false;
	} else if ( ! inputform.name.value ){
		alert( namenull );
		inputform.name.focus();
		return false;
	} 
	
	// 이메일 유효성 검사
	// 1. null
	// 2. 직접입력인 경우 '@'가 있어야 한다.
	// 3. 선택입력인 경우 '@'가 없어야 한다.
	
	if ( inputform.email1.value ){
		// 입력 o
		
		if( inputform.email2.value == "0"){
	        //직접입력
	        if( inputform.email1.value.indexOf('@') == -1 || 
	           (inputform.email1.value.indexOf("@")) != (inputform.email1.value.lastIndexOf("@"))){
	           alert( emailnull );
	           inputform.email1.focus();
	           return false;
	        }
	     } 
		else {
			// 선택입력
			if( inputform.email1.value.indexOf('@') != -1 ){
				alert( emailnull );
				inputform.email1.focus();
				return false;
			}
		}
	}
}

//아이디 찾기
function idfind() {
	
	 //새창의 크기

	var url = "idfindForm.do";
	open(url , "idfind" , "scrollbar=no, status=no, width=800, height=150");
	
}

//비밀번호 찾기
function passwdfind() {
	
	 //새창의 크기
		
		var url = "passwdfindForm.do";
		open(url , "passwdfind" , "scrollbar=no, status=no, width=800, height=150");
	
}

function passwdfindfocus() {
	passwdfindform.id.focus();
}

function passwdfindcheck() {
	if( ! passwdfindform.id.value && ! passwdfindform.email.value ) {
		alert(	passwdfindnull );
		passwfindform.id.focus();
		return false;
	}
}


function idfindcheck() {
	if( ! idfindform.email.value ) {
		alert( idnull );
		indfindform.email.focus();
		return false;
	}
}

function idfindfocus() {
	idfindform.email.focus();
}


// 아이디 중복확인
function confirmid() {
	if( ! inputform.id.value ) {
		alert( idnull );
		inputform.id.focus();
	} else {
		var url = "confirmId.do?id=" + inputform.id.value;
		open( url, "confirm", "scrollbar=no, status=no, width=900, height=500" );
	}	
}
function setid( id ) {
	opener.document.inputform.duplication.value = "1";
	opener.document.inputform.id.value = id;
	window.close();
}
function confirmfocus() {
	confirmform.id.focus();
}
function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( idnull );
		confirmform.id.focus();
		return false;
	}
}

// 회원 탈퇴
function deleteform() {
	
	 //새창의 크기
	var url = "deleteForm.do";
	open(url , "deleteForm" , "scrollbar=no, status=no, width=800, height=150");
}

function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwdnull );
		passwdform.passwd.focus();
		return false;
	}	
}

 //회원정보 수정

function modifyform() {
	 
	var url = "modifyForm.do";
	open(url , "modifyForm" , "scrollbar=no, status=no, width=800, height=150");
}




function modifyfocus() {
	modifyform.passwd.focus();
}

function modifycheck() {
	if( ! modifyform.passwd.value){
		alert( passwdnull);
		modifyform.passwd.focus();
		return false;
	} else if( modifyform.passwd.value != modifyform.repasswd.value ) {
		alert( repasswdnull );
		modifyform.repasswd.focus();
		return false;
	} else if( modifyform.email1.value || modifyform.email2.value ) {
		if( ! modifyform.email1.value || ! modifyform.email2.value){
			alert(emailnull);
			modifyform.email1.focus(0);
			return false;
		}
	}
}

