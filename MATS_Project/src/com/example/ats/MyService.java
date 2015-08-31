package com.example.ats;

/*import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class MyService extends Service {
	final static String MY_ACTION = "MY_ACTION";
	
	@Override
	public IBinder onBind(Intent arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO Auto-generated method stub
		 
		return super.onStartCommand(intent, flags, startId);
	}			 
}
*/
import java.util.ArrayList;

import android.app.IntentService;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.IBinder;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MyService extends IntentService{
	final static String MY_ACTION = "MY_ACTION_SERV";
	 
	public MyService() {
		super("My Service");
		// TODO Auto-generated constructor stub
	}

	protected void onHandleIntent(Intent intent) {
		
       //Intent i = new Intent(getApplication(), HomeActivity.class);
		
		//Intent i = new Intent(getBaseContext(), MyReceiver.class);  
        //i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        /*String intentType = intent.getExtras().getString("MyReceiver");
        
        if(intentType == null) 
            return;
        if(intentType.equals("MyReceiver")) 
        getApplication().startActivity(i);  */
		Intent intente = new Intent();
		intent.setAction("android.intent.action.BOOT_COMPLECTED");
		
		sendBroadcast(intente);
		
		
        
        
        
    }
	
	@Override
	public IBinder onBind(Intent intent) {
		// TODO Auto-generated method stub
		return null;
	}
}
