<?xml version="1.0" encoding="UTF-8"?>
<%@page import="reply.Util"%>
<%@page import="reply.DBConnect"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
System.out.println(request.getParameter("content"));
%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = URLDecoder.decode(request.getParameter("name"),"utf-8");
	String content = URLDecoder.decode(request.getParameter("content"),"utf-8");
%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	try{
		
		con = DBConnect.getConnection();
		String sql= "update reply set name=?, content=? where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, content);
		pstmt.setInt(3, num);
		int result = pstmt.executeUpdate();
		
		if(result == 0){
			%>
			<result>
				<code>error</code>
				<message>Modify Error</message>
			</result>
			<%
		} else {
			%>
			<result>
				<code>success</code>
				<data>{
					num : <%=num%>,
					name : '<%=name%>',
					content : '<%=Util.toJS( content )%>'				
				}</data>
			</result>
			<%
		}
	}catch ( SQLException e ){
		%>
		<result>
			<code>error</code>
			<message><%=e.getMessage()%></message>
		</result>
		<%
	} finally {
		try{
			if( pstmt != null ) pstmt.close();
			if( con != null ) con.close();
		} catch( SQLException e ){
			%>
			<result>
				<code>error</code>
				<message><%=e.getMessage()%></message>
			</result>
			<%
		}
	}
%>