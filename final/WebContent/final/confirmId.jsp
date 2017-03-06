<%@page import="dao.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="membersetting.jsp"%>  
<link rel="stylesheet" type="text/css" href="/final/css/confirmId.css">
<script src="/final/script/memberscript.js"></script>





   <c:if test="${result == 0}">
      <body>
         <form name = "confirmform" method="post" action="confirmId.do">
         <div class="confirm_main">
            <div class="confirm_font">Ant 회원 아이디 중복검사</div>
            <div class="id_check">
               <span>${id}</span>는 사용할 수 있는 아이디 입니다.
            </div>
            <input class="confirm_bt3" type="button" value="${btn_ok}" 
                        onclick="setid('${id}')">
         </div>
      </form>
      </body>
   </c:if>
   <c:if test="${result != 0}">
      <body onload="confirmfocus()">
         <form name = "confirmform" method="post" action="confirmId.do"
            onsubmit="return confirmcheck()">
            <div class="confirm_main">
               <div class="confirm_font">Ant 회원 아이디 중복검사</div>
               <div class="id_cehck">
                  <span>${id}</span>${msg_id_o}
               </div>
               <div class="confirm_id">
                  <label class="confirm_input">다른아이디 입력</label><input class="input" type="text" name="id" maxlength="20" placeholder="아이디">
               </div>
               <div>
                  <input class="confirm_bt1" type="submit" value="${btn_ok}">
                  <input class="confirm_bt2" type="button" value="${btn_ok_cancel}" onclick="self.close()">
               </div>
            </div>      
         </form>
      </body>
   </c:if>