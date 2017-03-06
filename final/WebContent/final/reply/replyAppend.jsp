<?xml version="1.0" encoding="UTF-8"?>
<%@page import="reply.Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="reply.DBConnect"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
    
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	//String name = URLDecoder.decode(request.getParameter("name"),"utf-8" );
	//String content = (String) request.getAttribute("content");
	// int number = (Integer) request.getAttribute("number");
%>
		
		<c:if test="${result == 0 }">
			<result>
				<code>error</code>
				<message>Insert Error</message>
			</result>
		</c:if>
		<c:if test="${result == 1 }">
			<result>
				<code>success</code>
				<data>
					{
						num : ${maxnum},
						count : ${count},
						id : '${id}',
						content : '${Util.toJS(content)}',
						pImage : '${pImage}',
						date : '${date}'
					}
				</data>
			</result>
		</c:if>