<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>    

    
<c:set var="project" value = "/final/final"/>

<c:set var="page_main" value="메인 페이지"/>
<c:set var="page_input" value="회원 가입"/>
<c:set var="page_confirm" value= "아이디 중복 확인"/>
<c:set var="page_login" value="로그인"/>
<c:set var="page_delete" value="회원탈퇴"/>
<c:set var="page_modify" value ="회원 정보 수정"/>
<c:set var="page_default" value="에러 페이지"/>

<c:set var="msg_default" value = "처리할 수 없는 요청입니다.<br> Handler Mapping 에러입니다. <br> handler.properties 파일을 다시확인하세요. <br>"/>
<c:set var="msg_login" value = "비회원이시면 회원가입을 해주세요."/>
<c:set var="msg_login_o" value = "님 안녕하세요."/>
<c:set var="msg_input" value = "회원정보를 입력하세요"/>
<c:set var="msg_id_o" value = "는 이미 사용중인 아이디 입니다."/>
<c:set var="msg_id_x" value = "는 사용할 수 있는 아이디입니다."/>
<c:set var="msg_log" value = "가입에 성공하였습니다. 로그인 정보를 확인하세요."/>
<c:set var="msg_passwd" value = "비밀번호를 다시 입력해주세요"/>
<c:set var="msg_modify" value = "수정할 정보를 입력하세요."/>

<c:set var="str_id" value = "아이디"/>
<c:set var="str_passwd" value ="비밀번호"/>
<c:set var="str_name" value = "이름"/>
<c:set var="str_jumin" value = "주민등록번호"/>
<c:set var="str_tel" value = "전화번호"/>
<c:set var="str_email" value ="이메일"/>
<c:set var="str_reg_date" value = "가입일자"/>

<c:set var="btn_login" value ="로그인"/>
<c:set var="btn_cancel" value ="취소"/>
<c:set var="btn_input" value ="회원가입"/>
<c:set var="btn_modify" value = "정보수정"/>
<c:set var="btn_delete" value = "회원탈퇴"/>
<c:set var="btn_logout" value = "로그아웃"/>
<c:set var="btn_in" value = "가입"/>
<c:set var="btn_input_cancel" value ="가입취소"/>
<c:set var="btn_confirm" value ="중복확인"/>
<c:set var="btn_ok" value ="확인"/>
<c:set var="btn_ok_cancel" value ="확인취소"/>
<c:set var="btn_del" value = "탈퇴"/>
<c:set var="btn_del_cancel" value = "탈퇴취소"/>
<c:set var="btn_mod" value = "수정"/>
<c:set var="btn_mod_cancel" value = "수정취소"/>