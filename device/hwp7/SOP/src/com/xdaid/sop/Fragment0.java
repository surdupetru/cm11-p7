package com.xdaid.sop;

import android.app.ActionBar;
import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;


public class Fragment0 extends android.support.v4.app.Fragment
{
    private View rootView;

    @SuppressWarnings("unused")
	private com.xdaid.sop.ActivityMain parentActivity;


    public Fragment0()
    {
        // Empty constructor required for fragment subclasses
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
    	rootView = inflater.inflate(R.layout.fragment_0, container, false);
        setHasOptionsMenu(true);

    	parentActivity = (com.xdaid.sop.ActivityMain)getActivity();

        ActionBar actionBar = getActivity().getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);
        //actionBar.setDisplayOptions(ActionBar.DISPLAY_SHOW_CUSTOM);
        //View view = View.inflate(getActivity().getApplicationContext(), R.layout.fragment_0_topbar, null);
        //actionBar.setCustomView(view, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

		TextView tv1 = (TextView)rootView.findViewById(R.id.fragment_0_tv1);
		tv1.setGravity(Gravity.CENTER);
		tv1.setText(R.string.fragment_0_label);

		TextView tv2 = (TextView)rootView.findViewById(R.id.fragment_0_tv2);
		tv2.setGravity(Gravity.CENTER);
		tv2.setText(R.string.fragment_0_text);

		return rootView;
    }


    //===================================== OPTIONS MENU ==========================================

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater)
    {
        int menuResId = R.menu.menu_fragment_0;
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