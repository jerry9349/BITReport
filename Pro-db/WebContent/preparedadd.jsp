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
String[] name = {"������","����","������","������"};
Connection conn = null;
String sql= "INSERT INTO student (num,name) VALUES (?,?)";

try{
	Context init = new InitialContext();
	//connection pool���� ������ ���, java ��ο� ����ִ� context.xml�� name�� jdbc/OracleDB�� ��θ� ������
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	//�� db ��θ� �����ͼ� ������
	conn = ds.getConnection();
	PreparedStatement stmt = conn.prepareStatement(sql);

	for(int i=7;i<=10;i++){
		stmt.setInt(1,i);
		stmt.setString(2,name[i-7]);
	if(stmt.executeUpdate()!=0){
		out.println("<h3>���ڵ尡 ��ϵǾ����ϴ�.</h3>");	
		}
	}
}catch(Exception e){
	out.println("<h3>���ڵ� ��Ͽ� �����Ͽ����ϴ�.</h3>");
	e.printStackTrace();
}

%>
</body>
</html>

