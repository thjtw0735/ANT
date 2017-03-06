/**
 *  일정만들기 페이지 스크립트
 */


// 사진관련 변수
var uploadImg;
var storyContent = new Array();
var storySubject = new Array(); 
var s=0;
var imgSet = new Array();


// ajax 관련변수
var request = null;

// 지도관련 변수
var i=0;
var arrayx = new Array();
var arrayy = new Array();
var polyline = null;
var marker = null;
var tmp = 1;
var numbertmp = 0;
var spot_num = 0;
var t=0;
var z = 0;
var m = 0;
var markerArr = new Array();

// 드래그앤들보관련 변수
var parentTarget;
var parentTargetHtml;

// 달력관련 변수
var date = new Array();
date[0] = "A";
date[1] = "N";
date[2] = "T";
var table = new Array(19);
var tablePlace = new Array(19);
var tablePosition = new Array();
var tableContent = new Array(19);
var xOffset = 0;
var yOffset = 0;
var tableContent2 = new Array();
var kkl;

function start() { 
	   $("#story").hide();
	}

function drag( target, event, title, address, index ) {
	event.dataTransfer.setData( "id", target.id );	
	event.dataTransfer.setData( "title", title );	
	event.dataTransfer.setData( "address", address );
	event.dataTransfer.setData( "index", index );
	parentTarget = document.getElementById( target.id ).parentNode;
	kkl = parentTarget.id;
	
}
function drop( target, event ) {
	if(!informationForm.start_date.value) {
		alert("출발날짜를 먼저선택하세요");
		return false;
	}
	if(!informationForm.end_date.value) {
		alert("도착날짜를 먼저선택하세요");
		return false;
	}
	if(target.childNodes.length>=2) {
	   alert("한 셀에는 하나의 내용만 입력가능합니다.");
	   return false;
	}
	
	
	var targetid = event.dataTransfer.getData( "id" );
	var title = event.dataTransfer.getData( "title" );
	var address = event.dataTransfer.getData( "address" );
	var index = event.dataTransfer.getData( "index" );

	// alert(parentTarget.id);

	
	var res = targetid.split("_");
	var res2 = target.id.split("(");
	
/*
	if(targetid.split("(")[1]) {
		var targetelement = document.getElementById( targetid );
		target.appendChild( targetelement );
	} else {
		var targetelement = document.getElementById( targetid );
		parentTarget.innerHTML = parentTarget.innerHTML;
		target.appendChild( targetelement );
	}
*/ 

	   

	var splittmp = parentTarget.id.split("(");
	

	if(splittmp[0]=="td") {
		var targetelement = document.getElementById( targetid );
		targetelement.setAttribute("id", splittmp[1]);
		target.appendChild( targetelement );
	} else {
		var targetelement = document.getElementById( targetid );
		parentTarget.innerHTML = parentTarget.innerHTML;
		targetelement.setAttribute( "id", target.id.split("(")[1] );
			
		var btnElement = document.createElement("button");
		btnElement.innerHTML += "<button onclick=deletePosition('"+ target.id.split("(")[1] + "','"+title+"') class='btn1'>삭제</button>";

		
		targetelement.appendChild(btnElement);
		target.appendChild( targetelement );
		
		addStory(title,s++,address);
	}

	
	/*
	if(res2[0]=="td") {
		if(res[0]=="1234") {
			var targetelement = document.getElementById( targetid );
			// parentTarget.innerHTML = parentTarget.innerHTML;
			target.appendChild( targetelement );
		} else {
			var targetelement = document.getElementById( targetid );
			target.appendChild( targetelement );
		}
	}
	*/

	
	
	/*
	var targetelement = document.getElementById( targetid );
	parentTarget.innerHTML = parentTarget.innerHTML;
	target.appendChild( targetelement );
	*/

	// markPoint(title, address);
	
	titmetableInsert(title, address,target, parentTarget.id);
	event.preventDefault();
	
}


