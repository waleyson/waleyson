package com.example.ats;



import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import android.app.Activity;
import android.app.Dialog;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.telephony.gsm.SmsManager;
import android.telephony.gsm.SmsMessage;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;
 
public class HomeActivity extends Activity {

    Button btnSignIn,btnSignUp;
    LoginDataBaseAdapter loginDataBaseAdapter;
    private static final long MINIMUM_DISTANCE_CHANGE_FOR_UPDATES = 1;
	private static final long MINIMUM_TIME_BETWEEN_UPDATES = 1000;
	protected LocationManager locationManager;
	protected Button retrieveLocationButton;
	//MyLocationListener myServiceRec;
	//SMSReceiver smsReceiver;
    @Override
    protected void onCreate(Bundle savedInstanceState) 
    {
         super.onCreate(savedInstanceState);
         setContentView(R.layout.main);
         //locationManager = (LocationManager) getSystemService(Service.LOCATION_SERVICE);
 		/* locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER,
 				MINIMUM_TIME_BETWEEN_UPDATES, MINIMUM_DISTANCE_CHANGE_FOR_UPDATES, 
 				new SMSReceiver());*/
 		//myServiceRec = new MyLocationListener();
		//IntentFilter intentFilter = new IntentFilter();
		//intentFilter.addAction(MyService1.MY_ACTION);
		//registerReceiver(myServiceRec, intentFilter);
		//Intent intente = new Intent (HomeActivity.this, com.example.ats.MyService1.class);
		//startService(intente);
         /*
          * SMS Receiver and Sender value here
          *  uncomment it
          */
         
		//smsReceiver = new SMSReceiver();
		//IntentFilter intes = new IntentFilter();
		//registerReceiver(smsReceiver, intes);
        //startService(new Intent( HomeActivity.this, MyService1.class));
         // create a instance of SQLite Database
         //loginDataBaseAdapter=new LoginDataBaseAdapter(this);
         //loginDataBaseAdapter=loginDataBaseAdapter.open();
         
         // Get The Refference Of Buttons
         //btnSignIn=(Button)findViewById(R.id.buttonSignIN);
         btnSignUp=(Button)findViewById(R.id.buttonSignUP);
         
        // Set OnClick Listener on SignUp button 
        btnSignUp.setOnClickListener(new View.OnClickListener() {
        public void onClick(View v) {
 
            /// Create Intent for SignUpActivity  abd Start The Activity
        	
            Intent intentSignUP = new Intent(getApplicationContext(),SignUPActivity.class);
            startActivity(intentSignUP);
            }
        });
    }

   public void signIn(View V)
       {
            final Dialog dialog = new Dialog(HomeActivity.this);
            dialog.setContentView(R.layout.login);
            dialog.setTitle("Login");
            final  EditText editTextUserName=(EditText)dialog.findViewById(R.id.editTextUserNameToLogin);
            final  EditText editTextPassword=(EditText)dialog.findViewById(R.id.editTextPasswordToLogin);

            Button btnSignIn=(Button)dialog.findViewById(R.id.buttonSignIn);
 

            loginDataBaseAdapter=new LoginDataBaseAdapter(this);
            loginDataBaseAdapter.open();
            btnSignIn.setOnClickListener(new View.OnClickListener() {
 
                public void onClick(View v)
                {
                    // get The User name and Password
                    String userName = editTextUserName.getText().toString();
                    String password=editTextPassword.getText().toString();
                    
                    // fetch the Password form database for respective user name
                    String storedPassword=loginDataBaseAdapter.getSinlgeEntry(userName);
 
                    // check if the Stored password matches with  Password entered by user
                    if(password.equals(storedPassword))
                    {
                        Toast.makeText(HomeActivity.this, "Congrats: Login Successfull", Toast.LENGTH_LONG).show();
                        dialog.dismiss();
                        Intent logon = new Intent(getApplicationContext(), MainActivity.class);
                        startActivity(logon);
                    }
                    else
                    {
                        Toast.makeText(HomeActivity.this, "User Name or Password does not match", Toast.LENGTH_LONG).show();
                    }
                }
            });
 
            dialog.show();
            //loginDataBaseAdapter.close();
    }
   
