package extensions.flixel;

import flixel.FlxCamera;
import flixel.graphics.tile.FlxGraphicsShader;
import openfl.filters.ShaderFilter;

class FlxCameraTools
{
	public static function addShader(camera:FlxCamera, shader:FlxGraphicsShader):Void
	{
		if (shader == null) return;
		
		final filter = new ShaderFilter(shader);
		camera.filters ??= [];
		camera.filters.push(filter);
	}
	
	public static function removeShader(camera:FlxCamera, shader:FlxGraphicsShader):Bool
	{
		if (camera.filters == null) return false;
		
		for (filter in camera.filters)
		{
			if (filter is ShaderFilter)
			{
				final shaderFilter:ShaderFilter = cast filter;
				if (shaderFilter.shader == shader)
				{
					camera.filters.remove(filter);
					return true;
				}
			}
		}
		
		return false;
	}
}
