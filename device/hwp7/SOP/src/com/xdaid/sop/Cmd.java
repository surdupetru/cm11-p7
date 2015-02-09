package com.xdaid.sop;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;


public class Cmd
{
	public static String EOF = "*eof*";
    public static String ERR = "*err*";

    private static Process process = null;
    private static DataOutputStream os;	
    private static BufferedReader is;
    private static BufferedReader es;


    public static boolean open(boolean root)
    {
	    boolean res = true;
    	boolean processWasAlreadyOpen = process != null;
		if (!processWasAlreadyOpen) try
		{
			String[] cmdArgs = root ? new String[] { "su" } : new String[] { "sh" };
			process = Runtime.getRuntime().exec(cmdArgs);
			os = new DataOutputStream(process.getOutputStream());
			is = new BufferedReader(new InputStreamReader(process.getInputStream()));
			es = new BufferedReader(new InputStreamReader(process.getErrorStream()));
		}
		catch (Exception e) { res = false; }
		return res;
    }
	

    public static boolean close()
    {
    	boolean res = true;
    	try { os.writeBytes("exit\n"); os.flush(); }
		catch (Exception e) { res = false; }
		try { os.close(); is.close(); es.close(); }
		catch (Exception e) { res = false; }
		try { process.destroy(); }
		catch (Exception e) { res = false; }
	   	process = null;
	   	return res;
    }


	public static boolean isOpen()
	{
		return process != null;
	}


    public static String exec(String command)
    {
        String output = "";
    	String cmd = command.endsWith("\n") ? command : command + "\n";
    	try
     	{
    		os.writeBytes(cmd);
    		os.writeBytes("echo " + EOF + "\n");
    		os.flush();
    		char[] buffer = new char[4096];
    		int esLength = 0;
    		while ( !output.contains(EOF) )
    		{
    			while ( is.ready() )
    			{
    				int read = is.read(buffer, 0, 4096);
    				output = output + new String(buffer, 0, read);
    			}
    			while ( es.ready() )
    			{
    				esLength = esLength + es.read(buffer, 0, 4096);
    			}
    		}
    		if (esLength > 2) return ERR;
    		output = output.substring(0, output.lastIndexOf(EOF)).trim();
    		if (output.length() == 0) output = ""; 
        }
    	catch (Exception e) { }
    	return output;
    }


    public static String execsu(String[] commands)
    {
    	String output = "";
    	try
    	{
    		Process process = Runtime.getRuntime().exec("su");
    		DataOutputStream os = new DataOutputStream(process.getOutputStream());
    		for (String cmd : commands) { os.writeBytes(cmd + "\n"); os.flush(); }
    		os.writeBytes("exit\n");
    		os.flush();
    		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
    		StringBuffer sb = new StringBuffer();
    		char[] buffer = new char[4096];
    		for (int read; (read = br.read(buffer)) > 0; sb.append(buffer, 0, read));
    		br.close();
    		process.waitFor();
    		output = sb.toString().trim();
    	}
    	catch (Exception e) { }
    	return output;
    }


	public static String execsu(String command)
    {
    	String output = "";
    	String cmd = command.endsWith("\n") ? command : command + "\n";
    	try
    	{
    		Process process = Runtime.getRuntime().exec("su");
    		DataOutputStream os = new DataOutputStream(process.getOutputStream());
    		os.writeBytes(cmd + "\n");
    		os.flush();
    		os.writeBytes("exit\n");
    		os.flush();
    		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
    		StringBuffer sb = new StringBuffer();
        	char[] buffer = new char[4096];
        	for (int read; (read = br.read(buffer)) > 0; sb.append(buffer, 0, read));
        	br.close();
        	process.waitFor();
        	output = sb.toString().trim();
    	}
    	catch (Exception e) { }
    	return output;
    }


	public static String execsh(String command)
    {
    	String output = "";
    	String cmd = command.endsWith("\n") ? command : command + "\n";
    	try
    	{
    		Process process = Runtime.getRuntime().exec(cmd);
    		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
    		StringBuffer sb = new StringBuffer();
    		char[] buffer = new char[4096];
    		for (int read; (read = br.read(buffer)) > 0; sb.append(buffer, 0, read));
    		br.close();
    		process.waitFor();
    		output = sb.toString().trim();
    	}
    	catch (Exception e) { }
    	return output;
    }


    public static String getFilePerm(String file)
    {
    	String res = execsh("ls -a -l -d " + file);
    	if (res.length() > 10) return res.substring(1, 10);
    	res = execsh("sh ls -a -l -d " + file);
    	if (res.length() > 10) return res.substring(1, 10);
    	res = execsh("busybox ls -a -l -d " + file);
    	if (res.length() > 10) return res.substring(1, 10);
    	return "rwxrwxrwx";
    }


    public static String numericPermissionString(String permissionString)
    {
    	String[] fields = new String[]{ permissionString.substring(0, 3), permissionString.substring(3, 6), permissionString.substring(6) };
    	String numeric = "";
    	for (String field : fields) 
        {
    		if (field.equals("rwx")) numeric += "7"; else
    		if (field.equals("rw-")) numeric += "6"; else
        	if (field.equals("r-x")) numeric += "5"; else
            if (field.equals("r--")) numeric += "4"; else
            if (field.equals("-wx")) numeric += "3"; else
         	if (field.equals("-w-")) numeric += "2"; else
            if (field.equals("--x")) numeric += "1"; else
            if (field.equals("---")) numeric += "0";
        }
    	return numeric;
    }
}
