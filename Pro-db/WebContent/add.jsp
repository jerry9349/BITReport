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
String sql= "INSERT INTO student (num,name) VALUES (6,'ȫ�浿')";

try{
	Context init = new InitialContext();
	//connection pool���� ������ ���, java ��ο� ����ִ� context.xml�� name�� jdbc/OracleDB�� ��θ� ������
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	//�� db ��θ� �����ͼ� ������
	conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	
	int result=stmt.executeUpdate(sql);
	if(result!=0){
		out.println("<h3>���ڵ尡 ��ϵǾ����ϴ�.</h3>");	
	}
}catch(Exception e){
	out.println("<h3>���ڵ� ��Ͽ� �����Ͽ����ϴ�.</h3>");
	e.printStackTrace();
}

%>
</body>
</html>

