package com.example.ats;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;



















import com.example.ats.MainActivity.ErrorDialogFragment;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.location.LocationClient;

import android.location.Address;
import android.location.Geocoder;
import android.app.Activity;
import android.app.Dialog;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.telephony.gsm.SmsManager;
import android.telephony.gsm.SmsMessage;
import android.util.Log;
import android.widget.Toast;

public class SMSReceiver extends BroadcastReceiver {
	public static final String SMS_EXTRA_NAME = "pdus";
	public static final String SMS_URI = "content://sms";
	LoginDataBaseAdapter login;
	public static final String ADDRESS = "address";
    public static final String PERSON = "person";
    public static final String DATE = "date";
    public static final String READ = "read";
    public static final String STATUS = "status";
    public static final String TYPE = "type";
    public static final String BODY = "body";
    public static final String SEEN = "seen";
    
    public static final int MESSAGE_TYPE_INBOX = 1;
    public static final int MESSAGE_TYPE_SENT = 2;
    
    public static final int MESSAGE_IS_NOT_READ = 0;
    public static final int MESSAGE_IS_READ = 1;
    
    public static final int MESSAGE_IS_NOT_SEEN = 0;
    public static final int MESSAGE_IS_SEEN = 1;
    //public static final String MY_PREV_NAME = "MySharedPref";
    public static final String PREV_NAME = "MySharedPreferefence";
	LoginDataBaseAdapter baseTable;
	LocationManager locationManager;
	private LocationClient mLocationClient;
	public static final String EMPTY_STRING = new String();
	
	LocationListener onLocation = new LocationListener() {
		
		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void onProviderEnabled(String provider) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void onProviderDisabled(String provider) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void onLocationChanged(Location location) {
			// TODO Auto-generated method stub
			String laglong = "Lat: "+ location.getLatitude() + "Longi: "+location.getLongitude();
			Log.i("mobile view Receiver", laglong);
		}
	};
	public SMSReceiver() {
	}
	/*public static String getLatLng(Context context, Location currentLocation) {
        // If the location is valid
        if (currentLocation != null) {

            // Return the latitude and longitude as strings
            return context.getString(
                    R.string.latitude_longitude, 
                    currentLocation.getLatitude(),
                    currentLocation.getLongitude());
        } else {

            // Otherwise, return the empty string
            return EMPTY_STRING;
        }
    }*/
    public static final byte[] PASSWORD = new byte[]{ 0x25, 0x36, 0x39, 0x47, (byte) 0x94, 0x53, 0x51 };

    String msg;
	@Override
	public void onReceive(Context context, Intent intent) {
		locationManager = (LocationManager) context.getSystemService(context.LOCATION_SERVICE);
		locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 5000, 5, onLocation);
		//Location location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
		//mLocationClient = new LocationClient(context, null, null);
		//Geocoder geocoder = new Geocoder(context, Locale.ENGLISH);
		//mLocationClient.connect();
		
		//if(servicesConnected(context)){
		//Location loc = mLocationClient.getLastLocation();
		//msg = LocationUtils.getLatLng(context,loc);
		//SharedPreferences _setting = context.getSharedPreferences(MY_PREV_NAME, 0);
		//String longitude = _setting.getString("LONGITUDE", "longitude");
		//String latitude = _setting.getString("LATITUDE", "latitude");
		//}
		 Bundle extras = intent.getExtras();
		 baseTable = new LoginDataBaseAdapter(context);
		 baseTable.open();
		//Log.v("Longitude and Latitude: ", myLoc);
		 Toast.makeText(context, "myLoc", Toast.LENGTH_LONG).show();
	        String phone = baseTable.getPhoneNum();
	        
