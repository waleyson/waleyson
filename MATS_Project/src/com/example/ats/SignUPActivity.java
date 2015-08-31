package com.example.ats;
import com.example.ats.SystemProperties;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import android.provider.Settings;
 
public class SignUPActivity extends Activity
{
    
    Button btnCreateAccount;
    public static final String PREV_NAME = "MySharedPreferefence";
    @Override
    protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.signup);
 
        // get Instance  of Database Adapter
        
 
        // Get Refferences of Views
        final EditText editTextUserName=(EditText)findViewById(R.id.editTextUserName);
        final EditText editTextPassword=(EditText)findViewById(R.id.editTextPassword);
        final EditText editTextConfirmPassword=(EditText)findViewById(R.id.editTextConfirmPassword);
 
        btnCreateAccount=(Button)findViewById(R.id.buttonCreateAccount);
        btnCreateAccount.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				String imeistring = null;
				String imsiString = null;
				String hwID = null;
				TelephonyManager telephoneManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
				imeistring = telephoneManager.getDeviceId();
				imsiString = telephoneManager.getSubscriberId();
				
			    //hwID = com.example.ats.SystemProperties.get("ro.seiralno", "unknown");
				String serialNo = telephoneManager.getSimSerialNumber();
				
				/*try{
					Class<?> c = Class.forName("com.example.ats.SystemProperties");
					Method get = c.getMethod("get",String.class, String.class);
					serialNo = (String) get.invoke(c, "Serial no", "unknown");
					
					
				}catch(Exception exception){
					
				}*/
				String serialNo2 = null;
				try{
					Class myclass = Class.forName("com.example.ats.SystemProperties");
					Method[] methods = myclass.getMethods();
					Object[] param = new Object[] {new String ("ro.seiralno"), new String("unknown")};
					serialNo2 = (String) methods[2].invoke(myclass, param);
					
				}catch(Exception e){
					
				}
				String androidId = Settings.Secure.getString(getContentResolver(), Settings.Secure.ANDROID_ID);
				String userName=editTextUserName.getText().toString();
	            String password=editTextPassword.getText().toString();
	            String confirmPassword=editTextConfirmPassword.getText().toString();
	            if(userName.equals("")||password.equals("")||confirmPassword.equals(""))
	            {
	                    Toast.makeText(getApplicationContext(), "Field Vaccant", Toast.LENGTH_LONG).show();
	                    return;
	            }
	            if(!password.equals(confirmPassword))
	            {
	                Toast.makeText(getApplicationContext(), "Password does not match", Toast.LENGTH_LONG).show();
	                return;
	            }
	            else
	            {
	                // Save the Data in Database
	            	SharedPreferences settings = getSharedPreferences(PREV_NAME, 0);
					SharedPreferences.Editor edit = settings.edit();
					edit.putString("UserName", userName);
					edit.putString("password", password);
					edit.putString("imei", imeistring);
					edit.putString("imsi", imsiString);
					edit.putString("hwID", hwID);
					edit.putString("serialNo", serialNo);
					edit.putString("serialNo2", serialNo2);
					edit.putString("androidId", androidId);
					edit.commit();
					Intent second = new Intent(getApplicationContext(), Wizard.class);
					startActivity(second);
	            }
			}
		});
        /*btnCreateAccount.setOnClickListener(new View.OnClickListener() {
        
        public void onClick(View v) {
 
            String userName=editTextUserName.getText().toString();
            String password=editTextPassword.getText().toString();
            String confirmPassword=editTextConfirmPassword.getText().toString();
 
            // check if any of the fields are vaccant
            if(userName.equals("")||password.equals("")||confirmPassword.equals(""))
            {
                    Toast.makeText(getApplicationContext(), "Field Vaccant", Toast.LENGTH_LONG).show();
                    return;
            }/*else
            // check if both password matches
            if(!password.equals(confirmPassword))
            {
                Toast.makeText(getApplicationContext(), "Password does not match", Toast.LENGTH_LONG).show();
                return;
            }
            else
            {
                // Save the Data in Database
                loginDataBaseAdapter.insertEntry(userName, password);
                Toast.makeText(getApplicationContext(), "Account Successfully Created ", Toast.LENGTH_LONG).show();
            }
        }
    });*/
	}
    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        super.onDestroy();
    }
}
