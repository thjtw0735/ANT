/**
 * 
 */
// https://www.google.co.kr/maps/@37.6215412,127.0292881,18z
var x;
var y;
function createMap(address, title) {
	
	var staticMapContainer  = document.getElementById("map_"+address); // 이미지 지도를 표시할 div 
	var geocoder = new daum.maps.services.Geocoder();
	
	geocoder.addr2coord(address, function(status, result) {
		var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);	
		var marker = {
				position: coords,
				text: title
		}	
		staticMapOption = { 
		        center: new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng), // 이미지 지도의 중심좌표
		        level: 4, // 이미지 지도의 확대 레벨
		        marker: marker	        
		    };	
		x = result.addr[0].lat;
		y = result.addr[0].lng;
		var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
		createQR(result.addr[0].lat, result.addr[0].lng, title)
	});
	
}
function createQR(x,y, title) {
	var googleqr = "http://chart.apis.google.com/chart?cht=qr&chs=150x150&choe=UTF-8&chid=H10";
	var text = "http://maps.google.com/?q="+x+","+y;
				
	var qrchl = googleqr+"&chl=" + encodeURIComponent(text);
	var imgtag = document.createElement("img");
	imgtag.setAttribute("id", "qrcodeimg");
	imgtag.setAttribute("src", qrchl);
	// imgtag.setAttribute("style", "display:none;");
	var staticMapContainer  = document.getElementById("story_"+title);
	staticMapContainer.appendChild(imgtag);
}
// http://chart.apis.google.com/chart?cht=qr&chl=http://maps.google.com/?q=38,127&chld=H|2&chs=144
//  "http://chart.apis.google.com/chart?cht=qr&chs=150x150&choe=UTF-8&chid=H10&chl=https://www.google.co.kr/maps/@37.6215412,127.0292881,18z"

  