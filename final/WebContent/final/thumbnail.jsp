<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<html>
<head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
   <link rel="stylesheet" href="/final/css/bootstrap-3.7.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  .bg-1 { 
      background-color: #1abc9c; /* Green */
      color: #ffffff;
  }
  .bg-2 { 
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
  }
  .bg-3 { 
      background-color: #fff; /* White */
      color: #555555;
  }
  
  .img-circle{
      border: solid; 
      border-radius:50%; 
   }

.fileUpload {
    position: relative;
    overflow: hidden;
    margin: 10px;
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
  </style>
</head>
<body>
   <c:if test="${resultupload eq 0}">
         <script type="text/javascript">
            alert("업로드 실패");
         </script>      
      </c:if>
      <c:if test="${resultupload eq 1}">
         <script type="text/javascript">
            //자식창에서 부모창 refresh하는거
            window.opener.location.href = window.opener.location.href;
            window.close();
         </script>
      </c:if>
      <script>
        $(document).ready(function(){
           
               function readURL(input) {
                   if (input.files && input.files[0]) {
                       var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                       reader.onload = function (e) { 
                       //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                       $('#'+input.id+'date').attr('src', e.target.result);
                          
                          
                           //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                           //(아래 코드에서 읽어들인 dataURL형식)
                       }                    
                       reader.readAsDataURL(input.files[0]);
                       //File내용을 읽어 dataURL형식의 문자열로 저장
                   }
               }//readURL()--
       
               //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
               $("#imgup").change(function(){
                    alert(this.value); //선택한 이미지 경로 표시
                   readURL(this);
               });
               $("#bimgup").change(function(){
//                    alert(this.value); //선택한 이미지 경로 표시
                   readURL(this);
               });
            });
       function sessionCheck(){
          var sessionid = null;
          
          if(!${sessionScope.memId}){
             return false;
          }
       }
      </script>
      
      <script>
         function pdelete(){
            frm.asd.value='0';
         }
         
         function bdelete(){
            frm.asdf.value='0';
         }
      </script>

<div  id="backImage" class="container-fluid bg-1 text-center" style="position: absolute;">


      <!-- 배경화면 보이는 곳 -->
        <div style="position: absolute; left: 0;"><img  src="${src2}" id="bimgupdate" width="500" height="200" ></img></div>

       <!-- 프로필 사진 보이는곳 -->
        <div style="position: relative; top: 20px; left: 100%;">
           
           <img src="${src}" id="imgupdate" class="img-circle" width="150" height="150">
           </img>
        </div>
       

</div>
<br><br><br><br><br><br>
<br><br><br><br><br><br>

<div>
    
   <form id="frm" method = "post"  enctype="multipart/form-data" action = "thumbnailPro.do" onsubmit="return sessionCheck()">
   
      <!-- <form id="frm" enctype="multipart/form-data">-->  <!-- 메소드방식은 반드시 포스트 -->
       <div class="fileUpload btn btn-primary">
          <span>프로필 업로드</span>
          <input type="file" id="imgup" class="upload" name="userfile"  value="${src}" accept="image/*" >
       </div>
       <div class="fileUpload btn btn-primary">
          <span>배경  업로드</span>
          <input type="file" id="bimgup" class="upload" name="buserfile"  value="${src2}" accept="image/*">
       </div>
       
       <input type="hidden" name="id" value="${id}">
         <input  type="hidden" name="asd" value="1">
         <input type="hidden" name="asdf" value="1">
       <table border="1">
          
          <tr>
             <td><input type="text" name="intro" value="${mdb.intro}"></td>
          </tr>
          <tr>
             <th colspan="2" align="center">
               <input type="submit" value="수정" onclick="checkcheck()">
               <input type="reset" value="취소">
               <button type="button"  onclick="pdelete()">프로필삭제</button>
               <button type="button"  onclick="bdelete()">배경 삭제</button>
            </th>
          <tr>   
       </table>
    </form>
       
    
</div>

