<?xml version="1.0" encoding="UTF-8"?>
<%@page import="reply.DBConnect"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    


<%
	request.setCharacterEncoding("utf-8");
%>
	<c:if test="${result == 0}">
		<result>
			<code>error</code>
			<message>Delete Error</message>
		</result>
	</c:if>
	<c:if test="${result != 0}">
		<result>
			<code>success</code>
			<data>
				{
						num : ${reply_num},
						count : ${count},
					}
			</data>
		</result>
	</c:if>
