<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	String stay_date = request.getParameter("stay_date");
%>
<%=stay_date%>/<%=start_date%>/<%=end_date%>