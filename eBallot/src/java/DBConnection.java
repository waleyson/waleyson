/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author AbdHafeez
 */
import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection {

    static Connection con;

    public static Connection getConnection() {
        con = null;
        try {
            
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("jdbc/eBallot");
            Connection conn = ds.getConnection();

            System.out.println("----------I am in DBConnection----------");
            Class.forName("com.mysql.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://mysql80855-eBalot.j.layershift.co.uk:3306/eBallot?user=eballot&password=hafla_123");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot?user=root&password=hafla_123");
            System.out.println("---------end of DBConnection----------");
        } catch (Exception e) {
            e.getMessage();
        }
        return con;
    }
}