function dropTable(target, event) {
	var targetid = event.dataTransfer.getData( "id" );
	var targetelement = document.getElementById( targetid );		
	target.appendChild( targetelement );			
	event.preventDefault();
}
function dragTable(target, event) {
	event.dataTransfer.setData( "id", target.id );	
}






//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;
	
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
        	
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
	//var test2 = "'";
	
	//var test1 = '<div onclick="test('+test2+places.title+"','"+places.address+"','"+(index+1)+test2+')">';
	// var test1 = '<div onclick="test('+"\'"+places.title+"','"+places.address+"','"+(index+1)+"\'"+')">';
	var test1 = '<div onMouseEnter="mouseover('+"\'"+places.title+"','"+places.address+"','"+(index+1)+"\'"+')">';
	// test1 = '<div onMouseOver="mouseover('+"\'"+places.title+"','"+places.address+"','"+(index+1)+"\'"+')">';
	//var test1 = "<div onclick='test('"+places.title+"','"+places.address+"','"+(index+1)+"')'>";
	//var test1 = "<div onclick="+\"+"+test(" + "'" + places.title + "','"+places.address+"','"+(index+1)+"')'>";

	
    var el = document.createElement('li'),
    itemStr = test1+'<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info" id="infoid">' + 
                
                '<h5 id="1234_'+ index+ '" draggable="true" ondragstart="drag( this, event,'+"\'"+places.title+"','"+ places.address+"','"+ index+"\'" +')">' + places.title + "</h5>";

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
    
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div></div>';           

    el.innerHTML = itemStr;
    el.className = 'item';
    
    return el;
}

function mouseover(title, address,index) {

	params = "title="+title;
	var mouseovertest = document.getElementById("mouseovertest");
	tempX = event.clientX + document.body.scrollLeft;
	tempY = event.clientY + document.body.scrollTop;
	mouseovertest.style.left = tempX;
	mouseovertest.style.top = tempY;
	$('#mouseovertest').css({
	     "top": tempY
	     ,"left": 50
	     , "position": "absolute"
	     , "z-index" : "5"
	});
	
	
	request = new Request( mouseroverresult, "mouseover.do", "GET", params );

	request.sendRequest();
}

function mouseout() {

	var mouseovertest = document.getElementById("mouseovertest");
	mouseovertest.style.display ="none";
}

function mouseroverresult() {
	var mouseovertest = document.getElementById("mouseovertest");
	if( request.httpRequest.readyState == 4 ) {
		if( request.httpRequest.status == 200 ) {
			
			var msg = "";
			var xmldoc = request.httpRequest.responseText;	
			var newdiv = document.createElement("div");
			newdiv.setAttribute("id", "mouseroverdiv");
			mouseovertest.innerHTML = xmldoc;
			mouseovertest.style.top = 200;
			mouseovertest.style.display = "block";
			
			

	
			/*
			var code = xmldoc.getElementsByTagName( "code" ).item(0).firstChild.nodeValue;
			if( code == "success" ) {
				var comment = eval( "(" + xmldoc.getElementsByTagName( "data" ).item(0).firstChild.nodeValue + ")");
				
				var newdiv = makecomment( comment );
				list.appendChild( newdiv );
									
				inputform.name.value = "";
				inputform.content.value = "";
				inputform.name.focus();					
				msg += "입력 성공";
			} 
			*/
			/*
			else if( code == "error" ) {
				var message = xmldoc.getElementsByTagName( "message" ).item(0).firstChild.nodeValue;
				msg += message;	
			}
			*/		
		} else {

		}			
	} else {

	}		
}




// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
    
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 
    
    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }
    
    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }
        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


