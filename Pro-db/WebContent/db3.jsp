<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ������ db �����Ϳ� ���ϱ�</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");

		String id = (String) request.getParameter("my_id");
		String pwd = (String) request.getParameter("my_pwd");

		//���� �������� �� id ���� �־ session�� ���
		request.getSession().setAttribute("id", id);

		//db�� ������ ��ü �����
		Connection conn = null;
		//�α����� �����Ͱ� db�ȿ� �ִ� ���������� ��ȸ�� ������
		String sql = "SELECT * FROM jointest WHERE id='" + id + "'";

		try {
			System.out.println("-------------Ʈ����------------------");
			//context.xml �ҷ�����
			Context init = new InitialContext();
			//connection pool���� ������ ���, java ��ο� ����ִ� context.xml�� name�� jdbc/OracleDB�� ��θ� ������
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			//�� db ��θ� �����ͼ� ������
			conn = ds.getConnection();
			//�������� db�� ����
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//db ������Ʈ
			pstmt.executeUpdate();
			//�� �޾ƿü� �ִ� ��ü �����
			ResultSet rs = pstmt.executeQuery();

			//���� db�ȿ� ���� ��� ������
			if (rs.next()) {
				//�α������� �Է��� id�� ��й�ȣ�� db�ȿ� �ִ� id�� ��й�ȣ�� ��ġ�Ҷ� ���� �������� �̵�
				if (id.equals(rs.getString("id")) == true & pwd.equals(rs.getString("pwd")) == true) {
					rs.close();
					response.sendRedirect("main.jsp");
				}else if(id.equals(rs.getString("id")) == true & pwd.equals(rs.getString("pwd")) == false){
					rs.close();
					%>
					<script>
						alert("���̵� ��й�ȣ�� �߸��Ǿ����ϴ�.");
						history.back();
					</script><%
				}
			} else {//���� db�ȿ� ���� ������
				rs.close();
	%>
	<script>
		alert("���̵� ��й�ȣ�� �߸��Ǿ����ϴ�.");
		history.back();
	</script>
	<%
		}

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