package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class WinScreenState extends MusicBeatState
{

	override function create()
	{
		super.create();

        if (!FlxG.sound.music.playing)
        {
            FlxG.sound.playMusic(Paths.music('freakyMenu'));
        }

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('winScreen', 'manic'));
		add(bg);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}