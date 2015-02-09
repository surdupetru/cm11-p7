package com.xdaid.sop;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;


public class BootReceiver extends BroadcastReceiver 
{
    @Override
   	public void onReceive(Context context, Intent intent) 
   	{
       	String action = intent.getAction();
       	if (action.equals(Intent.ACTION_BOOT_COMPLETED))
   		{
       		SharedPreferences prefs = context.getSharedPreferences(Const.SOP_PREFERENCES_FILE, Activity.MODE_PRIVATE);
   	        if (prefs.getBoolean(Const.SOP_SERVICE_SETONBOOT, false))
   			{
   	        	Intent i = new Intent(context, BootService.class);
   	        	i.setAction(Const.SOP_ACTION_GLOVE);
   	        	context.startService(i);
   	        	i.setAction(Const.SOP_ACTION_SCREEN);
   	        	context.startService(i);
   			}
   		}
    }
}
