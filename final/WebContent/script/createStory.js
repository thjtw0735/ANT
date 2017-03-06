/**
 * 민유선이 만든 스크립트 파일
 * CreateStory 관련 스크립트
 */
function test(title, address,index) {
   alert(title);
   alert(address);
   var testtest = document.getElementById('testtest');
   var tmp = document.createElement('div');
   var tmp2 = '<div class="src">' +
               '<h5 id="title_'+index+'">' + title + '</h5>' +
               '<h5 id="address_'+index+'">' + address + '</h5>' +
            '</div>';
   tmp.innerHTML = tmp2;
   tmp.className = 'ttt';
   testtest.appendChild(tmp);
   alert("됫다");
   addStory(title,index,address);
	//타이틀가지고 <div> 하나 create 한다음 inputText2개랑 h5로 박음
}



