package com.example.ats;

public class SystemProperties {
	public static final int PROP_NAME_MAX = 31;
	public static final int PROP_VALUE_MAX = 91;
	
	public static native String native_get(String key);
	public static native String native_get(String key, String def);
	public static native int native_get_int(String key, int def);
	public static native long native_get_long(String key, long def);
	public static native boolean native_get_boolean(String key, boolean def);
	public static native void native_set(String key, String def);
	
	public static String get(String key){
		if(key.length() > PROP_NAME_MAX){
			throw new IllegalArgumentException("Key Length is greater than"+PROP_NAME_MAX);
		}
		return native_get(key);
	}
	public static String get(String key, String def){
		if(key.length() > PROP_NAME_MAX){
			throw new IllegalArgumentException("Key Length is greater than"+PROP_NAME_MAX);
		}
		return native_get(key, def);
	}
	public static int getInt(String key, int def){
		if(key.length() > PROP_NAME_MAX){
			throw new IllegalArgumentException("Key Length is greater than"+PROP_NAME_MAX);
		}
		return native_get_int(key, def);
	}
	public static long getLong(String key, long def){
		if(key.length() > PROP_NAME_MAX){
			throw new IllegalArgumentException("Key Length is greater than"+PROP_NAME_MAX);
		}
		return native_get_long(key, def);
	}
	public static boolean getBoolean(String key, boolean def){
		if(key.length() > PROP_NAME_MAX){
			throw new IllegalArgumentException("Key Length is greater than"+PROP_NAME_MAX);
		}
		return native_get_boolean(key,def);
	}
	public static void set(String key, String val){
		if(key.length() > PROP_NAME_MAX){
			throw new IllegalArgumentException("Key Length is greater than"+PROP_NAME_MAX);
		}
		if(val != null && val.length() > PROP_VALUE_MAX){
			throw new IllegalArgumentException("Key Lenght is greater than"+PROP_VALUE_MAX);
		}
		native_set(key, val);
	}
}