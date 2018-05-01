<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>데이터 출력하기</title>
</head>
<body>
<br>

<%
request.setCharacterEncoding("UTF-8");

//db에 접속할 객체만들기
Connection conn = null;
String admin = "admin";
//session에서 내 id 받아오기
String id = (String)session.getAttribute("id");
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();

try{
	//관리자 모드 일때 모든것을 출력한다.
	if(id.equals(admin)){
		String sql = "SELECT * FROM jointest";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		%>
		
		<%
		//모든 데이터들을 비교하고 확인한다
		while(rs.next()){
			%>
			
		<table width="50%" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#9999FF">
	    <tr align="center">
	        <td colspan="2" align="center" bgcolor="skyblue">
	            <div style="font-weight: bold; font-size: 18px">회원 정보 조회
	            </div></td>
	   
	        <td bgcolor="pink" align="center">
	            <div style="font-weight: bold;">아이디:
	            </div></td>
	        <td>&nbsp <%= rs.getString("id") %> </td>
	    
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호:</div></td>
	        <td>&nbsp <%= rs.getString("pwd") %> </td>
	   
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">메일주소:</div></td>
	        <td>&nbsp <%= rs.getString("mail") %></td>
	   
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
	        <td>&nbsp <%= rs.getString("name") %></td>
	  
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
	        <td>&nbsp <%= rs.getString("num1") %>-<%= rs.getString("num2") %></td>
	   
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">생일:</div></td>
	        <td>&nbsp<%= rs.getString("year") %>년 
	            &nbsp<%= rs.getString("month")%>월
	            &nbsp<%= rs.getString("day") %>일</td>
	    
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">관심분야:</div></td>
	        <td>
	        <%= rs.getString("chk") %>
	        </td>
	   
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">자기소개:</div></td>
	        <td><%= rs.getString("intro") %></td>
	        <td>
	        <!-- 한행의 id만 받아오기 위해서 get방식을 쓴다 -->
	        <!-- post방식을 쓰면 전부의 id가 넘어가 버린다. -->
	        <a href="delete.jsp?id=<%= rs.getString("id") %>">삭제</a><br><br>
	        </td>
	    </tr>
	    </table>
		
	<%	
	}%><a href="login.jsp">로그아웃</a><%
		
	rs.close();
	}else{//사용자 모드일때 
		//사용자의 id가 db 안에 있는 id 와 같으면 조회할 수 있다.
		String sql = "SELECT * FROM jointest WHERE id='"+id+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		//조건안에 있는 데이터가 있을때 while안에 들어감
		while(rs.next()){
			%>
			
		<table width="50%" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#9999FF">
	    <tr align="center">
	        <td colspan="2" align="center" bgcolor="skyblue">
	            <div style="font-weight: bold; font-size: 18px">회원 정보 조회
	            </div></td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center">
	            <div style="font-weight: bold;">아이디:
	            </div></td>
	        <td>&nbsp <%= rs.getString("id") %> </td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호:</div></td>
	        <td>&nbsp <%= rs.getString("pwd") %> </td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">메일주소:</div></td>
	        <td>&nbsp <%= rs.getString("mail") %></td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
	        <td>&nbsp <%= rs.getString("name") %></td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
	        <td>&nbsp<%= rs.getString("num1") %>-<%= rs.getString("num2") %></td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">생일:</div></td>
	        <td>&nbsp<%= rs.getString("year") %>년
	            &nbsp<%= rs.getString("month") %>월
	            &nbsp<%= rs.getString("day") %>일</td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">관심분야:</div></td>
	        <td>
	        <%= rs.getString("chk") %>
	        </td>
	    </tr>
	    <tr>
	        <td bgcolor="pink" align="center"><div style="font-weight: bold;">자기소개:</div></td>
	        <td><%= rs.getString("intro") %></td>
	    </tr>
	    <tr>
	        <td colspan="2">
	         <a href="update.jsp?id=<%= rs.getString("id") %>&pwd=<%= rs.getString("pwd") %>&mail=<%= rs.getString("mail") %>
	         &name=<%= rs.getString("name") %>&num1=<%= rs.getString("num1") %>&num2=<%= rs.getString("num2") %>
	         &year=<%= rs.getString("year") %>&month=<%= rs.getString("month") %>&day=<%= rs.getString("day") %>
	         &chk=<%= rs.getString("chk") %>&intro=<%= rs.getString("intro") %>">수정  </a>
	        </td>
	    </tr>
		</table>
		<a href="login.jsp">로그아웃</a>
		<%
		}
			rs.close();
		}
	}catch(Exception e){
			e.printStackTrace();
	}finally{
			conn.close();
	}

%>

</body>
</html>