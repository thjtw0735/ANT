<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="list" value="${list}"/>
<c:if test="${list.id != null}">
		이미 사용중입니다. 새로운 아이디를 입력하세요
</c:if>
<c:if test="${list.id == null}">
		해당 아이디 사용 가능합니다.
</c:if>




















<%-- <%
	String id = request.getParameter("id");
%>
<%
 	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup( "java:comp/env" );
	DataSource ds = (DataSource) envCtx.lookup( "jdbc/kh" );
	Connection con = ds.getConnection();
%>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql =null;
	sql = "select * from member where id=?";
	pstmt = con.prepareStatement( sql );
	pstmt.setString( 1, id );
	rs = pstmt.executeQuery();
	
	if( rs.next()){
		%>이미 사용중입니다. 새로운 아이디를 입력하세요.<%
	} else {
		%>해당 아이디 사용 가능합니다. <%
	}
%>
<%
	if( rs != null ) rs.close();
	if( pstmt != null ) pstmt.close();
	if( con != null ) con.close();
%> --%>





