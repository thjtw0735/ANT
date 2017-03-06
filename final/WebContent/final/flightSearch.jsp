<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/final/css/flightSearch.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<title>Insert title here</title>
</head>
<body>

   <div class="ht_search_box">
         <div class="mainselection" style="display: inline;">
               
            <select id="select" class="select">
               <option value="GMP">김포</option>
               <option value="PUS">부산</option>
               <option value="CJJ">청주</option>
            </select>
         
            <select id="select1" class="select" >
               <option value="제주">제주</option>
               
            </select>
               
         </div>
         <div id="datebox" class="date_box" style="display: inline-block;">
            <input type="date" class="start_date hasDatepicker" value="출발일" id="depart">
            <input type="date" class="end_date hasDatepicker" value="도착일" id="arrive">
         </div>
         
   


         <div style="display: inline-block;">
            <select id="count" class="select">
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
            </select>
         </div>
         <div style="display: inline-block;">
            <select id="seat">
               <option value="YC">전체</option>
               <option value="Y">일반석</option>
               <option value="C">비즈니스석</option>
            </select>
         </div>
         <div class="flight" style="display: inline-block;"><input type="button" onclick="flight()"></div>
  </div>

   


   
   
</body>
</html>

<script type="text/javascript">
   // !<--
   function flight(){
         alert("ddd");
         var depart = document.getElementById("depart").value;
         var arrive = document.getElementById("arrive").value;
         depart =depart.replace(/-/g, ".");
         arrive = arrive.replace(/-/g, ".");
         
         var location = $("#select option:selected").val();
         var count = $("#count option:selected").val();
         var seat = $("#seat option:selected").val();
         
         var url = "https://store.naver.com/flights/results/domestic?trip=RT&fareType=" + seat +"&scity1=" + location
               +"&ecity1=CJU&scity2=CJU&ecity2=" + location +"&adult=" + count +"&child=0&infant=0&sdate1="+depart+".&sdate2="+arrive+".";
         
         
         open(url, "thumbnail","scrollbar=no, location=no, status=no, width=1200, height=1200");
   }
   // -->
</script>