package states.stages;

import states.stages.objects.*;
import states.PlayState;

import flixel.util.FlxColor;

class SkidLand extends BaseStage
{
    override function create()
    {
        super.create();

        var bg:BGSprite = new BGSprite('skys/sky_space', 0, 0, 0.25, 0.25);

        bg.scale.x = 2;
        bg.scale.y = 2;
        bg.updateHitbox();
        bg.screenCenter();

        add(bg);

        //placeholder stuff from now on

        var rainbowGround:BGSprite = new BGSprite('skidsland/rainbowGround', -300, 141);
        rainbowGround.scale.set(2, 2);
        rainbowGround.scrollFactor.set(1, 1);

        add(rainbowGround);
    }
}