////////////////// 타임테이블만들기/////////////////
function caldate() {
	var start_date1 = document.getElementById("start_date").value;
	var end_date1 = document.getElementById("end_date").value;
	// var stay_date = document.getElementById("stay_date").value;
	
	xOffset = 0;
	
	var start_date2 = new Date(start_date1);
	var end_date2 = new Date(end_date1);
	
	if(start_date2 > end_date2) {
		alert("도착날짜가 출발날짜보다 앞에있네요. 확인해주세요!!");
		return false;
	}
	
	var btMs = end_date2.getTime() - start_date2.getTime() ;
	var btDay = btMs / (1000*60*60*24);
/*
	for(var i=0; i<=btDay; i++) {
		start_date2.setDate(start_date2.getDate()+1);	
		date[i] = (start_date2.getMonth()+1) +"월" +(start_date2.getDate()-1) + "일";
	}*/
	
/*	date[0] = "A";
	date[1] = "N";
	date[2] = "T";
*/
	var params = "start_date=" + start_date1
	+ "&end_date=" + end_date1
	+ "&stay_date=" + btDay;
	
	request = new Request( caldateresult, "caldate.do", "POST", params );

	request.sendRequest();
	
}
function caldateresult() {
	var cursor = document.all ? "hand" : "pointer";
	
	if( request.httpRequest.readyState == 4 ) {
		if( request.httpRequest.status == 200 ) {	
			var msg = request.httpRequest.responseText;

			var res = msg.split( "/" );
				
			var start_date2 = new Date(res[1]);
			var end_date2 = new Date(res[2]);
				

			for(var i=0; i<=res[0]; i++) {
				start_date2.setDate(start_date2.getDate()+1);	
				date[i] = (start_date2.getMonth()+1) +"월" +(start_date2.getDate()-1) + "일";
				
			}
			
			var topBar = document.getElementById("topBar");
			var parentNode = topBar.parentNode;
			var newtrNode = document.createElement("tr");
			newtrNode.id = "topBar";
			var aStr = null;
			
			
			aStr = '<td width="60"> </td> <td class="table_Clear" width="60" align=left><div style="cursor:' + cursor + ';width:20px;" onclick="window.theGrid.scroll(-1,0);"><</div></td>'
			
			// 가운데 
			for ( var j = 0; j < 3; j++ )
			{
				aStr += '<th width=215><span>' + date[j] + '</span></th>';
				
			}
		
			// 오른쪽
			aStr += '<td width="60" align=right><div style="cursor:' + cursor + ';width:20px;" onclick="window.theGrid.scroll(1,0);">></div></td>';
				
			newtrNode.innerHTML = aStr;
			parentNode.replaceChild(newtrNode, topBar);
			
			
			
		} else {
	
		}			
	} else {

	}			
}

function createTimetable() {
	for (var i = 0; i < 19; i++) {
	    table[i] = new Array(10); // 매개변수는 배열의 크기
	}	
	for(var i=0; i<19; i++) {
		for(var j=0; j<10; j++) {
			table[i][j] = "";
		}
	}
	
	for (var i = 0; i < 19; i++) {
	    tablePlace[i] = new Array(10); // 매개변수는 배열의 크기
	}	
	for(var i=0; i<19; i++) {
		for(var j=0; j<10; j++) {
			tablePlace[i][j] = "";
		}
	}
	
	for (var i = 0; i < 19; i++) {
	    tableContent[i] = new Array(10); // 매개변수는 배열의 크기
	}	
	for(var i=0; i<19; i++) {
		for(var j=0; j<10; j++) {
			tableContent[i][j] = "";
		}
	}
	
	
	var time = ["06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00", 
		"19:00","20:00","21:00","22:00","23:00","24:00"];	
	// var date = ["2월 22일", "2월23일", "2월24일", "2월25일","2월26일","2월27일","2월28일","2월29일","3월1일","3월2일"];
	var data = 
	{
		nCol:3,
		nRow:19,
		nCellWidth:215,
		nCellHeight:200
	};
	data.colHeaders = date;	// 70개짜리 배열
	data.rowHeaders = time;	// 70개짜리 배열
	
	/*
	for ( var i = 0; i < currencies.length; i++ )
	{
		data.values.push(new Array());
		for ( var j = 0; j < currencies.length; j++ )
		{
			if ( i == j )
				data.values[i].push('-');
			else
				data.values[i].push(Math.round(10000*Math.random() / Math.random())/10000);
		}
	}
	*/
	new Grid('theGrid', data); 
}

