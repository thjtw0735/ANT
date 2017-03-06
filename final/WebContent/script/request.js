/**
 * XMLHttpRequest Module
 */

function Request( callback, url, method, params ){
	this.httpRequest = null;
	this.callback = callback;
	this.url = url;
	this.method = method;
	this.params = params;
}

Request.prototype = {
	getXMLHttpRequest : function() {
		if (window.ActiveXObject){
			try{
				this.httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e){
				this.httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
		} else {
			this.httpRequest = new XMLHttpRequest();
		}
	},
	sendRequest : function() {
		this.getXMLHttpRequest();
		
		// callback 
		this.httpRequest.onreadystatechange = this.callback;
		
		// method
		var httpMethod = this.method ? this.method: "GET";
		if (httpMethod != "POST" && httpMethod != "GET"){
			httpMethod = "GET";
		}
			
		// params
		var httpParams = (this.params == null || this.params == "" ) ?
								null : this.params;
		
		// url
		var httpUrl = (httpMethod == "GET" ) ? this.url + "?" + httpParams : this.url;
		
		this.httpRequest.open( httpMethod, httpUrl, true );
		this.httpRequest.setRequestHeader(
	   			"content-type", "application/x-www-form-urlencoded");
		this.httpRequest.send( httpMethod == "POST" ? httpParams : null );
	}
};



















