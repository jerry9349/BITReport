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
	//connection pool���� ������ ���, java ��ο� ����ִ� context.xml�� name�� jdbc/OracleDB�� ��θ� ������
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	//�� db ��θ� �����ͼ� ������
	conn = ds.getConnection();
	//�뷮 �����͸� ��ȯ�ϱ� ���� �ʿ�,
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//��� �޾ƿ��� ���� 
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
		out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
	}
	rs.close();
}catch(Exception e){
	out.println("<h3>���ڵ� ��Ͽ� �����Ͽ����ϴ�.</h3>");
	e.printStackTrace();
}

%>
</body>
</html>

