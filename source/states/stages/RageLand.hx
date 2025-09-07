package states.stages;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

import backend.ClientPrefs;

import objects.WavyBGSprite;
class RageLand extends BaseStage
{
    var rainbowGround:BGSprite;
    var bg:BGSprite;

    override function create()
    {
        super.create();

        bg = new BGSprite('skys/sky_space', 0, 0, 0.25, 0.25);

        bg.scale.x = 3;
        bg.scale.y = 3;
        bg.updateHitbox();
        bg.screenCenter();

        add(bg);

        rainbowGround = new BGSprite('skidsland/rainbowGround', 700, 141);
        rainbowGround.scale.set(2, 2);

        add(rainbowGround);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
        bg.update(elapsed);
    }

    override function sectionHit()
    {
        if (ClientPrefs.data.flashing && PlayState.SONG.song.toLowerCase() == "rage03")
        {
            if (curSection > 3 && curSection < 92)
            {
                FlxTween.tween(rainbowGround, {color: FlxColor.RED}, 0.25,
                    {
                        ease:       FlxEase.quadInOut,
                        onComplete: setColorBack
                    }
                );

                FlxTween.tween(bg, {color: FlxColor.RED}, 0.25,
                    {
                        ease:       FlxEase.quadInOut,
                        onComplete: setColorBack2
                    }
                );

                FlxTween.tween(PlayState.instance.dad, {color: FlxColor.RED}, 0.25,
                    {
                        ease:       FlxEase.quadInOut,
                        onComplete: setColorBack3
                    }
                );
            }
        }
    }

    function setColorBack(tween:FlxTween)
    {
        FlxTween.tween(rainbowGround, {color: FlxColor.WHITE}, 0.25,
                {
                    ease:       FlxEase.quadInOut,
                }
            );
    }

    function setColorBack2(tween:FlxTween)
    {
        FlxTween.tween(bg, {color: FlxColor.WHITE}, 0.25,
                {
                    ease:       FlxEase.quadInOut,
                }
            );
    }

    function setColorBack3(tween:FlxTween)
    {
        FlxTween.tween(PlayState.instance.dad, {color: FlxColor.WHITE}, 0.25,
                {
                    ease:       FlxEase.quadInOut,
                }
            );
    }
}