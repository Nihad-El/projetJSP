<%@page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.data.jdbc.JDBCPieDataset"%>
<%@page contentType="image/jpeg;charset=MS950" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="org.jfree.chart.*" %>
<%@page import="org.jfree.data.*" %>

<%
JDBCCategoryDataset dataset=null;
try {

String query = "select month(date),count(idsalle) as 'Nbr de reservation par mois' from occupation where statut='reserve' group by month(date)";

dataset = new JDBCCategoryDataset("jdbc:mysql://localhost/emsi?serverTimezone=UTC", "com.mysql.cj.jdbc.Driver", "root", "");

dataset.executeQuery(query);
}
catch (Exception e) { System.out.print(e.getMessage()); }

JFreeChart chart = ChartFactory.createLineChart("Nombre de reservation par mois", "Mois", "Nombre de reservations", dataset, PlotOrientation.VERTICAL, true, true, false);


ChartUtils.writeChartAsPNG(response.getOutputStream(), chart, 600, 400);
%>