package com.example.ats;

import java.util.ArrayList;

import android.os.Bundle;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.telephony.TelephonyManager;
import android.telephony.gsm.SmsManager;
import android.util.Log;
import android.view.Menu;
import android.view.ViewDebug.FlagToString;
import android.widget.Toast;

public class MyReceiver extends BroadcastReceiver {

	String currentIMSI;
	LoginDataBaseAdapter loginDataBaseAdapter;
	String phoneNumber2 ;
    String retrieveValue ;
    TelephonyManager phoneManager2;
	@SuppressWarnings("deprecation")
	@Override
	public void onReceive(Context context, Intent intent) {
		if ("android.intent.action.BOOT_COMPLETED".equals(intent.getAction())) {
			
		loginDataBaseAdapter=new LoginDataBaseAdapter(context);
        loginDataBaseAdapter=loginDataBaseAdapter.open();
        phoneManager2 = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
		phoneNumber2 = phoneManager2.getSubscriberId();
        retrieveValue = loginDataBaseAdapter.checkSIM(phoneNumber2);
        String realPhoneNum = loginDataBaseAdapter.getPhoneNum();
		Log.w("MY_DEBUG_TAG", phoneNumber2);
		Log.w("MY_DEBUG_TAG", retrieveValue);
		//Toast.makeText(context, "Your Phone Number is"+phoneNo, Toast.LENGTH_LONG).show();
		//Toast.makeText(context, "your Phone Serial Number is"+SIMSerial, Toast.LENGTH_LONG).show();
		if(retrieveValue.equals("NOT EXIST")){
			Toast.makeText(context, "your Phone Serial Number is not"+ phoneNumber2, Toast.LENGTH_LONG).show();

			Toast.makeText(context, "your Phone Serial Number is not"+ realPhoneNum, Toast.LENGTH_LONG).show();
			Log.w("SIM changed", "!!!");
			//new GmailAsync().execute("");
			
				try {
					Toast.makeText(context, "your Phone Serial Number is not"+ realPhoneNum, Toast.LENGTH_LONG).show();
					String sms = "Sim card changed,"+"Sim Serial number of this card is \n"+phoneNumber2
							+"Network Operator"+phoneManager2.getNetworkOperatorName();
					sendSMS(realPhoneNum, sms);
					Toast.makeText(context, "SMS message send"+sms, Toast.LENGTH_LONG).show();
				} catch (Exception e) {
					e.getMessage().toString();
				}
			
		}else{
			Toast.makeText(context, "your Phone Serial Number is "+ phoneNumber2, Toast.LENGTH_LONG).show();
		}
			/*Intent i = new Intent(context, HomeActivity.class);  
	        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
	        context.startActivity(i);*/
		}
		
		
        //Intent bootIntent = new Intent(context, MyService.class);
		//bootIntent.putExtra("MyReceiver", "MyService");
        //bootIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
	    //context.startService(bootIntent);
		loginDataBaseAdapter.close();
	}
	protected void sendSMS(String addr, String message)throws Exception{
		Log.i("Send SMS", "");
		SmsManager smsMgr = SmsManager.getDefault();
		ArrayList<String> smsString = smsMgr.divideMessage(message);
		
		smsMgr.sendMultipartTextMessage(addr, null, smsString, null, null);
	}
	/*public static String getPhoneNumber(Context context){
		TelephonyManager phoneManager = (TelephonyManager) context.getSystemService(context.TELEPHONY_SERVICE);
		String phoneNumber = phoneManager.getLine1Number();
		return phoneNumber;
	}*/
	/*public static String getSimSerialNumber(Context context){
		TelephonyManager phoneManager2 = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
		String phoneNumber2 = phoneManager2.getSimSerialNumber();
		return phoneNumber2;
	}*/
	
}