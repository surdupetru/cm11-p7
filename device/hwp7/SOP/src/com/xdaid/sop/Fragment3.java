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
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;


public class Fragment3 extends android.support.v4.app.Fragment
{
    private SharedPreferences prefs;

    private View rootView;

    @SuppressWarnings("unused")
	private com.xdaid.sop.ActivityMain parentActivity;


    public Fragment3()
    {
        // Empty constructor required for fragment subclasses
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
        prefs = getActivity().getSharedPreferences(Const.SOP_PREFERENCES_FILE, Activity.MODE_PRIVATE);

    	rootView = inflater.inflate(R.layout.fragment_3, container, false);
        setHasOptionsMenu(true);

    	parentActivity = (com.xdaid.sop.ActivityMain)getActivity();

        ActionBar actionBar = getActivity().getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);

        TextView tv1 = (TextView)rootView.findViewById(R.id.fragment_3_tv1);
		tv1.setGravity(Gravity.CENTER);
		tv1.setText(R.string.fragment_3_label);

		RadioGroup rg1 = (RadioGroup)rootView.findViewById(R.id.fragment_3_rg1);
		rg1.setGravity(Gravity.CENTER);

		RadioButton rb1 = (RadioButton)rootView.findViewById(R.id.fragment_3_rb1);
		rb1.setGravity(Gravity.CENTER);
		rb1.setText(R.string.fragment_3_radio1);

		RadioButton rb2 = (RadioButton)rootView.findViewById(R.id.fragment_3_rb2);
		rb2.setGravity(Gravity.CENTER);
		rb2.setText(R.string.fragment_3_radio2);

		Switch sw1 = (Switch)rootView.findViewById(R.id.fragment_3_sw1);
		sw1.setGravity(Gravity.CENTER);
		sw1.setText(R.string.fragment_3_switch);

		String prop = Cmd.execsh("getprop lockscreen.rot_override");
		if (prop == null) prop = "false";
		if (prop.length() == 0) prop = "false";
		if (prop.equalsIgnoreCase("false")) rb1.setChecked(true);
		if (prop.equalsIgnoreCase("true")) rb2.setChecked(true);

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
					Cmd.exec("setprop lockscreen.rot_override false");
				}
				else
				{
					Cmd.execsu("setprop lockscreen.rot_override false");
				}
				Cmd.execsu("setprop lockscreen.rot_override false");
				prefs.edit().putString(Const.SOP_PREFS_SCREEN, "false").commit();
			}
			if (checkedId == group.getChildAt(1).getId())
			{
				if (Cmd.isOpen())
				{
					Cmd.exec("setprop lockscreen.rot_override true");
				}
				else
				{
					Cmd.execsu("setprop lockscreen.rot_override true");
				}
				prefs.edit().putString(Const.SOP_PREFS_SCREEN, "true").commit();
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
        int menuResId = R.menu.menu_fragment_3;
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