///////////////////// 테이블 생성 ////////////////////////
function Grid(name, data)
{
	// store arguments
	this.name = name;
	this.data = data;
	var tmp = 0;
	var cursor = document.all ? "hand" : "pointer";
	
	// persist object for later use.
	window[name] = this;
	
	// initialize internal properties.
	data.values = new Array();
	
	
	// render table
	var aStr = new Array;
	aStr.push('<table border=1 cellpadding=0 cellspacing=0 id="' + this.name + '" class="' + this.name + '">');
	
	// column header row
	aStr.push('<tr id="topBar" class="info">');
	aStr.push('<td width="60"> 333</td> <td class="table_Clear" width="60" align=left><div style="cursor:' + cursor + ';width:20px;" onclick="window.' + this.name + '.scroll(-1,0);"><</div></td>');
	
	// 가운데 
	for ( var j = 0; j < this.data.nCol; j++ )
	{
		aStr.push('<th width=' + this.data.nCellWidth + '><span>' + this.data.colHeaders[j] + '</span></th>');
	}
	
	// 오른쪽
	aStr.push('<td width="60" align=right><div style="cursor:' + cursor + ';width:20px;" onclick="window.' + this.name + '.scroll(1,0);">></div></td>');
	aStr.push('</tr>');
	
	// data rows
	for ( var i = 0; i < this.data.nRow; i++ )
	{
		aStr.push('<tr class="active">');
		aStr.push('<th valign=top width="60"><span>' + this.data.rowHeaders[i] + '</span></th> <td width="60"> </td>');
		for ( j = 0; j < this.data.nCol; j++ ) {
			aStr.push('<td id="td('+ i + ','+j + '(" ondblclick="text('+ i +','+ j +')" ondrop="drop( this, event )" ondragenter="return false" ondragover="return false"><span style="overflow:hidden;width:' + this.data.nCellWidth + 'px;height:' + this.data.nCellHeight + 'px;' 
					+ 'text-align:left;">  </span></td>');
		}
		aStr.push('<td width="60"> </td>');
		aStr.push('</tr>');
	}
	

	aStr.push('</table>');
		
	// write HTML to document.
	document.write(aStr.join(''));
}

function text( i , j ) {
   var td = document.getElementById("td(" + i + "," + j + "(" );
   if(!informationForm.start_date.value) {
      alert("출발날짜를 먼저선택하세요");
      return false;
   }
   if(!informationForm.end_date.value) {
      alert("도착날짜를 먼저선택하세요");
      return false;
   }
   if(td.childNodes.length>=2) {
	   alert("한 셀에는 하나의 내용만 입력가능합니다.");
	   return false;
   } else {
	   
   }
   td.innerHTML ="<span style='overflow:hidden;width:215px;height:200px;' text-align:'left';></span><input type='text' id=text("+i+","+j+") onKeyup=checkContent('"+i+"','"+j+"')>";
   document.getElementById('text('+i+','+j+')').focus();
   // checkContent(i,j);
   
   
}
function checkContent(i,j) {

	var td = document.getElementById("text("+i+"," + j + ")" );	   
	var xOff = parseInt(xOffset);
	var jj = parseInt(j);
	tableContent[i][jj+xOff] = td.value;
    // alert("i : " + i + " j+t2 : " + (j+t2));

}
function checkContent2(tableContent) {
	var t2 = parseInt(xOffset);
	// alert("t2 : " + t2);

	for(var i=0; i<19; i++) {
		for(var j=0; j<date.length; j++) {
			if(tableContent[i][j]) {
					var td = document.getElementById("text("+i+"," + j + "(" );
					tableContent2[i] = td.value;
					tableContent[i][j] = td.value;
					tableContent[i][j] = "";	
			}
		}
	}

}
// locate all spans and control points
Grid.prototype.initialize = function()
{
	// alert(this.name);
	// if already initialized, return
	// if ( this.oTable ) return;
	
	this.oTable = document.getElementById(this.name);
	
	// get all <span> elements within the table
	var aSpan = this.oTable.getElementsByTagName('span');
	var n = 0;
	// the first few are all column headers
	this.aColSpan = new Array;
	
	for ( var j = 0; j < this.data.nCol; j++ ) {
		this.aColSpan.push(aSpan[n++]);
	}
	
	// the remainder are row headers and cells
	this.aRowSpan = new Array;
	this.aCellSpan = new Array;
	for ( var i = 0; i < this.data.nRow; i++ )
	{
		this.aRowSpan.push(aSpan[n++]);
		
		this.aCellSpan.push(new Array());
		for ( j = 0; j < this.data.nCol; j++ ) {

			this.aCellSpan[i].push(aSpan[n++]);

		}
	}
	
	// get all the <div> elements
	var aDiv = this.oTable.getElementsByTagName('div');
	
	// the vertical scroll is in aDiv[2]
	this.aVerticalTD = aDiv[1].getElementsByTagName('td');
	
 
}
 
