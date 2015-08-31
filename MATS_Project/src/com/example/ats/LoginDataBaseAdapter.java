package com.example.ats;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
 
public class LoginDataBaseAdapter 
{
        static final String DATABASE_NAME = "login.db";
        static final int DATABASE_VERSION = 1;
        public static final int NAME_COLUMN = 1;
        static final String DATABASE_CREATE = "create table "+"LOGIN"+
                                     "( " +"ID"+" integer primary key autoincrement,"+ "USERNAME  text,PASSWORD text, PHONE text, MESSAGE text, IMEI text, IMSI text, HDID text,SERIALNO text, SERIALNO2 text, ANDROIDID text); ";
        static final String CREATE_MSGTABLE = "create table "+"INCOMINGMSG"+
                "( " +"ID"+" integer primary key autoincrement,"+ "longitude text, latitude text); ";

        public  SQLiteDatabase db;
        private final Context context;
        private DataBaseHelper dbHelper;
        public  LoginDataBaseAdapter(Context _context) 
        {
            context = _context;
            dbHelper = new DataBaseHelper(context, DATABASE_NAME, null, DATABASE_VERSION);
            
        }
		public  LoginDataBaseAdapter open() throws SQLException 
        {
            db = dbHelper.getWritableDatabase();
            return this;
        }
        public void close() 
        {
            db.close();
        }
 
        public  SQLiteDatabase getDatabaseInstance()
        {
            return db;
        }
        //insert into Message Table
        public void insertmsg(String relativePhone, String msg)
        {
           ContentValues newValues = new ContentValues();
            // Assign values for each row.
            newValues.put("RELATIVEPHONE", relativePhone);
            newValues.put("MSG", msg);
            // Insert the row into your table
            db.insert("INCOMINGMSG", null, newValues);
            ///Toast.makeText(context, "Reminder Is Successfully Saved", Toast.LENGTH_LONG).show();
        }
        //get relative number from relative table
        public String getPhoneRelNum() {
            String Table_Name="INCOMINGMSG";

            String selectQuery = "SELECT  * FROM " + Table_Name;
            Cursor cursor = db.rawQuery(selectQuery, null);
            if(cursor.getCount()<1) // UserName Not Exist
            {
                cursor.close();
                return "NOT EXIST";
            }
            cursor.moveToFirst();
            String data = cursor.getString(cursor.getColumnIndex("RELATIVEPHONE"));
            cursor.close();
            return data;
        }
        
        public void insertEntry(String userName, String password, String phone, String msg, String imei, String imsi, String hdID,String serialNo, String serialNo2, String androidId)
        {
           ContentValues newValues = new ContentValues();
            // Assign values for each row.
            newValues.put("USERNAME", userName);
            newValues.put("PASSWORD",password);
            newValues.put("PHONE", phone);
            newValues.put("MESSAGE", msg);
            newValues.put("IMEI", imei);
            newValues.put("IMSI", imsi);
            newValues.put("HDID", hdID);
            newValues.put("SERIALNO", serialNo);
            newValues.put("SERIALNO2", serialNo2);
            newValues.put("ANDROIDID", androidId);
 
            // Insert the row into your table
            db.insert("LOGIN", null, newValues);
            ///Toast.makeText(context, "Reminder Is Successfully Saved", Toast.LENGTH_LONG).show();
        }
        public int deleteEntry(String UserName)
        {
            //String id=String.valueOf(ID);
            String where="USERNAME=?";
            int numberOFEntriesDeleted= db.delete("LOGIN", where, new String[]{UserName}) ;
           // Toast.makeText(context, "Number fo Entry Deleted Successfully : "+numberOFEntriesDeleted, Toast.LENGTH_LONG).show();
            return numberOFEntriesDeleted;
        }    
        public String[] getMultipleEntry(String userName)
        {
            Cursor cursor=db.query("LOGIN", null, " USERNAME=?", new String[]{userName}, null, null, null);
            if(cursor.getCount()<1) // UserName Not Exist
            {
                cursor.close();
                return null;
            }
            cursor.moveToFirst();
            String USERID = cursor.getString(cursor.getColumnIndex("USERNAME"));
            String password = cursor.getString(cursor.getColumnIndex("PASSWORD"));
            String phone = cursor.getString(cursor.getColumnIndex("PHONE"));
            String msg = cursor.getString(cursor.getColumnIndex("MESSAGE"));
            String imei = cursor.getString(cursor.getColumnIndex("IMEI"));
            String imsi = cursor.getString(cursor.getColumnIndex("IMSI"));
            String hdid = cursor.getString(cursor.getColumnIndex("HDID"));
            String serialno = cursor.getString(cursor.getColumnIndex("SERIALNO"));
            String serialno2 = cursor.getString(cursor.getColumnIndex("SERIALNO2"));
            String androidid = cursor.getString(cursor.getColumnIndex("ANDROIDID"));
            cursor.close();
            String arg[] = {USERID, password, phone, msg, imei, imsi, hdid, serialno, serialno2, androidid};
            return arg;                
        }
        public String getPhoneNum() {
            String Table_Name="LOGIN";

            String selectQuery = "SELECT  * FROM " + Table_Name;
            Cursor cursor = db.rawQuery(selectQuery, null);
            if(cursor.getCount()<1) // UserName Not Exist
            {
                cursor.close();
                return "NOT EXIST";
            }
            cursor.moveToFirst();
            String data = cursor.getString(cursor.getColumnIndex("PHONE"));
            cursor.close();
            return data;
        }

        public String getLonLag() {
            String Table_Name="INCOMINGMSG";

            String selectQuery = "SELECT  * FROM " + Table_Name;
            Cursor cursor = db.rawQuery(selectQuery, null);
            if(cursor.getCount()<1) // UserName Not Exist
            {
                cursor.close();
                return "NOT EXIST";
            }
            cursor.moveToFirst();
            String data = cursor.getString(cursor.getColumnIndex("longitude"));
            String data2 = cursor.getString(cursor.getColumnIndex("latitude"));
            cursor.close();
            String args = "Longitude= "+data +" Latitude= "+data2;
            return args;
        }
        public String getSinlgeEntry(String userName)
        {
            Cursor cursor= db.query("LOGIN", null, " USERNAME=?", new String[]{userName}, null, null, null);
            if(cursor.getCount()<1) // UserName Not Exist
            {
            	cursor.close();
                return "NOT EXIST";
            }
            cursor.moveToFirst();
            String password= cursor.getString(cursor.getColumnIndex("PASSWORD"));
            cursor.close();
            return password;                
        }
        public String checkSIM(String phoneIMSINo)
        {
            Cursor cursor=db.query("LOGIN", null, " IMSI=?", new String[]{phoneIMSINo}, null, null, null);
            if(cursor.getCount()<1) // IMSI Not Exist
            {
                cursor.close();
                return "NOT EXIST";
            }
            cursor.moveToFirst();
            String PHONE= cursor.getString(cursor.getColumnIndex("PHONE"));
            cursor.close();
            return PHONE;                
        }
        public void  updateEntry(String userName,String password)
        {
            // Define the updated row content.
            ContentValues updatedValues = new ContentValues();
            // Assign values for each row.
            updatedValues.put("USERNAME", userName);
            updatedValues.put("PASSWORD",password);
 
            String where="USERNAME = ?";
            db.update("LOGIN",updatedValues, where, new String[]{userName});               
        }        
}
