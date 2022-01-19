package beans;

import java.sql.*;
import java.io.*;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.ui.ApplicationFrame;
import org.jfree.data.*;
import org.jfree.data.jdbc.JDBCCategoryDataset;

public class Chart {
	public static void main(String[] args) throws Exception {
		String query = "SELECT * from salle";
		JDBCCategoryDataset dataset = new JDBCCategoryDataset(
				"jdbc:mysql://localhost/emsi?serverTimezone=UTC", "com.mysql.cj.jdbc.Driver",
				"root", "");

		dataset.executeQuery(query);
		JFreeChart chart = ChartFactory.createLineChart("Test", "Id", "Score",
				dataset, PlotOrientation.VERTICAL, true, true, false);
		ChartPanel chartPanel = new ChartPanel(chart);
		chartPanel.setPreferredSize(new java.awt.Dimension(500, 270));
		ApplicationFrame f = new ApplicationFrame("Chart");
		f.setContentPane(chartPanel);
		f.pack();
		f.setVisible(true);
	}
}
