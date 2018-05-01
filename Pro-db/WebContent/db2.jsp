<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 데이터를 db안에 넣기</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");

		//회원가입할때 모든 정보를 가져오기
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

		//세션 스코프에 내 id 정보 넣어서 session에 등록
		request.getSession().setAttribute("id", id);

		//db 접속할 객체 만들기
		Connection conn = null;
		//회원가입해서 db에 추가할 쿼리문 
		String sql = "INSERT INTO jointest values ('" + id + "'," + "'" + pwd + "'," 
				+ "'" + mail + "'," + "'" + name + "'," + "'" + num1 + "'," + "'" + num2 + "'," 
				+ "'" + year + "'," + "'" + month + "'," + "'" + day + "'," + "'" + chk + "'," 
				+ "'" + intro + "')";

		try {
			System.out.println("-------------트라이------------------");
			//context.xml 불러오기
			Context init = new InitialContext();
			//connection pool에서 설정된 경로, java 경로에 들어있는 context.xml의 name인 jdbc/OracleDB의 경로를 가져옴
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			//내 db 경로를 가져와서 접속함
			conn = ds.getConnection();
			//db에 sql문 보내기
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//db 업데이트
			pstmt.executeUpdate();

			System.out.println("-------------연결완료------------------");
			out.println("<h3>연결되었습니다.</h3>");
		} catch (Exception e) {
			out.println("<h3>연결에 실패하였습니다.</h3>");
			e.printStackTrace();
		}finally{
			conn.close();
		}
		System.out.println("-------------리다이렉트------------------");
		//db에 데이터를 전부 넣으면 main 화면으로 이동
		response.sendRedirect("main.jsp");
	%>

</body>
</html>