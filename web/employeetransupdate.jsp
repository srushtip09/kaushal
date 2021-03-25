<title>Employee Authentication Page</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*"%> 
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%
        String empname=(String)application.getAttribute("empname");
	String moviename = request.getParameter("userid");
	String movielength = request.getParameter("pass");
        String time=request.getParameter("s1");
        String screeno = request.getParameter("s2");
        String Theatrename=request.getParameter("s3");
        String city = request.getParameter("s4");
        String genre=request.getParameter("s5");
        
	try {
            String sql = "SELECT * FROM movieschedule";
              
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql); 
                int id=0; 
                if(rs.last()){ 
                id =rs.getInt(1)+1; 
                } 
                
                
                String sql1 = "insert into movieschedule(id,moviename,length,schedule,screeno,theatre,city,genre) values('"+id+"','"+moviename+"','"+movielength+"','"+time+"','"+screeno+"','"+Theatrename+"','"+city+"','"+genre+"')";
				//st.executeUpdate(strQuery2);
		stmt.executeUpdate(sql1);
                //my code
                String sql2 = "SELECT * FROM employeetranscation";
              
		Statement stmt1 = connection.createStatement();
		ResultSet rs1 = stmt.executeQuery(sql); 
                int eid=0;
                
                if(rs1.last()){ 
                eid =rs1.getInt(1); 
                Statement stmt2 = connection.createStatement();
                 String sqln="SELECT * FROM employee where empname='"+empname +"'";
                ResultSet rs2=stmt2.executeQuery(sqln);
                if(rs2.next()==true){
                eid=rs2.getInt(1)+1;//number of movies
                

                }
                 
                
                
                String sql3 = "insert into employeetranscation(id,moviename,screennumber) values('"+eid+"','"+moviename+"','"+screeno+"')";
				//st.executeUpdate(strQuery2);
		stmt1.executeUpdate(sql3);
                }
                %>
                
         
                 <pre>Data Updated Successfully !!!</pre>
                <p><a href="employeemain.jsp">Back</a><br />
<%
	} 
	catch (Exception e)
	{
		out.print(e);
		e.printStackTrace();
	}
%>

