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
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;


public class Fragment1 extends android.support.v4.app.Fragment
{
    private SharedPreferences prefs;

    private View rootView;

    @SuppressWarnings("unused")
	private com.xdaid.sop.ActivityMain parentActivity;


    public Fragment1()
    {
        // Empty constructor required for fragment subclasses
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
        prefs = getActivity().getSharedPreferences(Const.SOP_PREFERENCES_FILE, Activity.MODE_PRIVATE);

    	rootView = inflater.inflate(R.layout.fragment_1, container, false);
        setHasOptionsMenu(true);

    	parentActivity = (com.xdaid.sop.ActivityMain)getActivity();

        ActionBar actionBar = getActivity().getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);
        //actionBar.setDisplayOptions(ActionBar.DISPLAY_SHOW_CUSTOM);
        //View view = View.inflate(getActivity().getApplicationContext(), R.layout.fragment_1_topbar, null);
        //actionBar.setCustomView(view, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        TextView tv1 = (TextView)rootView.findViewById(R.id.fragment_1_tv1);
		tv1.setGravity(Gravity.CENTER);
		tv1.setText(R.string.fragment_1_label);

		RadioGroup rg1 = (RadioGroup)rootView.findViewById(R.id.fragment_1_rg1);
		rg1.setGravity(Gravity.CENTER);

		RadioButton rb1 = (RadioButton)rootView.findViewById(R.id.fragment_1_rb1);
		rb1.setGravity(Gravity.CENTER);
		rb1.setText(R.string.fragment_1_radio1);

		RadioButton rb2 = (RadioButton)rootView.findViewById(R.id.fragment_1_rb2);
		rb2.setGravity(Gravity.CENTER);
		rb2.setText(R.string.fragment_1_radio2);

		Button bt1 = (Button)rootView.findViewById(R.id.fragment_1_bt1);
		bt1.setGravity(Gravity.CENTER);
		bt1.setText(R.string.fragment_1_button);

		String prop = Cmd.execsh("getprop persist.sys.primarysd");
		if (prop == null) prop = "0";
		if (prop.length() == 0) prop = "0";
		if (prop.equals("0")) rb1.setChecked(true);
		if (prop.equals("1")) rb2.setChecked(true);

		rg1.setOnCheckedChangeListener(radio_checkedChangedListener);
		bt1.setOnClickListener(button_clickListener);

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
					Cmd.exec("setprop persist.sys.primarysd 0");
				}
				else
				{
					Cmd.execsu("setprop persist.sys.primarysd 0");
				}
				prefs.edit().putString(Const.SOP_PREFS_EXTENDEDSD, "0").commit();
			}
			if (checkedId == group.getChildAt(1).getId())
			{
				if (Cmd.isOpen())
				{
					Cmd.exec("setprop persist.sys.primarysd 1");
				}
				else
				{
					Cmd.execsu("setprop persist.sys.primarysd 1");
				}
				prefs.edit().putString(Const.SOP_PREFS_EXTENDEDSD, "1").commit();
			}
		}
    };


    private OnClickListener button_clickListener = new OnClickListener()
    {
		@Override
		public void onClick(View v)
		{
			if (Cmd.isOpen())
			{
				Cmd.exec("reboot");
			}
			else
			{
				Cmd.execsu("reboot");
			}
		}
    };


    //===================================== OPTIONS MENU ==========================================

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater)
    {
        int menuResId = R.menu.menu_fragment_1;
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