<title>Customer Ticket Booking</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*"%> 
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%
                                   
                                   //First Class=250
                                   //Second Class=180
                                   //Balcony Class=300
                                  //update the Custome Transcation Table to
                                 String custname=(String)application.getAttribute("custname");
                                 String movie =request.getParameter("userid");
                                 String noft = request.getParameter("pass1");
                                 String class1 =request.getParameter("Class");
                                 String mode=request.getParameter("mode");
                                 
                                 //String mode1="hand";
                                 String selectmovie="1";
                                 int no1=0;
                                 
                                 String mobile="";
                                 String pin="";
	try {
                Statement stmt = connection.createStatement();
                String var ="SELECT * FROM movieschedule where moviename= '"+movie+"' ";
		ResultSet rs=stmt.executeQuery(var);
		if (rs.next()==true)
		{ 
                 int id=0; 
                 if(rs.last()){ 
                 id =rs.getInt(1); 
                  Statement stmt1 = connection.createStatement();
                 String sql2="SELECT * FROM custtranscation where custname='"+custname +"'";
                ResultSet rs1=stmt1.executeQuery(sql2);
                if(rs1.next()==true){
                no1=rs1.getInt(3)+1;//number of movies
                }
                /*String sql3="SELECT * FROM customerlogin where custname='"+custname +"'";
                ResultSet rs2=stmt1.executeQuery(sql2);
                if(rs2.next()==true){
                mobile=rs2.getString(4);
                pin=rs2.getString(7);
                 //int userId = Integer.parseInt(request.getParameter("userid"));
                }*/
               
                //mtop=money to pay
                //noft =number of Ticket
                //money to pay=number of Ticket*ticket Price(different for different class)
                
                int class2=Integer.parseInt(class1);
                int noft2=Integer.parseInt(noft);
                int mtop=class2*noft2;
                Statement stmt2=connection.createStatement();
                String sql1="insert into custtranscation(id,custname,noofmovie,selectmovie,moneytopay,paymentmode,semoviename) values('"+id+"','"+custname+"','"+no1+"','"+selectmovie+"','"+mtop+"','"+mode+"','"+movie+"')";
                stmt2.executeUpdate(sql1);
                 
                 } 
                
                %>
         
                 <pre>Ticket is successfully Booked!!</pre>
                <p><a href="CustomerMain.jsp">Back</a><br /> 
<%
                 connection.close();
		}
		 else 
		{

			response.sendRedirect("Nosuchmovie.jsp");
		}

	} 
	catch (Exception e)
	{
		out.print(e);
		e.printStackTrace();
	}
%>

