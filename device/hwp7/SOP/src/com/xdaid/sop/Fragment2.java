package com.xdaid.sop;

import android.app.ActionBar;
import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.RadioGroup.OnCheckedChangeListener;


public class Fragment2 extends android.support.v4.app.Fragment
{
    private SharedPreferences prefs;

    private View rootView;

    @SuppressWarnings("unused")
	private com.xdaid.sop.ActivityMain parentActivity;


    public Fragment2()
    {
        // Empty constructor required for fragment subclasses
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
        prefs = getActivity().getSharedPreferences(Const.SOP_PREFERENCES_FILE, Activity.MODE_PRIVATE);

    	rootView = inflater.inflate(R.layout.fragment_2, container, false);
        setHasOptionsMenu(true);

    	parentActivity = (com.xdaid.sop.ActivityMain)getActivity();

        ActionBar actionBar = getActivity().getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);

        TextView tv1 = (TextView)rootView.findViewById(R.id.fragment_2_tv1);
		tv1.setGravity(Gravity.CENTER);
		tv1.setText(R.string.fragment_2_label);

		RadioGroup rg1 = (RadioGroup)rootView.findViewById(R.id.fragment_2_rg1);
		rg1.setGravity(Gravity.CENTER);

		RadioButton rb1 = (RadioButton)rootView.findViewById(R.id.fragment_2_rb1);
		rb1.setGravity(Gravity.CENTER);
		rb1.setText(R.string.fragment_2_radio1);

		RadioButton rb2 = (RadioButton)rootView.findViewById(R.id.fragment_2_rb2);
		rb2.setGravity(Gravity.CENTER);
		rb2.setText(R.string.fragment_2_radio2);

		Switch sw1 = (Switch)rootView.findViewById(R.id.fragment_2_sw1);
		sw1.setGravity(Gravity.CENTER);
		sw1.setText(R.string.fragment_2_switch);

		String prop = Cmd.execsh("cat /sys/bus/platform/devices/huawei_touch/touch_glove");
		if (prop == null) prop = "0";
		if (prop.length() == 0) prop = "0";
		if (prop.equals("0")) rb1.setChecked(true);
		if (prop.equals("1")) rb2.setChecked(true);

		boolean checked = prefs.getBoolean(Const.SOP_SERVICE_SETONBOOT, false);
		sw1.setChecked(checked);

		rg1.setOnCheckedChangeListener(radio_checkedChangedListener);
		sw1.setOnCheckedChangeListener(switch_checkedChangeListener);

		return rootView;
    }


    private OnCheckedChangeListener radio_checkedChangedListener = new OnCheckedChangeListener()
    {
		@Override
		public void onCheckedChanged(RadioGroup group, int checkedId)
		{
			if (checkedId == group.getChildAt(0).getId())
			{
				if (Cmd.isOpen())
				{
					Cmd.exec("setprop sys.glovemode.enabled 0");
				}
				else
				{
					Cmd.execsu("setprop sys.glovemode.enabled 0");
				}
				Cmd.execsu("setprop sys.glovemode.enabled 0");
				prefs.edit().putString(Const.SOP_PREFS_GLOVE, "0").commit();
			}
			if (checkedId == group.getChildAt(1).getId())
			{
				if (Cmd.isOpen())
				{
					Cmd.exec("setprop sys.glovemode.enabled 1");
				}
				else
				{
					Cmd.execsu("setprop sys.glovemode.enabled 1");
				}
				prefs.edit().putString(Const.SOP_PREFS_GLOVE, "1").commit();
			}

		}
    };


    private android.widget.CompoundButton.OnCheckedChangeListener switch_checkedChangeListener = new android.widget.CompoundButton.OnCheckedChangeListener()
    {

		@Override
		public void onCheckedChanged(CompoundButton buttonView, boolean isChecked)
		{
			prefs.edit().putBoolean(Const.SOP_SERVICE_SETONBOOT, isChecked).commit();
		}
    };


    //===================================== OPTIONS MENU ==========================================

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater)
    {
        int menuResId = R.menu.menu_fragment_2;
        inflater.inflate(menuResId, menu);
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        switch(item.getItemId())
        {
        default:
            return super.onOptionsItemSelected(item);
        }
    }
}