	        String messages = "";
	        if ( extras != null )
	        {
	            // Get received SMS array
	            Object[] smsExtra = (Object[]) extras.get( SMS_EXTRA_NAME );
	            
	            // Get ContentResolver object for pushing encrypted SMS to incoming folder
	           ContentResolver contentResolver = context.getContentResolver();
	           
	            for ( int i = 0; i < smsExtra.length; ++i )
	            {
	            	SmsMessage sms = SmsMessage.createFromPdu((byte[])smsExtra[i]);
	            	Toast.makeText(context, phone, Toast.LENGTH_LONG).show();
	            	String body = sms.getMessageBody().toString();
	            	String address = sms.getOriginatingAddress();
	                messages += "SMS from " + address + " :\n"+ body + "\n"+ body +"\n";                    
	                 
	            	Toast.makeText(context, messages, Toast.LENGTH_LONG).show();
	                // Here you can add any your code to work with incoming SMS
	                // I added encrypting of all received SMS 
	                
	                //putSmsToDatabase( contentResolver, sms );
	               // if(body.equals("Locate")){
	    	            // Display SMS message
	            		
	                	//String longlatmsg = String.format("The Current Location \n Longtitude: %1$s \n Lotitude: %2s ", location.getLatitude() , location.getLongitude());
	            	 
	                	Toast.makeText( context, phone, Toast.LENGTH_SHORT ).show();
	    	            	Toast.makeText( context, msg, Toast.LENGTH_SHORT ).show();
	    	            	//Log.v("Latitude and Longitude", msg);
	    	            	
	    	            	try {
								sendSMS(phone, msg);
							} catch (Exception e) {
								
								e.printStackTrace();
							}
	    	            	
	    	            }//else{
	    	            	Toast.makeText( context, "no body and message founds", Toast.LENGTH_SHORT ).show();	
	    	            //}
	           
		}
	}
	/*public static void getAddressFromLocation(final Location location, final Context context, final Handler handler){
		Thread thread = new Thread(){
			public void run() {
				Geocoder geocoder = new Geocoder(context, Locale.getDefault());
				String result = null;
				try{
        	 	List<Address> list = geocoder.getFromLocation(location.getLatitude(), location.getLongitude(), 1);
	        	 	if(list != null && list.size() > 0){
	        	 		Address address1 = list.get(0);
	        	 		result = address1.getAddressLine(0)+","+address1.getLocality();
	        	 	}
				}catch(IOException e){
					Log.e("Geocoder issue: ","Impossible to connect t ogeocoder"+e);
				}finally{
					Message msg =Message.obtain();
					msg.setTarget(handler);
					if(result != null){
						msg.what = 1;
						Bundle bundle = new Bundle();
						bundle.putString("address: ", result);
						msg.setData(bundle);
					}else
						msg.what = 0;
					msg.sendToTarget();
				}
			}
			};
			thread.start();
		}*/
	protected void sendSMS(String addr, String message)throws Exception{
		Log.i("Send SMS", "");
		SmsManager smsMgr = SmsManager.getDefault();
		ArrayList<String> smsString = smsMgr.divideMessage(message);
		
		smsMgr.sendMultipartTextMessage(addr, null, smsString, null, null);
	}
	private void putSmsToDatabase( ContentResolver contentResolver, SmsMessage sms )
	{
		// Create SMS row
        ContentValues values = new ContentValues();
        values.put( ADDRESS, sms.getOriginatingAddress() );
        values.put( DATE, sms.getTimestampMillis() );
        values.put( READ, MESSAGE_IS_NOT_READ );
        values.put( STATUS, sms.getStatus() );
        values.put( TYPE, MESSAGE_TYPE_INBOX );
        values.put( SEEN, MESSAGE_IS_NOT_SEEN );
        try
        {
        	String encryptedPassword = StringCryptor.encrypt( new String(PASSWORD), sms.getMessageBody().toString() ); 
        	values.put( BODY, encryptedPassword );
        }
        catch ( Exception e ) 
        { 
        	e.printStackTrace(); 
    	}
        
        // Push row into the SMS table
        contentResolver.insert( Uri.parse( SMS_URI ), values );
	}
}
