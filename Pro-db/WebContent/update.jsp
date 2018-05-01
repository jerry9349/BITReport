<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src = "js/join.js"></script>

<%
	request.setCharacterEncoding("UTF-8");

	String id= (String)request.getParameter("id");
	Connection conn = null;

try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		String sql = "SELECT * FROM jointest WHERE id='"+id+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		%>
		<%
		while(rs.next()){
			%>
			
		<FORM name="f" method="post" action="change.jsp" onsubmit="return validate()">
<table width="50%" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#9999FF">
    <tr align="center">
        <td colspan="2" align="center" bgcolor="skyblue">
            <div style="font-weight: bold; font-size: 18px">회원 기본 정보
            </div></td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center">
            <div style="font-weight: bold;">아이디:
            </div></td>
        <td>&nbsp<input type="text" name="my_id" id="my_id" value="<%= rs.getString("id") %>" size="12" maxlength="12" disabled>
            &nbsp4~12자의 영문 대소문자와 숫자로만 입력</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호:</div></td>
        <td>&nbsp<input type="password" id="my_pwd" name="my_pwd" size="12" maxlength="12" >
            &nbsp4~12자의 영문 대소문자와 숫자로만 입력</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호 확인:</div></td>
        <td>&nbsp<input type="password" id="my_pwd2" name="my_pwd2" size="12" maxlength="12"></td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">메일주소:</div></td>
        <td>&nbsp<input type="text" name="my_mail" id="my_mail" value="<%= rs.getString("mail") %>" size="30" maxlength="30">
            &nbsp예)id@domain.com</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
        <td>&nbsp<input type="text" name="my_name" id="my_name" value="<%= rs.getString("name") %>" size="10" maxlength="10" disabled></td>
    </tr>
    
    
    <tr align="center">
        <td colspan="2" bgcolor="skyblue">
            <div style="font-weight: bold; font-size: 18px">개인 신상 정보
            </div></td>
        
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
        <td>&nbsp<input type="text" id="my_num1" name="my_num1" size="6" maxlength="6" value="<%= rs.getString("num1") %>" disabled>
            &nbsp&nbsp 
            <input type="password" id="my_num2" name="my_num2" size="7" maxlength="7"  value="<%= rs.getString("num2") %>" disabled>
            &nbsp예)123456-1234567</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">생일:</div></td>
        <td>&nbsp<input type="text" id="my_year" name="my_year" size="4" maxlength="4" value="<%= rs.getString("year") %>" disabled>년
            &nbsp
            <select name="month" id="month" disabled="disabled">
            <option value="1" selected="selected">1</option>
            <option value="2">2</option>
                <option value="3" >3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            </select>
            월&nbsp<select name="day" id="day" disabled="disabled">
            <option value="1" selected="selected">1</option>
            <option value="2">2</option>
                <option value="3" >3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
                <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
                <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
            </select>일</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">관심분야:</div></td>
        <td>
        <input type="checkbox" name="chk" id="chk" value="COMPUTER" onclick="check_only(this)">컴퓨터
        <input type="checkbox" name="chk" id="chk" value="INTERNET" onclick="check_only(this)">인터넷
        <input type="checkbox" name="chk" id="chk" value="TRABLE" onclick="check_only(this)">여행
        <input type="checkbox" name="chk" id="chk" value="MOVIE" onclick="check_only(this)">영화감상
        <input type="checkbox" name="chk" id="chk" value="MUSIC" onclick="check_only(this)">음악감상</FORM>
        </td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">자기소개:</div></td>
        <td><textarea name="my_intro" cols="70" rows="5" value="<%= rs.getString("intro") %>"></textarea></td>
    </tr>
    
</table>
    <p align="center">
    <input type="submit" name="submit" id="submit" value="수정완료" >
    <input type="reset" value="다시 입력">
    </FORM>
	
	<%	
	}
		rs.close();
	}catch(Exception e){
			e.printStackTrace();
	}finally{
			conn.close();
	}
%>

</body>
</html>