// fill all the column/row headers and cell values
// and adjust the scroll bars
Grid.prototype.fill = function()
{

	this.initialize();
	// headers
	for ( var j = 0; j < this.data.nCol; j++ ) {
		this.aColSpan[j].innerHTML = this.data.colHeaders[j + xOffset];
		
	}
	for ( var i = 0; i < this.data.nRow; i++ )
		this.aRowSpan[i].innerHTML = this.data.rowHeaders[i + yOffset];
	/////////////
	
	// values
	// 우선 테이블에 있는 데이터를 모두 지워버린다.
	$("#theGrid h5").remove();
	$("#theGrid input").remove();
	// 그리고 이동에 따라서 새로운 데이터들을 innerHTML해서 넣는다.
	for ( i = 0; i < this.data.nRow; i++ ) {
		for ( j = 0; j < this.data.nCol; j++ ) {
			// alert(i + "," + j + " : " + this.aCellSpan[i][j].innerHTML);
			if(tablePlace[i][j + xOffset]) {

				this.aCellSpan[i][j].innerHTML = " &nbsp;";			
				this.aCellSpan[i][j].innerHTML = '<h5 id="1234_'+ numbertmp++ + '" draggable="true" ondragstart="drag( this, event,'+"\'"+tablePlace[i][j + xOffset]+"','"+ table[i][j + xOffset]+"\'" +')">' + tablePlace[i][j + xOffset] 
				+ "<button onclick=deletePosition('"+ i+","+j + "','"+tablePlace[i][j + xOffset]+"') class='btn1'>삭제</button></h5>";
			}
			
			if(tableContent[i][j + xOffset]) {
				// alert(i + "," + j + " : " + this.aCellSpan[i][j].innerHTML);
				// alert(i + "," + (j + xOffset) + " : " + tableContent[i][j + xOffset]);
				this.aCellSpan[i][j].innerHTML = " &nbsp;";	
				this.aCellSpan[i][j].innerHTML = "<input id=text("+i+","+j+") value="+  tableContent[i][j + xOffset] +" type='text' id=text("+i+","+(j+xOffset)+")  onKeyup=checkContent('"+i+"','"+j+"')>";
			}							//'<input type="text" id="text(' + i + "," + j + '" value="' + tableContent[i][j + xOffset] +"' onKeyup=checkContent('"+i+"','"+(j+xOffset)+"')>";
			// alert(this.aCellSpan[i][j].innerHTML);				<input type='text' id=text("+i+","+j+"(  onKeyup=checkContent('"+i+"','"+j+"')>";
        }
    }

	var nWidth = this.data.nCol * this.data.nCellWidth + (this.data.nCol-1) * 2;
	var nStartWidth = Math.floor(nWidth * xOffset / this.data.colHeaders.length);
	if ( nStartWidth == 0 ) nStartWidth++;
	var nBarWidth = Math.floor(nWidth * this.data.nCol / this.data.colHeaders.length);
	var nEndWidth = nWidth - nStartWidth - nBarWidth;
	if ( nEndWidth == 0 ) nEndWidth++, nStartWidth--;
 
	/*
	this.aHorizontalTD[0].width = nStartWidth;
	this.aHorizontalTD[1].width = nBarWidth;
	this.aHorizontalTD[2].width = nEndWidth;
	*/
}
 
