<?xml version="1.0" encoding="UTF-8"?>
<%@page import="reply.Util"%>
<%@page import="reply.DBConnect"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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


			<c:if test="${list != null}">
				<result>
					<code>success</code>
					<data>[
						<c:forEach var="list" items="${list}" varStatus="status">
							<c:if test="${status.count >1}">
								,
							</c:if>
							{
								num : ${list.reply_num},
								id : '${list.reply_id}',
								content : '${Util.toJS(list.reply_content)}',
								pImage : '${list.pImage}',
								date : '${list.reply_date}',
								count : ${count}
							}
						</c:forEach>
					]</data>
				</result>
			</c:if>
			<c:if test="${list == null}">
				<result>
					<code>error</code>
					<message>List empty</message>
				</result>
			</c:if>
			
		