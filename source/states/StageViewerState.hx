package states;

import states.stages.*;
import backend.MusicBeatState;
import backend.StageData;

class StageViewerState extends MusicBeatState
{
    public var stage:String = "brainysland";
    public var stageData:StageFile;

    override public function new(stage:String)
    {
        this.stage = stage;
        this.stageData = StageData.getStageFile(stage);
        super();
    }

    override function create()
    {
        super.create();

        switch (stage)
		{
			case 'stage': new StageWeek1(); 			//Week 1
			case 'brainysland', 'brainyslandsunset', 'brainyslandnight': new Brainy();
			case 'skidsland': new SkidLand();
		}

        FlxG.camera.zoom = stageData.defaultZoom;
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.pressed.A)
        {
            FlxG.camera.x -= 1;
        }

        if (FlxG.keys.pressed.D)
        {
            FlxG.camera.x += 1;
        }

        if (FlxG.keys.pressed.W)
        {
            FlxG.camera.y -= 1;
        }

        if (FlxG.keys.pressed.S)
        {
            FlxG.camera.y += 1;
        }

        if (FlxG.keys.pressed.Z)
        {
            FlxG.camera.zoom -= 0.1;
        }

        if (FlxG.keys.pressed.X)
        {
            FlxG.camera.zoom += 0.1;
        }

        if (FlxG.keys.justPressed.ESCAPE)
        {
            MusicBeatState.switchState(new MainMenuState());
        }
    }
}