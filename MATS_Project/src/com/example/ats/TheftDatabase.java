package com.example.ats;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
 
public class TheftDatabase 
{
        static final String DATABASE_NAME = "theft.db";
        static final int DATABASE_VERSION = 1;
        public static final int NAME_COLUMN = 1;
        static final String CREATE_TABLE = "create table "+"INCOMINGMSG"+
                "( " +"ID"+" integer primary key autoincrement,"+ "RELATIVEPHONE text, MSG text); ";

        public  SQLiteDatabase db;
        private final Context context;
        private DataBaseHelper dbHelper;
        public  TheftDatabase(Context _context) 
        {
            context = _context;
            dbHelper = new DataBaseHelper(context, DATABASE_NAME, null, DATABASE_VERSION);
        }
		public  TheftDatabase open() throws SQLException 
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
        public void insertEntry(String theftPhone, String msg,  String longitude, String lagitude, String theftImsi, String theftSerialNo)
        {
           ContentValues newValues = new ContentValues();
            // Assign values for each row.
            newValues.put("THEFTPHONE", theftPhone);
            newValues.put("MSG", msg);
            newValues.put("LONGITUDE", longitude);
            newValues.put("LAGITUDE", lagitude);
            newValues.put("THEFTIMSI", theftImsi);
            newValues.put("THEFTSERIALNO", theftSerialNo);
 
            // Insert the row into your table
            db.insert("THEFTTABLE", null, newValues);
            ///Toast.makeText(context, "Reminder Is Successfully Saved", Toast.LENGTH_LONG).show();
        }
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
        public String checkSIM(String phoneIMSINo)
        {
            Cursor cursor=db.query("THEFTTABLE", null, " IMSI=?", new String[]{phoneIMSINo}, null, null, null);
            if(cursor.getCount()<1) // UserName Not Exist
            {
                cursor.close();
                return "NOT EXIST";
            }
            cursor.moveToFirst();
            String PHONE= cursor.getString(cursor.getColumnIndex("RELATIVEPHONE"));
            cursor.close();
            return PHONE;                
        } 
}
