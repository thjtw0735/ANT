<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
		<script type="text/javascript">
function ViewLayer(){
        document.getElementById("Pop_c").style.display='inline'
    }
</script>
<body>
<!-- 버튼버튼 -->
<a href="javascript:ViewLayer();"><img src="버튼이미지주소" alt=""></a>

<!-- 클릭시 보여질 레이어 -->
<div id="Pop_c" style="position:absolute; left:0; top:704px; z-index:1;display:none; width:950px; height:207px;">
</div>
		
</body>
</html>