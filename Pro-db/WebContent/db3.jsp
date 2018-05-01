<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 정보를 db 데이터와 비교하기</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");

		String id = (String) request.getParameter("my_id");
		String pwd = (String) request.getParameter("my_pwd");

		//세션 스코프에 내 id 정보 넣어서 session에 등록
		request.getSession().setAttribute("id", id);

		//db에 접속할 객체 만들기
		Connection conn = null;
		//로그인한 데이터가 db안에 있는 데이터인지 조회할 쿼리문
		String sql = "SELECT * FROM jointest WHERE id='" + id + "'";

		try {
			System.out.println("-------------트라이------------------");
			//context.xml 불러오기
			Context init = new InitialContext();
			//connection pool에서 설정된 경로, java 경로에 들어있는 context.xml의 name인 jdbc/OracleDB의 경로를 가져옴
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			//내 db 경로를 가져와서 접속함
			conn = ds.getConnection();
			//쿼리문을 db에 보냄
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//db 업데이트
			pstmt.executeUpdate();
			//값 받아올수 있는 객체 만들기
			ResultSet rs = pstmt.executeQuery();

			//만약 db안에 값이 들어 있을때
			if (rs.next()) {
				//로그인폼에 입력한 id와 비밀번호가 db안에 있는 id와 비밀번호와 일치할때 메인 페이지로 이동
				if (id.equals(rs.getString("id")) == true & pwd.equals(rs.getString("pwd")) == true) {
					rs.close();
					response.sendRedirect("main.jsp");
				}else if(id.equals(rs.getString("id")) == true & pwd.equals(rs.getString("pwd")) == false){
					rs.close();
					%>
					<script>
						alert("아이디나 비밀번호가 잘못되었습니다.");
						history.back();
					</script><%
				}
			} else {//만약 db안에 값이 없을때
				rs.close();
	%>
	<script>
		alert("아이디나 비밀번호가 잘못되었습니다.");
		history.back();
	</script>
	<%
		}

			System.out.println("-------------연결완료------------------");
			out.println("<h3>연결되었습니다.</h3>");
		} catch (Exception e) {
			out.println("<h3>연결에 실패하였습니다.</h3>");
			e.printStackTrace();
		}finally{
			conn.close();
		}
		System.out.println("-------------리다이렉트--------------------");
	%>

</body>
</html>