Grid.prototype.scroll = function(x,y)
{	
	if(date[0] == "A") {
		alert("출발, 도착날짜를 먼저 선택해주세요! ");
		return false;
	}
	xOffset += x;
	
	if ( xOffset < 0 ) {
		xOffset = 0;
	}
	if ( xOffset > this.data.colHeaders.length - this.data.nCol ) {
		xOffset = this.data.colHeaders.length - this.data.nCol;
	}
	
	yOffset += y;
	if ( yOffset < 0 ) yOffset = 0;
	if ( yOffset > this.data.rowHeaders.length - this.data.nRow ) yOffset = this.data.rowHeaders.length - this.data.nRow;
	
	this.fill();
	
}
function deletePosition(address, title) {
	// markPoint("title", address);
	var splittmp2 = address.split(",");	
	var xtmp = xOffset + parseInt(splittmp2[1]);

	for(var i=0; i<markerArr.length; i++) {
	
		markerArr[i].setMap(null);
		
	}
	
	// 전체내용 지우고 다시찍어주기
	$("#theGrid h5").remove();
	// 배열도 공백으로
	tablePlace[splittmp2[0]][xtmp] = "";
	table[splittmp2[0]][xtmp] = "";
	// 그리고 다시 찍어줌
	window.theGrid.scroll(0,0);
	
	alert("길이 : "  +$(".storytitle").length);
	// 스토리 부분 지우기
	$(".storytitle").each(function(index) {
		if(("·"+title) == $(".storytitle").eq(index).text()) {
			$(".storytitle").eq(index).parent().remove();
		}
	});

	
	
	checkTimetable();
}


function titmetableInsert(title, address,target, targetid) {
	if(targetid.split("(")[1]) {

		var res = targetid.split("(");
		var res2 = res[1].split(",");
		
		var t1 = parseInt(res2[1]);
		var t2 = parseInt(xOffset);
		var tt = t1+t2;

		table[res2[0]][tt] = "";
		tablePlace[res2[0]][tt] = "";
	} 
	var res = target.id.split("(");
	var res2 = res[1].split(",");
	
	var t1 = parseInt(res2[1]);
	var t2 = parseInt(xOffset);
	var tt = t1+t2;
	
	table[res2[0]][tt] = address;
	tablePlace[res2[0]][tt] = title;
	
	checkTimetable();
}
function checkTimetable() {
	var k=0;

	for (var i = 0; i < 2; i++) {
		tablePosition[i] = new Array(100); // 매개변수는 배열의 크기
	}
	
	for(var i=0; i<date.length; i++) {
		for(var j=0; j<19; j++) {
			if(table[j][i]!=null && table[j][i]!="") {
				
				tablePosition[1][k] = tablePlace[j][i];
				tablePosition[0][k] = table[j][i];

				k++;
			}
		}
	}
	spot_num = k;

	// tablePositon[1][k] 여기에 위치순서대로 장소이름이 저장되있고
	// 나는 이걸로 순서를 바까주면되는데 제일처음에 와야되는걸 append를 먼저하면 아래아래아래 
	// 붙으면서 결국 처음이될거같은데 맞나
	
	for(var i=0; i<k; i++) {
		$(".storytitle").each(function(index) {
			if(("·"+tablePosition[1][i]) == $(".storytitle").eq(index).text()) {
				var fdiv = $(".storytitle").eq(index).parent().parent().html();
				var newdiv = document.createElement("div");
				newdiv.innerHTML = fdiv;
				$(".storytitle").eq(index).parent().parent().remove();
				$("#storysubject").append(newdiv);
			}
		});
	}

	refreshMap(tablePosition, k);	
}
function refreshMap(tablePosition, k) {
// 지도를 생성합니다  

	for(var j=0; j<k; j++) {
		markPoint(tablePosition[1][j], tablePosition[0][j]);
	}
	i = 0;		
}

