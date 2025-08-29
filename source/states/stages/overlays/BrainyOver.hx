package states.stages.overlays;

import states.stages.overlays.*;
import states.PlayState;

class BrainyOver extends BaseOverlay
{
    override function create()
    {
        super.create();

        if (PlayState.curStage == "brainyslandnight")
		{
            var overlay:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
            overlay.scrollFactor.set();
            overlay.screenCenter();
            overlay.alpha = 0.35;
            
            add(overlay);
		}
    }
}