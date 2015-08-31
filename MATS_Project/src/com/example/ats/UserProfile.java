package com.example.ats;

import android.os.Bundle;
import android.app.Activity;
import android.content.SharedPreferences;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class UserProfile extends Activity {
	public static final String PREV_NAME = "MySharedPreferefence";
	public static final String PREV_NAME2 = "MySharedPreferefence2";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_user_profile);
		SharedPreferences settings = getSharedPreferences(PREV_NAME, 0);
		SharedPreferences setting2 = getSharedPreferences(PREV_NAME2, 0);
		TextView userId = (TextView)findViewById(R.id.userID);
		TextView phone = (TextView)findViewById(R.id.phone);
		TextView imei = (TextView)findViewById(R.id.imei);
		TextView imsi = (TextView)findViewById(R.id.imsi);
		TextView hdID = (TextView)findViewById(R.id.hdID);
		TextView serialNo = (TextView)findViewById(R.id.serialNo);
		TextView serialNo2 = (TextView)findViewById(R.id.serialNo2);
		TextView androidID = (TextView)findViewById(R.id.androidid);
		TextView msg = (TextView)findViewById(R.id.msg);
		

		String imeiStr = settings.getString("imei", "imeistring");
    	String imsiStr = settings.getString("imsi", "imsiString");
    	String hdIDStr = settings.getString("hwID", "hwID");
    	String serialNoStr = settings.getString("serialNo", "serialNo");
    	String serialNo2Str = settings.getString("serialNo2", "Serialno2");
    	String androidid = settings.getString("androidId", "androidId");
    	String msgStr = settings.getString("Message", "msg");
    	String userID = settings.getString("UserName", "Afeez");
    	String phoneStr = setting2.getString("phone", "1234");
    	
    	userId.setText(userID); 
    	phone.setText(phoneStr); 
    	imei.setText(imeiStr);
    	imsi.setText(imsiStr);
    	hdID.setText(hdIDStr); 
    	serialNo.setText(serialNoStr); 
    	serialNo2.setText(serialNo2Str); 
    	androidID.setText(androidid); 
    	msg.setText(msgStr);
	}

	protected void onDestroy() {
        super.onDestroy();
 
    }

}
