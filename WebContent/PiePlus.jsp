<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.data.jdbc.JDBCPieDataset"%>
<%@page contentType="image/jpeg;charset=MS950" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="org.jfree.chart.*" %>
<%@page import="org.jfree.data.*" %>

<%
// get the data
JDBCPieDataset data = null;
try {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emsi?serverTimezone=UTC", "root", "");

data = new JDBCPieDataset(con);
data.executeQuery("SELECT idsalle,count(*) as 'les salles les plus reservees' FROM `occupation` group by idsalle");
}
catch (Exception e) { System.out.print(e.getMessage()); }

JFreeChart chart = ChartFactory.createPieChart("Les salles les plus reservees", data, true, true, true);

ChartUtils.writeChartAsPNG(response.getOutputStream(), chart, 600, 400);
%>