<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<h1>학생 수정 결과</h1>
	번호 나이 이름 학번
	<br>
	<%
		String irum = request.getParameter("irum");
		String age = request.getParameter("age");
		String hakbun = request.getParameter("hakbun");
		String irumUpdate = request.getParameter("irumUpdate");

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb","underdogb", "khacademy1!");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/underdogb", "underdogb","khacademy1!");
		String sql = "update studentNJ set age=?, irum=?, hakbun=? where irum=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, age);
		pstmt.setString(2, irum);
		pstmt.setString(3, hakbun);
		pstmt.setString(4, irumUpdate);
		int cnt = pstmt.executeUpdate();
		
		/*Statement stmt = conn.createStatement();*/
		/*String sql = "update studentNJ set age='" + age + "', irum='" + irum + "', hakbun='" + hakbun+ "' where irum='" + irumUpdate + "'";*/
		/*int cnt = stmt.executeUpdate(sql);*/
	%>
	<%=cnt%>건 학생이 수정되었습니다.<br>
	<a href="../index.jsp">학사관리</a>&nbsp;
	<a href="studentList.jsp">학생전체출력</a>
	<%
		pstmt.close();
		conn.close();
	%>

</body>
</html>