function markPoint(title, address) {

	var geocoder = new daum.maps.services.Geocoder();
	var x;
	var y;
	var tmp = 1;
	geocoder.addr2coord(address, function(status, result) {
	   	// 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        var x = result.addr[0].lat;
	        var y = result.addr[0].lng;
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        marker.setMap(null);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        removeMarker();
	        arrayx[i] = x;
	        arrayy[i] = y;
	        linePoint(arrayx,arrayy,i,title);
	        
	        i++;	
	    } 
	}); 
	
	
	
}

function linePoint(arrayx,arrayy,index,title) {
	// 지도를 생성합니다    
	
	if(polyline!=null) {
		polyline.setMap(null);
		var linePath = new Array();	
		for(var i=0; i<=index; i++){	
			// 객체 생성
			linePath[i] = new daum.maps.LatLng(arrayx[i], arrayy[i]);		
		}
		
		// 지도에 표시할 선을 생성합니다
		polyline = new daum.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FF0000', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
	} else {
		
		var linePath = new Array();	
		for(var i=0; i<=index; i++){	
			// 객체 생성
			linePath[i] = new daum.maps.LatLng(arrayx[i], arrayy[i]);		
		}
		
		// 지도에 표시할 선을 생성합니다
		polyline = new daum.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FF0000', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
	}
	
	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
	markerPoint(new daum.maps.LatLng(arrayx[index], arrayy[index]), index, title);
}

function markerPoint(position, index, title) {

	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new daum.maps.Point(0, (index*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new daum.maps.Marker({
        position: position, // 마커의 위치
        image: markerImage 
    });
	markerArr[m] = marker;
	m++;
	marker.setMap(null);
	marker.setMap(map);

}
/*
function distancePosition() {
	var test = document.getElementById("planMapSchedule");
	var ultag = document.createElement("ul");
	var litag = document.createElement("li");
	ul.className = "marker-list";
	
	alert(tmptag);
	alert(test.innerHTML);
}
*/

function mapReset() {
	 $("#map").empty();
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.36493, 126.56972), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };   
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
}


