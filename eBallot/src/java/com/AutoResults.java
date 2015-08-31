/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.BasicStroke;
import java.awt.Color;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import java.io.OutputStream;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.jdbc.JDBCCategoryDataset;

public class AutoResults extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AutoResults() {
// TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            try {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot?user=root&password=hafla_123");
                //connection = DriverManager.getConnection("jdbc:mysql://mysql80855-eBalot.j.layershift.co.uk:3306/eBallot?user=eballot&password=hafla_123");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //JDBCPieDataset dataset = new JDBCPieDataset(connection);
        JDBCCategoryDataset dataset = new JDBCCategoryDataset(connection);
        try {
            dataset.executeQuery("Select candidate, votecount  From votepres order by votecount desc");
            JFreeChart chart = ChartFactory.createBarChart("eBallot -  Presidential Result", null, null, dataset, PlotOrientation.HORIZONTAL, true, true, false);
            //createBarChart3D(, null, null, dataset)createChart("eBallot - Revenue Chart", dataset, true, true, false);
            //JFreeChart chart = ChartFactory.createChart("eBallot - Revenue Chart", dataset, true, true, false);
            chart.setBorderPaint(Color.WHITE);
            chart.setBorderStroke(new BasicStroke(10.0f));
            chart.setBorderVisible(true);
            if (chart != null) {
                int width = 500;
                int height = 350;
                final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
                response.setContentType("image/png");
                OutputStream out = response.getOutputStream();
                ChartUtilities.writeChartAsPNG(out, chart, width, height, info);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
    }
}
