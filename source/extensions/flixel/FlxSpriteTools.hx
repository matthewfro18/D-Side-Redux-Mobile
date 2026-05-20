package extensions.flixel;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import funkin.Paths;

class FlxSpriteTools
{
	public static function loadFromSheet(sprite:FlxSprite, path:String, animName:String, fps:Int = 24, looped:Bool = true):FlxSprite
	{
		sprite.frames = Paths.getAtlasFrames(path);
		sprite.animation.addByPrefix(animName, animName, fps, looped);
		sprite.animation.play(animName);
		if (sprite.animation.curAnim == null || sprite.animation.curAnim.numFrames == 1)
			sprite.active = false;
		return sprite;
	}
	
	public static function loadAtlasFrames(sprite:FlxSprite, frames:FlxAtlasFrames):FlxSprite
	{
		sprite.frames = frames;
		return sprite;
	}
	
	public static function makeScaledGraphic(sprite:FlxSprite, width:Float, height:Float, color:FlxColor = FlxColor.WHITE):FlxSprite
	{
		sprite.makeGraphic(1, 1, color, false, 'solid#${color.toHexString(true, false)}');
		sprite.scale.set(width, height);
		sprite.updateHitbox();
		return sprite;
	}
	
	public static function centerOnObject(sprite:FlxSprite, object:FlxObject, axes:FlxAxes = FlxAxes.XY):FlxSprite
	{
		if (axes.x) sprite.x = object.x + (object.width - sprite.width) / 2;
		if (axes.y) sprite.y = object.y + (object.height - sprite.height) / 2;
		return sprite;
	}
}
