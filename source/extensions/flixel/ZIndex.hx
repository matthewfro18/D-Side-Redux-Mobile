package extensions.flixel;

import flixel.FlxBasic;
import haxe.ds.ObjectMap;

class ZIndex
{
	static final values:ObjectMap<FlxBasic, Int> = new ObjectMap();
	
	public static inline function get(object:FlxBasic):Int
	{
		return values.exists(object) ? values.get(object) : 0;
	}
	
	public static inline function set(object:FlxBasic, value:Int):Int
	{
		values.set(object, value);
		return value;
	}
	
	public static inline function add(object:FlxBasic, value:Int):Int
	{
		return set(object, get(object) + value);
	}
}
