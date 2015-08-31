package com.example.ats;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class UserData extends Activity {
	public static final String PREV_NAME = "MySharedPreferefence";
	public static final String PREV_NAME2 = "MySharedPreferefence2";
	LoginDataBaseAdapter loginDataBaseAdapter;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_user_data);
		loginDataBaseAdapter=new LoginDataBaseAdapter(this);
        loginDataBaseAdapter=loginDataBaseAdapter.open();
        
        final EditText userIDText = (EditText) findViewById(R.id.userNameText);
    	final EditText phoneText = (EditText) findViewById(R.id.phoneText);
    	final EditText passwordFieldText = (EditText) findViewById(R.id.passwordText);
    	final EditText msgFieldText = (EditText) findViewById(R.id.msgText);
    	final Button submit = (Button) findViewById(R.id.buttonAccount);
    	
    	SharedPreferences setting = getSharedPreferences(PREV_NAME, 0);
    	SharedPreferences setting2 = getSharedPreferences(PREV_NAME2, 0);
    	String userID = setting.getString("UserName", "Afeez");
    	String phone = setting2.getString("phone", "1234");
    	String msg = setting2.getString("message", "message");
    	String password = setting.getString("password", "password");
    	
    	
        userIDText.setText(userID);
        phoneText.setText(phone);
    	passwordFieldText.setText(password);
    	msgFieldText.setText(msg);
    	
		submit.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String userID2 = userIDText.getText().toString();
				String phone2 = phoneText.getText().toString();
				String password2 = passwordFieldText.getText().toString();				
		        String msg2 = msgFieldText.getText().toString();
		        if(userID2.equals("")|| phone2.equals("")|| password2.equals("")||msg2.equals(""))
		        {
		                Toast.makeText(getApplicationContext(), "Field Vaccant", Toast.LENGTH_LONG).show();
		                return;
		        }
		        else
		        {
		        	final SharedPreferences settings = getSharedPreferences(PREV_NAME, 0);
		        	
		        	String password = settings.getString("password", "1234");
		        	String imsi = settings.getString("imsi", "imsiString");
		        	String hdID = settings.getString("hwID", "hwID");
		        	String serialNo3 = settings.getString("serialNo2", "serialNo2");
		        	String androidid = settings.getString("androidId", "androidId");
		        	String msg = settings.getString("Message", "msg");
		            loginDataBaseAdapter.insertEntry(userID2, password, phone2, msg, password2, imsi, hdID, msg2, serialNo3, androidid);
		            Intent myintent = new Intent(getApplicationContext(), UserProfile.class);
		            startActivity(myintent);
		            Toast.makeText(getApplicationContext(), "Account Successfully Created ", Toast.LENGTH_LONG).show();
		            
		        }
			}
		});
			
		
	}
	protected void onDestroy() {
        super.onDestroy();
 
        loginDataBaseAdapter.close();
    }
}
