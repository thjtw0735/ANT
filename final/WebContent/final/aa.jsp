<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
</style>

	<script type="text/javascript">
	// !<--
		var i=0;
		function viewText1() {
			++i;
			document.all["img1"].src = "/final/image/alarm" + i + ".png";
			if(i == 2) {
				i=0;
			}
			t = setTimeout("viewText1()",2000); //재귀호출을 사용한다.
		}
	</script>
<body>
	<img src="/final/image/alarm0.png" id="img1"><br><br>
	<input type="button" value="시작하기" onClick="viewText1();">
</body>
</html>