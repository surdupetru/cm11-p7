package com.xdaid.sop;

import java.util.ArrayList;
import java.util.Locale;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewPager;
import android.support.v4.widget.DrawerLayout;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


public class ActivityMain extends FragmentActivity
{
	private String[] fragmentTags = new String[]
	{
		Const.TAG_FRAGMENT_INFO,
		Const.TAG_FRAGMENT_STORAGE,
		Const.TAG_FRAGMENT_GLOVE,
		Const.TAG_FRAGMENT_SCREEN,
	};

	/**
	 * The {@link android.support.v4.view.PagerAdapter} that will provide
	 * fragments for each of the sections. We use a
	 * {@link android.support.v4.app.FragmentPagerAdapter} derivative, which
	 * will keep every loaded fragment in memory. If this becomes too memory
	 * intensive, it may be best to switch to a
	 * {@link android.support.v4.app.FragmentStatePagerAdapter}.
	 */
	private SectionsPagerAdapter mSectionsPagerAdapter;

	/**
	 * The {@link ViewPager} that will host the section contents.
	 */
	ViewPager mViewPager;

    public DrawerLayout navDrawerLayout;
    private ActionBarDrawerToggle navDrawerToggle;
    private CharSequence navDrawerTitle;
    private ListView navDrawerList;

    public CharSequence mTitle;

    final Handler mHandler = new Handler(Looper.getMainLooper());


	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		// Create the adapter that will return a fragment for each of the three primary sections of the app
		mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());
		// Set up the ViewPager with the sections adapter
		mViewPager = (ViewPager) findViewById(R.id.pager);
		mViewPager.setAdapter(mSectionsPagerAdapter);

        mTitle = navDrawerTitle = getTitle();

        navDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        navDrawerLayout.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START);
        navDrawerToggle = new ActionBarDrawerToggle(this, navDrawerLayout, R.drawable.ic_drawer, R.string.drawer_open, R.string.drawer_close)
        {
            public void onDrawerOpened(View drawerView)
            {
            	getActionBar().setTitle(navDrawerTitle);
            }
            public void onDrawerClosed(View view)
            {
            	getActionBar().setTitle(mTitle);
            	invalidateOptionsMenu();
            }
        };
        navDrawerLayout.setDrawerListener(navDrawerToggle);

        navLoadData();

        Cmd.open(true);
	}


	@Override
    public void onDestroy()
	{
		super.onDestroy();
		Cmd.close();
	}


	//===================================== OPTIONS MENU ===========================================

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		// Inflate the menu; this adds items to the action bar if it is present
		getMenuInflater().inflate(R.menu.menu_main, menu);
		return true;
	}


	@Override
    public boolean onPrepareOptionsMenu(Menu menu)
    {
        boolean isDrawerOpen = navDrawerLayout.isDrawerOpen(navDrawerList);
        for (int i = 0; i < menu.size(); i++) { menu.getItem(i).setVisible(!isDrawerOpen); }
        return super.onPrepareOptionsMenu(menu);
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        if (navDrawerToggle.onOptionsItemSelected(item))
        {
            return true;
        }
        switch(item.getItemId())
        {
        case R.id.action_exit:
        	exit();
            return true;
        default:
            return super.onOptionsItemSelected(item);
        }
    }


    public void exit()
    {
    	finish();
    }


    //===================================== VIEW PAGER =============================================

	/**
	 * A {@link FragmentPagerAdapter} that returns a fragment corresponding to
	 * one of the sections/tabs/pages.
	 */
	public class SectionsPagerAdapter extends FragmentPagerAdapter
	{
		public SectionsPagerAdapter(FragmentManager fm)
		{
			super(fm);
		}

		@Override
		public android.support.v4.app.Fragment getItem(int position)
		{
			Fragment fragment = getFragmentAt(position);
			return fragment;
		}

		@Override
		public int getCount()
		{
			return fragmentTags.length;
		}

		@Override
		public CharSequence getPageTitle(int position)
		{
	        // update the checked item in the navigation drawer
        	int currentPosition = mViewPager.getCurrentItem();
	        navDrawerList.setItemChecked(currentPosition, true);
			// get page title
			Locale l = Locale.getDefault();
			return fragmentTags[position].toUpperCase(l);
		}
	}


    public Fragment getFragmentAt(int position)
    {
		switch(position)
		{
		case 0: return new Fragment0();
		case 1: return new Fragment1();
		case 2: return new Fragment2();
		case 3: return new Fragment3();
		}
		return null;
    }


    public int getFragmentIndex(Fragment fragment)
    {
		if (fragment instanceof Fragment0) return 0;
		if (fragment instanceof Fragment1) return 1;
		if (fragment instanceof Fragment2) return 2;
		if (fragment instanceof Fragment3) return 3;
		return 0;
    }


    //===================================== NAVIGATION MENU ========================================

    public void setFragment(String fragmentTag)
    {
    	int position = navGetIndex(fragmentTag);
    	mViewPager.setCurrentItem(position, true);
        invalidateOptionsMenu();
        navDrawerLayout.closeDrawer(navDrawerList);
        navDrawerList.setItemChecked(position, true);
    }


    public ListView.OnItemClickListener navDrawerItemListener = new ListView.OnItemClickListener()
    {

		@Override
		public void onItemClick(AdapterView<?> parent, View view, int position, long id)
        {
        	navSelectItem(position);
        }
    };


    public int navGetIndex(String fragmentTag)
    {
    	int index = fragmentTags.length;
    	while (index > 0)
    	{
    		index--;
    		if ( fragmentTags[index].equals(fragmentTag) ) break;
    	}
        return index;
    }


    public void navSelectItem(int position)
    {
    	if (position == fragmentTags.length)
    	{
    		finish();
    		return;
    	}
    	String fragmentTag = fragmentTags[position];
    	setFragment(fragmentTag);
    }


    public void navLoadData()
    {
        // build the drawer list (fragmentTags[] + "Quit")
    	ArrayList<String> al = new ArrayList<String>();
        for (String tag : fragmentTags) { al.add(tag); }
        al.add("Quit");
    	String[] drawerList = al.toArray(new String[0]);
        // use the list to populate the navigation drawer
    	navDrawerList = (ListView) findViewById(R.id.navigation_drawer_left);
        navDrawerList.setAdapter(new ArrayAdapter<String>(this, R.layout.drawer_list_item, drawerList));
        navDrawerList.setOnItemClickListener(navDrawerItemListener);
    }

}
