<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	</head>
	<body>
		<table class="table table-condensed">
	      <tr>
	         <th>댓글</th>
	         <td class="td_reply">
	            <div class="div_reply">            
	                <button type="button" id="commentSubmit" name="commentSubmit" class="btn_reply">확인</button>
	                <textarea id="commentText" class="ta_reply" rows="4"></textarea><!-- style="width:500px; height:100px" -->
	             </div>
	         </td>
	      </tr>
	   </table>
	   <table id="commentTable" class="write_ty2"></table>
	</body>
</html>

<script type="text/javascript">
	//<!--
	/*content 댓글달기 */
		$(function(){
		    $("#commentSubmit").click(function( event ) {
		          
		        //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
		        var Text = $("#commentText");

		        var now = new Date();
		        var nowYear = now.getFullYear();
		        var nowMonth = now.getMonth() + 1; 
		        var nowDate = now.getDate();
		        var nowHour = now.getHours();
		        var nowMt = now.getMinutes();        
		        var nowSc = now.getSeconds();          
		        
		        if($.trim(Text.val())==""){
		            alert("내용을 입력하세요.");
		            pText.focus();
		            return;
		        }
		          
		        var commentText = '<tr id="r1" name="commentCode">'+
		                                    '<td colspan=2>'+
		                                        '<strong>'+"관리자"+'</strong> <span style="font-size:12px;">'+
		                                        "("+nowYear+"-"+nowMonth+"-"+nowDate+" "+nowHour+":"+nowMt+":"+nowSc+") "
		                                        +'</span>|<a style="cursor:pointer;color:#888;font-size:12px;" name="Del"> 삭제 </a><p>'
		                                        +Text.val().replace(/\n/g, "<br>")+'</p>'
		                                  + '</td>'
		                        + '</tr>';
		          
		        //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
		        if($('#commentTable').contents().size()==0){
		            $('#commentTable').append(commentText);
		        }else{
		            $('#commentTable tr:last').after(commentText);
		        }
		          
		        $("#commentText").val("");
		        
		        /* url = insertReply.do?id=asd&?comment=Text.val()&schedule_num=3 */
		          
		    });
		    
		    //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
		    $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
		          
		        if($(this).attr("name")=="Del"){
		            if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		                  
		                var delComment = $(this).parent();
		                var delTr;
		                
		                  
		                delComment.remove();
		                  
		            }else{   //취소
		                return;
		            }                         
		             
		        }
		          
		    });
		});
	
	function getReply() {
		'<tr id="r1" name="commentCode">'+
        	'<td colspan=2>'+
            '<strong>'+"관리자"+'</strong> <span style="font-size:12px;">'+
            "("+nowYear+"-"+nowMonth+"-"+nowDate+" "+nowHour+":"+nowMt+":"+nowSc+") "
            +'</span>|<a style="cursor:pointer;color:#888;font-size:12px;" name="Del"> 삭제 </a><p>'
            +Text.val().replace(/\n/g, "<br>")+'</p>'
	    + '</td>'
	+ '</tr>';
		
	}
	//-->
</script>