<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메인화면</title>
</head>
<body>
<br>

<%
request.setCharacterEncoding("UTF-8");

Connection conn = null;
String admin = "admin";
String id = (String)session.getAttribute("id");
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();

try{
	//관리자 모드 일때 모든 데이터들을 가져올 수 있다.
	if(id.equals(admin)){
		String sql = "SELECT * FROM jointest";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		%>
		
		<h1>관리자로 로그인 하셨습니다.</h1><br><br>
		<a href="output.jsp">관리자 정보 보러가기</a>
		
		<%
		rs.close();
	}else{
		//사용자 모드 일때 오직 사용자 개인의 정보만 가져올 수 있다.
		String sql = "SELECT * FROM jointest WHERE id='"+id+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		%>
		
		<h1><%= session.getAttribute("id") %> 로그인 하셨습니다.</h1><br><br>
		<a href="output.jsp">내 정보 보러가기</a>
		<%
		rs.close();
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	conn.close();
}

%>

</body>
</html>