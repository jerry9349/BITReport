<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ �����͸� db�ȿ� �ֱ�</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");

		//ȸ�������Ҷ� ��� ������ ��������
		String id = (String) request.getParameter("my_id");
		String pwd = (String) request.getParameter("my_pwd");
		String mail = (String) request.getParameter("my_mail");
		String name = (String) request.getParameter("my_name");
		String num1 = (String) request.getParameter("my_num1");
		String num2 = (String) request.getParameter("my_num2");
		String year = (String) request.getParameter("my_year");
		String month = (String) request.getParameter("month");
		String day = (String) request.getParameter("day");
		String chk = (String) request.getParameter("chk");
		String intro = (String) request.getParameter("my_intro");

		//���� �������� �� id ���� �־ session�� ���
		request.getSession().setAttribute("id", id);

		//db ������ ��ü �����
		Connection conn = null;
		//ȸ�������ؼ� db�� �߰��� ������ 
		String sql = "INSERT INTO jointest values ('" + id + "'," + "'" + pwd + "'," 
				+ "'" + mail + "'," + "'" + name + "'," + "'" + num1 + "'," + "'" + num2 + "'," 
				+ "'" + year + "'," + "'" + month + "'," + "'" + day + "'," + "'" + chk + "'," 
				+ "'" + intro + "')";

		try {
			System.out.println("-------------Ʈ����------------------");
			//context.xml �ҷ�����
			Context init = new InitialContext();
			//connection pool���� ������ ���, java ��ο� ����ִ� context.xml�� name�� jdbc/OracleDB�� ��θ� ������
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			//�� db ��θ� �����ͼ� ������
			conn = ds.getConnection();
			//db�� sql�� ������
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//db ������Ʈ
			pstmt.executeUpdate();

			System.out.println("-------------����Ϸ�------------------");
			out.println("<h3>����Ǿ����ϴ�.</h3>");
		} catch (Exception e) {
			out.println("<h3>���ῡ �����Ͽ����ϴ�.</h3>");
			e.printStackTrace();
		}finally{
			conn.close();
		}
		System.out.println("-------------�����̷�Ʈ------------------");
		//db�� �����͸� ���� ������ main ȭ������ �̵�
		response.sendRedirect("main.jsp");
	%>

</body>
</html>