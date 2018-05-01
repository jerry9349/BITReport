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
String[] name = {"지혜리","김기범","이은빈","추정범"};
Connection conn = null;
String sql= "INSERT INTO student (num,name) VALUES (?,?)";

try{
	Context init = new InitialContext();
	//connection pool에서 설정된 경로, java 경로에 들어있는 context.xml의 name인 jdbc/OracleDB의 경로를 가져옴
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	//내 db 경로를 가져와서 접속함
	conn = ds.getConnection();
	PreparedStatement stmt = conn.prepareStatement(sql);

	for(int i=7;i<=10;i++){
		stmt.setInt(1,i);
		stmt.setString(2,name[i-7]);
	if(stmt.executeUpdate()!=0){
		out.println("<h3>레코드가 등록되었습니다.</h3>");	
		}
	}
}catch(Exception e){
	out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
	e.printStackTrace();
}

%>
</body>
</html>

