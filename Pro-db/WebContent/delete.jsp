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
		request.setCharacterEncoding("UTF-8");

		String id = (String) request.getParameter("id");

		Connection conn = null;
		//���� ���� ������ id�� db�ȿ� �ִ� id�� ������ ������ ������
		String sql = "DELETE FROM jointest WHERE id='" + id + "'";

		try {
			System.out.println("-------------Ʈ����------------------");
			//context.xml �ҷ�����
			Context init = new InitialContext();
			//connection pool���� ������ ���, java ��ο� ����ִ� context.xml�� name�� jdbc/OracleDB�� ��θ� ������
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			//�� db ��θ� �����ͼ� ������
			conn = ds.getConnection();
			//����
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();

			//������ �ٽ� ���ȭ������ ���ư�
			response.sendRedirect("output.jsp");

			System.out.println("-------------����Ϸ�------------------");
			out.println("<h3>����Ǿ����ϴ�.</h3>");
		} catch (Exception e) {
			out.println("<h3>���ῡ �����Ͽ����ϴ�.</h3>");
			e.printStackTrace();
		}finally{
			conn.close();
		}
		System.out.println("-------------�����̷�Ʈ--------------------");
	%>

</body>
</html>