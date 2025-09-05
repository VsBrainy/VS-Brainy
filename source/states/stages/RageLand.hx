package states.stages;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

import backend.ClientPrefs;

class RageLand extends BaseStage
{
    var rainbowGround:BGSprite;
    override function create()
    {
        super.create();

        var bg:BGSprite = new BGSprite('skys/sky_space', 0, 0, 0.25, 0.25);

        bg.scale.x = 3;
        bg.scale.y = 3;
        bg.updateHitbox();
        bg.screenCenter();

        add(bg);

        rainbowGround = new BGSprite('skidsland/rainbowGround', 500, 141);
        rainbowGround.scale.set(2, 2);

        add(rainbowGround);
    }

    override function sectionHit()
    {
        if (ClientPrefs.data.flashing)
        {
            if (curSection > 3 && curSection < 92)
            {
                FlxTween.tween(rainbowGround, {color: FlxColor.RED}, 0.25,
                    {
                        ease:       FlxEase.quadInOut,
                        onComplete: setColorBack
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
}