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
data.executeQuery("select month(date),count(idsalle) as 'Nbr de reservation par mois' from occupation where statut='reserve' group by month(date)");
}
catch (Exception e) { System.out.print(e.getMessage()); }

JFreeChart chart = ChartFactory.createPieChart("Nombre de reservation par mois", data, true, true, true);

ChartUtils.writeChartAsPNG(response.getOutputStream(), chart, 600, 400);
%>