function createScheduleDB() { 

	var start_date = document.getElementById("start_date").value;
	var end_date = document.getElementById("end_date").value;
	// var stay_date = document.getElementById("stay_date").value;
	var subject = informationForm.subject.value;
	var content = informationForm.content.value;
	var spot ="";
	var timetable_date = "";
	var timetable_time = "";
	var timetable_content = "";
	var timetable_title = "";
	var timetable_address = "";
	for(var i=0; i<spot_num; i++) {
		spot += tablePosition[1][i] + ",";	
	}
	
	for(var i=0; i<date.length; i++) {
		for(var j=0; j<19; j++) {
			if(table[j][i]!=null && table[j][i]!="") {
				timetable_date += j +",";
				timetable_time += i + ",";
				timetable_content += "null,";
				timetable_title += tablePlace[j][i] + ",";
				timetable_address += table[j][i] + ",";
			}
			if(tableContent[j][i]!=null && tableContent[j][i]!="") {
				timetable_date += j + ",";
				timetable_time += i + ",";
				timetable_content += tableContent[j][i] + ",";
				timetable_title += "null,";
				timetable_address += "null,";
			}
		}
	}
	var postSubject = document.getElementsByName("postSubject");
	var postContent = document.getElementsByName("postContent");
	
	$(".postContent").each(function(index){
		storyContent[index] = $(".postContent").eq(index).html();
		
	});
	var storyContent2 = "";
	for(var i=0; i<storyContent.length; i++) {
		storyContent2 += storyContent[i] +",";
	}
	var storySubject2 = "";
	var size = $(".postSubject").length;
	for(var i=0; i<size; i++) {
		storySubject[i] = $(".postSubject").eq(i).html();
		storySubject2 += storySubject[i] + ",";
	}
	
	$(".imgClass").each(function(index){
		imgSet[index] = $(".imgClass").eq(index).val();
	});
	var imgSet2 = "";
	for(var i=0; i<imgSet.length; i++) {
		imgSet2 += imgSet[i] + ",";
	}
	
	alert(imgSet2);
	
	
	var params = "start_date=" + start_date + "&end_date=" + end_date + "&subject=" + subject + "&content=" + content 
				+ "&spot_num=" + spot_num + "&spot=" + spot + "&timetable_date=" + timetable_date + "&timetable_time=" + timetable_time 
				+ "&timetable_content=" + timetable_content + "&timetable_title=" + timetable_title
				+ "&timetable_address=" + timetable_address + "&story_content=" + storyContent2
				+ "&story_subject=" + storySubject2 + "&imgSet=" + imgSet2;
	
	alert(params);

	// alert($("[name='postContent']").text());
	// alert(postContent.item(0).text());
	
	// var vvv = $(".postContent").children("#imgId_0").val();
	// var vvv = $("#imgId_0").val();
	// 
	/*
	var len = $(".postContent").children().length;
	alert("길이 : " + len);
	
	for(var i=0; i<len; i++) {
		if($(".postContent").children().eq(i).text()) {
			storyContent[0][i] = $(".postContent").children().eq(i).text();	
		}
		if($(".postContent").children().eq(i).val()) {
			storyContent[0][i] = $(".postContent").children().eq(i).val();
		}
	}
	*/
	
	var url = "createSchedulePro.do?" + params;
	open(url, "저장","scrollbar=no, status=no, width=350, height=150 top=400 left=850");
	
}

function storySave(fileUp) {
	alert(fileUp.name);
	uploadImg = fileUp;
	alert(uploadImg.name);
}


function onSchedule() {
	$(".map_wrap").show();
	$(".gapback").show();
	$("#story").hide();
}

function onStory() {
	$(".map_wrap").hide();
	$(".gapback").hide();
	$("#story").show();
}
//story에 클릭마다 텍스트상자 추가
function addStory(title,index,address){
	var subject = document.getElementById('storysubject');
	var tmp = document.createElement('div');
	var br = document.createElement('br');
	var tmp2 = '<div id ="'+index+'" class="post">'
	+'<h3 id=storytitle class=storytitle>·'+title+'</h3>'
	+' <img class="pnecil" src="/final/image/pencil.png" style="width:30px;height:30px;"><input type ="button" id="btn_'+index+'"value="포스트작성" onclick="addPost('+index+')"/></div>';
	//input name로 인덱스 이용
	br.innerHTML='<br>';
	tmp.innerHTML=tmp2;
	subject.appendChild(tmp);
	// subject.appendChild(br);
}
//new Popup
function addPost(index){

	var ischeck= document.getElementById('post'+index);
	alert("ischekc : " + ischeck);
	if(ischeck==null){
		//1넘어감
		open('createPost.do?index='+index+'&content=내용을 입력해주세요.'+'&subject=&imgCnt=','','width=750, height=600,left=400, top=0, toolbar=no, scrollbars=yes, resizeable=no');
	}
	else{
		var imgCnt = $('#post'+index+'>.postContent .imgClass').length;
		open('createPost.do?index='+index+'&content='+$('#post'+index+' .postContent').html() + '&subject='+$('#post'+index+">.postSubject").html()+'&imgCnt='+imgCnt,'','width=750, height=600,left=300, top=0, toolbar=no, scrollbars=yes, resizeable=no');
	}
	
}




