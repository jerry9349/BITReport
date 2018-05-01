<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
String sql = "SELECT * FROM student";

try{
	Context init = new InitialContext();
	//connection pool에서 설정된 경로, java 경로에 들어있는 context.xml의 name인 jdbc/OracleDB의 경로를 가져옴
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	//내 db 경로를 가져와서 접속함
	conn = ds.getConnection();
	//대량 데이터를 교환하기 위해 필요,
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//결과 받아오는 역할 
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
		out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
	}
	rs.close();
}catch(Exception e){
	out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
	e.printStackTrace();
}

%>
</body>
</html>

