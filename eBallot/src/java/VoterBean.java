/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author AbdHafeez
 */
import java.sql.*;
public class VoterBean {
    String itemNumber = null;

    String description = null;

    int price = 0;

    int quantity = 0;
    String first_name = null;
    String last_name = null;
    String address = null;
    String Surname = null;
    String region=  null;
    String profession_school = null;
    String gender = null;
    String dob = null;
    String maidname =null;
    String nationality = null;

    public String getSurname() {
        return Surname;
    }

    public void setSurname(String Surname) {
        this.Surname = Surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getMaidname() {
        return maidname;
    }

    public void setMaidname(String maidname) {
        this.maidname = maidname;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getProfession_school() {
        return profession_school;
    }

    public void setProfession_school(String profession_school) {
        this.profession_school = profession_school;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }



    static final String DbDriver   = "com.mysql.jdbc.Driver";  // To set the driver

    static final String strConn    = "jdbc:mysql://localhost:3306/eBallot"; // Connection string

    static final String dbUsername = "root"; // Username of the database user

    static final String dbPassword = "hafla_123"; // Password of the database user

    static Connection   conn; // Connection object to establish the connectin to the database

    static ResultSet    rs; // Resultset to store the information retrieved from the database

    static Statement    Stat;

    
   
    public void insertIntoDB(String first_name, String last_name, String address, String Surname, String region, String profession_school, String gender, String dob, String maidname,String nationality)throws SQLException{
        try{
            Class.forName(DbDriver);

            conn = DriverManager.getConnection(strConn, dbUsername, dbPassword);
            conn.setAutoCommit(false);
            String st = "INSERT INTO eballot.vter (first_name, last_name, address, Surname, region, profession_school, gender, dob, maidname, nationality) values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement psmt=conn.prepareStatement(st);
            psmt.setString(1, rs.getString(first_name));
            psmt.setString(2, rs.getString(last_name));
            psmt.setString(2, rs.getString(address));
            psmt.setString(2, rs.getString(Surname));
            psmt.setString(2, rs.getString(region));
            psmt.setString(2, rs.getString(profession_school));
            psmt.setString(2, rs.getString(gender));
            psmt.setString(2, rs.getString(dob));
            psmt.setString(2, rs.getString(maidname));
            psmt.setString(2, rs.getString(nationality));
            boolean sss = psmt.execute();
            conn.commit();
            /*Statement st =conn.createStatement();
            while (rs.next()){
            st.executeUpdate(
            }*/
        }catch(SQLException ex){
            ex.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
