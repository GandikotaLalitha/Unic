<%@page import="shop.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	try{
	String Id = request.getParameter("msg");
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	int deletedRows = st.executeUpdate("delete from message where id='"+Id+"'");
	if(deletedRows>0)
		response.sendRedirect("messagesReceived.jsp?msg=success");
	else
		response.sendRedirect("messagesReceived.jsp?msg=error");
	}
	catch(Exception e){
		response.sendRedirect("messagesReceived.jsp?msg=error");
	}
%>