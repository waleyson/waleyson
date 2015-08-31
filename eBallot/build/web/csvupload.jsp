<%-- 
    Document   : csvupload
    Created on : Nov 11, 2014, 2:54:36 PM
    Author     : AbdHafeez
--%>
<%@page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Upload</title>
        <script type="text/javascript">
            function imporok(){
                var a = document.im.filename.value;
                if(a == "" || a == null){
                    alert("selectr csv file to upload");
                }else{
                    im.method = "post";
                    im.action="#";
                    im.submit();
                    return true;
                }

            }

        </script>
    </head>
    <body>
        <form name="im" action="#" method="POST" enctype="multipart/form-data">
            <table border="1">
                <thead>
                    <tr>
                        <th>Upload App</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="hidden" name="ctime"></td>
                        <td><input type="file" name="filename"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" onclick="importok()"  /></td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%


                    String filename = "Sheet1234.csv";
                    DataInputStream dis = null;
                    String record = null;
                    int RecCount = 0;
                    if (filename != null) {
                        try {
                            File f = new File(filename);
                            FileInputStream fis = new FileInputStream(f);
                            BufferedInputStream bis = new BufferedInputStream(fis);
                            dis = new DataInputStream(bis);
                            String[] contents = new String[1000];
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con1 = DriverManager.getConnection("jdbc:mysql://locahost:3306/eBallot", "root", "hafla_123");
                            Statement st = con1.createStatement();
                            Statement st1 = con1.createStatement();
                            Statement st2 = con1.createStatement();
                            int j = 0;
                            while ((record = dis.readLine()) != null) {
                                contents[j] = record;
                                j++;
                            }
                            for (int i = 1; i < j; i++) {
                                String[] val2 = new String[23];
                                String[] val1 = contents[i].split(",");
                                String em = "";
                                for (int k = 0; k < 10; k++) {
                                    if (val1[k].substring(0, 1).equals("\"") || val1[k].substring(0, 1).equals("'")) {
                                        val2[k] = val1[k].substring(1, (val1[k].length()) - 1);
                                        out.println(val2[k]);
                                    } else {
                                        val2[k] = val1[k];
                                    }
                                }

                                st.execute("INSERT INTO eballot.vter (first_name, last_name, address, Surname, region, profession_school, gender, dob, maidname, nationality) "
                                        + "values('" + val2[0] + "','" + val2[1] + "','" + val2[2] + "','" + val2[3] + "','" + val2[4] + "','" + val2[5] + "','" + val2[6] + "','" + val2[7] + "','" + val2[8] + "','" + val2[9] + "')");
        %>
        <%
                            }
                        } catch (Exception e) {
                            out.println("Exception e" + e);
                        }
                    }

        %>
    </body>
</html>
