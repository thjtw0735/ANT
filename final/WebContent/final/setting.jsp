<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String project = "/final/final";

	String page_main = "메인 페이지";
	String page_input= "회원 가입";
	String page_confirm= "아이디 중복 확인";
	String page_login="로그인";
	String page_delete="회원탈퇴";
	String page_modify="회원 정보 수정";
	String page_default="에러 페이지";

	
	String msg_default = "처리할 수 없는 요청입니다.<br>"
						+ "Handler Mapping 에러입니다. <br>"
						+ "handler.properties 파일을 다시확인하세요. <br>";
	String msg_login = "비회원이시면 회원가입을 해주세요.";
	String msg_login_o = "님 안녕하세요.";
	String msg_input = "회원정보를 입력하세요";
	String msg_id_o = "는 사용할 수 없는 아이디입니다.";
	String msg_id_x = "는 사용할 수 있는 아이디입니다.";
	String msg_log = "가입에 성공하였습니다. 로그인 정보를 확인하세요.";
	String msg_passwd = "비밀번호를 다시 입력해주세요";
	String msg_modify = "수정할 정보를 입력하세요.";
	
	String str_id = "아이디";
	String str_passwd ="비밀번호";
	String str_name = "이름";
	String str_jumin = "주민등록번호";
	String str_tel = "전화번호";
	String str_email ="이메일";
	String str_reg_date = "가입일자";
	
	String btn_login ="로그인";
	String btn_cancel ="취소";
	String btn_input ="회원가입";
	String btn_modify = "정보수정";
	String btn_delete = "회원탈퇴";
	String btn_logout = "로그아웃";
	String btn_in = "가입";
	String btn_input_cancel ="가입취소";
	String btn_confirm ="중복확인";
	String btn_ok ="확인";
	String btn_ok_cancel ="확인취소";
	String btn_del = "탈퇴";
	String btn_del_cancel = "탈퇴취소";
	String btn_mod = "수정";
	String btn_mod_cancel = "수정취소";
%>