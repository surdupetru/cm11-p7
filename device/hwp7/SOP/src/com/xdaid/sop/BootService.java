package com.xdaid.sop;

import android.app.Activity;
import android.app.Service;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.IBinder;


public class BootService extends Service
{
	public void onCreate()
    {
        super.onCreate();
    }


    @Override
    public IBinder onBind(Intent intent)
    {
        return null;
    }


    public void onDestroy()
    {
        // service stopped
    }


    @Override
    public int onStartCommand(Intent intent, int flags, int startId)
    {
        String action = intent.getAction();
        applySettingsInBackground(action);
        return START_NOT_STICKY;
    }


    public void applySettingsInBackground(final String action)
    {
        new Thread(new Runnable()
        {
            @Override
            public void run()
            {
                //try { Thread.sleep(2000); } catch (Exception e) { }
            	SharedPreferences prefs = getSharedPreferences(Const.SOP_PREFERENCES_FILE, Activity.MODE_PRIVATE);
                if (action != null)
                {
                	if (action.equals(Const.SOP_ACTION_GLOVE))
                	{
                		String prop = prefs.getString(Const.SOP_PREFS_GLOVE, "0");
                		Cmd.execsu("setprop sys.glovemode.enabled " + prop);
                	}
                	if (action.equals(Const.SOP_ACTION_SCREEN))
                	{
                		String prop = prefs.getString(Const.SOP_PREFS_SCREEN, "false");
                		Cmd.execsu("setprop lockscreen.rot_override " + prop);
                	}
                }
            }
        }).start();

    }
}
