package com.example.ats;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
 
public class Wizard extends Activity
{
	public static final String PREV_NAME2 = "MySharedPreferefence2";
    EditText editTextPhone ,editTextMsg;
    Button btnCreateAccount;
 
    @Override
    protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.wizard);
        editTextPhone=(EditText)findViewById(R.id.editPhone);
        editTextMsg=(EditText)findViewById(R.id.editmsg);
 
        btnCreateAccount=(Button)findViewById(R.id.buttonAccount);
        btnCreateAccount.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String phone=editTextPhone.getText().toString();
	            String msg=editTextMsg.getText().toString();
	            if(phone.equals("")||msg.equals(""))
	            {
	                    Toast.makeText(getApplicationContext(), "Field Vaccant", Toast.LENGTH_LONG).show();
	                    return;
	            }
	            else
	            {
	            	SharedPreferences settings2 = getSharedPreferences(PREV_NAME2, 0);
	            	SharedPreferences.Editor edit2 = settings2.edit();
					edit2.putString("phone", phone);
					edit2.putString("message", msg);
					edit2.commit();
					Intent third = new Intent(getApplicationContext(), UserData.class);
					startActivity(third);
					
	            }
			}
		});
	}
    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        super.onDestroy();
 
    }
}