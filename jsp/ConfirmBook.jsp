<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.util.*" import="com.wipro.ata.bean.*" import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor=CadetBlue >
<div style="text-align:center; padding:5px;background-color: Teal;">
<h1 align="center">Welcome <%=session.getAttribute("loginid") %></h1>
<h1 align="center">Welcome to Suhana Safar Travel Agency </h1>
</div>
<%
VehicleBean vehiclebean = (VehicleBean)request.getAttribute("vehicledetails");
SearchBean searchbean = (SearchBean)request.getAttribute("searchdetails");
ArrayList<Object[]> routedetails = (ArrayList<Object[]>) request.getAttribute("routedetails");

float distance=0;
String routeid="";
for (Iterator iterator=routedetails.iterator(); iterator.hasNext();)
{
	Object[] routedetail=(Object[])iterator.next();
	distance=Float.parseFloat(routedetail[0].toString());
	routeid=(String)routedetail[1];
}
%>
<table align="center" border="2">
<tr><td>Source </td><td><%=searchbean.getSource() %></td></tr>
<tr><td>Destination </td><td><%=searchbean.getDestination() %></td></tr>
<tr><td>Vehicle Type </td><td><%= vehiclebean.getVehicleType() %></td></tr>
<tr><td>Vehicle Name </td><td><%=vehiclebean.getVehicleName() %></td></tr>
<tr><td>Vehicle Number </td><td><%=vehiclebean.getVehicleNumber() %></td></tr>
<tr><td>Total Fare </td><td><%=distance*vehiclebean.getFarePerKM() %></td></tr>
<tr><td>Journey Date </td><td><%=searchbean.getJourneyDate() %></td></tr>
</table><br><br>
<div align="center">
<a href="FinalBook?vehicleNumber=<%=vehiclebean.getVehicleNumber() %>&&journeyDate=<%=searchbean.getJourneyDate() %>&&routeid=<%=routeid %>&&fare=<%=distance*vehiclebean.getFarePerKM() %>">Confirm Booking</a>
</div>
</body>
</html>