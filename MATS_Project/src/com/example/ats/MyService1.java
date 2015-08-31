package com.example.ats;

import java.util.ArrayList;

import android.app.Service;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.location.LocationManager;
import android.net.Uri;
import android.os.IBinder;
import android.util.Log;
import android.widget.Toast;

public class MyService1 extends Service {
	final static String MY_ACTION = "MY_ACTION";
	ArrayList<String> smsList = new ArrayList<String>();
	 LoginDataBaseAdapter loginDataBaseAdapter;
	 Context context;
	 TheftDatabase theft;
	@Override
	public IBinder onBind(Intent arg0) {
		return null;
	}

	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO Auto-generated method stub
		Mythread myThread = new Mythread();
		myThread.start();
		return super.onStartCommand(intent, flags, startId);	
	}
	public class Mythread extends Thread{
		@Override
		public void run() {
			// TODO Auto-generated method stub
			super.run();
			for(int i=0; i<20; i++){
				   try {
					   Thread.sleep(10000);
					   Intent intent = new Intent();
				       intent.setAction(MY_ACTION);
				       sendBroadcast(intent);
				   } catch (InterruptedException e) {
				    e.printStackTrace();
				   }
			}
			stopSelf();
		}
				 
	}
}