<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/final/script/createStory.js"></script>
<script src="/final/script/createSchedule.js"></script>
<title></title>
</head>
 <!-- onsubmit="return registerPost(${index})"  -->
<body>
<form method="post"  enctype="multipart/form-data" action="uploadImg.do" onsubmit="return registerPost(${index})">
	<table>
	<tr>
		<th>포스트작성</th>
	</tr>
	<tr>
		<td>
			<input type='text' id='story_subject' name="subject" value="${subject}">
		</td>
	</tr>
	<tr>
		<td>
	<div id="editor_panel" 
	class="editable medium-editor-element medium-editor-placeholder" 
	style="min-height: 500px;width:800px;" ondragstart="return false;" ondrop="return false;" contenteditable="true">
	${content}
	</div>
			<!--<textarea id="story_content" cols="100" rows='20'></textarea>-->
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<div id='upload'>
				<INPUT multiple="multiple" TYPE='FILE' id='uploadImage' size=25 name="img">
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div id="note_location_panel" class="write-location write-option" style="width:830;">
          		<div id="auto_search_spot_wrap" class="loca-wrap">
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<img id="imagePreview" src="#" width="100" height="100">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="확인">
			<input type="button">
		</td>
	</tr>
	</table>
</form>	
</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var fileUp = new Array();
var f = 0;
var cnt = 0;

var imgCnt = ${imgCnt};
alert("imgCnt : " + imgCnt);
function readUploadImage( inputObject ,cnt) {
	/*
	브라우저에서 FileReader가 지원되는지
	확인하기 위해 
	window.File && window.FileReader 
	해 본다. 
	안되면 안다고 알려 주면 되지~ ㅋㅋ
	*/
	if ( window.File && window.FileReader ) {
		/*
		입력된 파일이 1개 이상 있는지 확인~
		*/
		if ( inputObject.files && inputObject.files[0]) {
			/* 이미지 파일인지도 체크해 주면 좋지~ */
			if ( !(/image/i).test(inputObject.files[0].type ) ){
				alert("이미지 파일을 선택해 주세요!");
				return false;
			}
			/* FileReader 를 준비 한다. */
			var reader = new FileReader();
			reader.onload = function (e) {
			/* reader가 다 읽으면 imagePreview에 뿌려 주면 끝~  */
			
			// $('#imagePreview').attr('src', e.target.result);
			var pic = document.getElementById('editor_panel');
			var tmp = document.createElement('div');
			var tmp2 = '<img id = "post_imagePriview'+(cnt+imgCnt)
						+'" width = "800" height="300" src="'+ e.target.result +'">'				
						+'<input class="imgClass" id="imgId_' + (cnt+imgCnt) +'" type="hidden" name="img_' + (cnt+imgCnt) + '" value="' + inputObject.files[0].name +'">';
						
			// tmp.innerHTML=tmp2;
			pic.innerHTML += tmp2;
			// pic.appendChild(tmp);	
			}

			/* input file에 있는 파일 하나를 읽어온다. */
			reader.readAsDataURL(inputObject.files[0]);
			fileUp = inputObject.files[0];
		}
	} else {
		alert( "미리보기 안되요.~ 브라우저를 업그레이드하세요~");
	}
}
	
	/*
	input 태그에 보통
	<element onchange="SomeJavaScriptCode">
	해 주던지 아님
	jquery를 이용해 change 이벤트를 달아 줘도 된다.
	*/
	

	//cnt => 사진마다 cnt 값 붙여서 구분
	


	
            
    $(document).ready( function() {
    	$(function(){
            $("body").on("change", "input[name='img']", function(){
                if(! $(this).val())
                    return;      
                var str;
                str="<INPUT multiple='multiple' TYPE='FILE' id='uploadImage' size=25 name='img'>";
                
                $("#upload").append(str);
                readUploadImage( this ,cnt)
                cnt++;
            });
        });
    });



	    

	//popup에서 데이터 가지고 createStory에 동적 추가
	function registerPost(index){
		var size = cnt+imgCnt;
		cnt = 0;
		alert("size : " + size);
		/* FileReader 를 준비 한다. */
		// alert($("#editor_panel>").html());
		var ischeck = opener.document.getElementById('post'+index);
		
		var storyindex = opener.document.getElementById(index);
		var tmp = document.createElement('div');
		// $("#editor_panel> #post_imagePriview"+cnt).src("/final/src/"+$("imgId_"+cnt).val());

		// alert($("#imgId_" + cnt).attr("src"));
		
		for(var i=0; i<size; i++) {
			
			var origin = "/final/save/" + $("#imgId_" + i).val();	
			 // alert("origin : " + origin);	
			 // alert($("#post_imagePriview"+i).attr("src"));
			$("#post_imagePriview"+i).attr("src",origin);
			 // alert($("#post_imagePriview"+i).attr("src"));
			 // alert("몇번째 자식 : " + $("#imgId_"+i).index());
		}
		
		var tmp2 = '<form id="postForm"><div id = "post'+index+'" class="postItem">'
		+'<h2 name="postSubject" class="postSubject">'+document.getElementById('story_subject').value+'</h2>'
		+'<h5 name="postContent" class="postContent">'
		+$("#editor_panel").html()+'</h5></div></form>';
		
		if(ischeck) {
			var tmp2 = '<h2 name="postSubject" class="postSubject">'+document.getElementById('story_subject').value+'</h2>'
			+'<h5 name="postContent" class="postContent">'
			+$("#editor_panel").html()+'</h5></div></form>';
			ischeck.innerHTML = tmp2;
			alert("modify");
		} else {
			alert("new");
			tmp.innerHTML=tmp2;
			storyindex.appendChild(tmp);	
		}

		// 이미지 삭제하는거..
		//포스트작성 -> 포스트 수정으로 변경, 제목 내용 이미지 다 부모창으로 가져감
		
		
		$("#btn_"+index, opener.document).text('포스트 수정');
		return true;
		close();

	}
	function deleteImage(cnt){
		alert('delteImage function call : '+ cnt);
		$("#pic"+cnt).remove();
	}
</script>
</html>