   /*@Override
	 protected void onStart() {
		/*Intent intent = new Intent();
		intent.setAction("android.intent.action.BOOT_COMPLECTED");
		sendBroadcast(intent);
		myServiceRec = new MyLocationListener();
		IntentFilter intentFilter = new IntentFilter();
		intentFilter.addAction(MyService1.MY_ACTION);
		registerReceiver(myServiceRec, intentFilter);
		Intent intente = new Intent (HomeActivity.this, com.example.ats.MyService1.class);
		startService(intente);
		super.onStart();
	}*/
    /* public void broadcastIntent(View view){
		   Intent intent = new Intent();
			intent.setAction("android.intent.action.BOOT_COMPLECTED");
			sendBroadcast(intent);
	}*/
    @Override
    protected void onDestroy() {
        super.onDestroy();
        // Close The Database
        //loginDataBaseAdapter.close();
    }
    @Override
    protected void onStop() {
    	// TODO Auto-generated method stub
    	//unregisterReceiver(myServiceRec);
    	//unregisterReceiver(smsReceiver);
    	//loginDataBaseAdapter.close();
    	super.onStop();
    }
    /*class MyLocationListener extends BroadcastReceiver implements LocationListener {
    	public static final String MY_PREV_NAME = "MySharedPref";
		public MyLocationListener() {
		}
		@Override
		public void onLocationChanged(Location location) {
			
			String message = String.format("New Location \n Longtitude: %1$s \n Latitude: %2$s", 
					location.getLongitude(), location.getLatitude());
		}
		@Override
		public void onProviderDisabled(String provider) {
			Toast.makeText(HomeActivity.this, "Provider disabled by the User. GPS turned off", Toast.LENGTH_LONG).show();
		}
		@Override
		public void onProviderEnabled(String provider) {
			Toast.makeText(HomeActivity.this, "Provider enabled by the user. GPS turned on", Toast.LENGTH_LONG).show();
		}
		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
			
		}

		@Override

		public void onReceive(Context context, Intent intent) {
			loginDataBaseAdapter = new LoginDataBaseAdapter(context);
			loginDataBaseAdapter.open();
			SharedPreferences setting = getSharedPreferences(MY_PREV_NAME, 0);
        	SharedPreferences.Editor _edit = setting.edit();
			
			Location location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
			if(location != null){
				String longitude = String.valueOf(location.getLongitude());
				String latitude = String.valueOf(location.getLatitude());
				String message = String.format("The Current Location \n Longtitude: %1$s \n Lotitude: %2s ", 
						longitude, latitude);
				Toast.makeText(context, message, Toast.LENGTH_LONG).show();
				_edit.putString("LONGITUDE", longitude);
				_edit.putString("LATITUDE", latitude);
				_edit.commit();
				//loginDataBaseAdapter.insertmsg(longitude, latitude);
				getMyLocationAddress();
				Log.v("Value of GPS",longitude+latitude);
			}
			//loginDataBaseAdapter.close();
		}	

		public void getMyLocationAddress() {
			Geocoder geocoder = new Geocoder(getBaseContext(), Locale.ENGLISH);
			try{
				//List<Address> addresses = geocoder.getFromLocation(Double.valueOf(longitude), Double.valueOf(latitude), 1);
				List<Address> addresses = geocoder.getFromLocation(.423247,-122.085469 , 1);
				if(addresses != null){
					Address fetchAdress = addresses.get(0);
					StringBuilder strAddress = new StringBuilder();
					for(int i = 0; i < fetchAdress.getMaxAddressLineIndex(); i++){
						strAddress.append(fetchAdress.getAddressLine(i)).append("\n");
					}
					Toast.makeText(getApplicationContext(), "I am at:  " + strAddress.toString(), Toast.LENGTH_LONG).show();
				}else
				Toast.makeText(getApplicationContext(), "No Location found !", Toast.LENGTH_LONG).show();;
			}catch(IOException ex){
				ex.printStackTrace();
				Toast.makeText(getApplicationContext(), "Could not get address..!", Toast.LENGTH_LONG).show();
			}
		}
	}*/
    
}
