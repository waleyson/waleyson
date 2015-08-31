/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author AbdHafeez
 */
@MultipartConfig          // indicates that request MIME type is “multipart/form-data”
@WebServlet("/upload")
public class FileUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String responseMessage = "File Upload Successfull!!";

        // Get file part using HttpServletRequest’s getPart() method
        Part filePart = request.getPart("file");
        // Extract file name from content-disposition header of file part
        String fileName = getFileName(filePart);
        String basePath = "D:" + File.separator + "upload" + File.separator;
        //String basePath = "upload"+File.separator;
        System.out.println("***** fileName: " + fileName);
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            File outputFilePath = new File(basePath + fileName);
            System.out.println("***** outputFilePath: " + outputFilePath.getAbsolutePath());
            inputStream = filePart.getInputStream();
            outputStream = new FileOutputStream(outputFilePath);

            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
            responseMessage = "File Upload Failed!!";
        } finally {
            if (outputStream != null) {
                outputStream.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
        String actualfile = basePath + fileName;
        Connection con = DBConnection.getConnection();
        System.out.println("connection=----------->" + con);
        PreparedStatement pstmtdtl = null;

        int rowshdr = 0;
        BufferedReader brdtl = new BufferedReader(new FileReader(actualfile));
        System.out.println("reading the file");
        String strLineDtl = "";
        String dtlstr = "";
        StringTokenizer stdtl = null;
        String firstColumnData[] = new String[10];
        int lineNumberDtl = 0;
        int line = 1;
        try {
            System.out.println("not in detail");
            pstmtdtl = con.prepareStatement("INSERT INTO eballot.voter (first_name, last_name, address, `Surname`, region, profession_school, gender, dob, maidname, nationality) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            System.out.println("ps executed");

            while ((strLineDtl = brdtl.readLine()) != null) {
                System.out.println("detailLINE" + strLineDtl);
                int i = 1;
                if (!(lineNumberDtl == 0)) {
                    stdtl = new StringTokenizer(strLineDtl, ",");
                    while (stdtl.hasMoreTokens()) {
                        dtlstr = stdtl.nextToken();
                        System.out.println("detail: " + dtlstr);
                        pstmtdtl.setString(i++, dtlstr);
                        System.out.println("below insertion");
                    }
                    int rowsdtl = pstmtdtl.executeUpdate();
                    System.out.println(rowsdtl + " rows are updated.");
                }
                lineNumberDtl++;
            }
            con.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            String display = "<label name='dispplay' > Data Successfully Uploaded </label>";
            response.getWriter().println(display);
            response.sendRedirect("http://localhost:8080/eBallot/webpage/voterReg.jsp");
            response.setContentType("text/html;UTF-8");
            PrintWriter writer = response.getWriter();
            writer.write("<html>");
            writer.write("<head>");
            writer.write("<title>Servlet 3.0 File Upload Example </title>");
            writer.write("</head>");
            writer.write("<body>");
            writer.write("<h3>" + responseMessage + "</h3>");
            writer.write("</body>");
            writer.write("</html>");
            writer.close();
        }
    }

        // Extract file name from content-disposition header of file part
    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("***** partHeader: " + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
