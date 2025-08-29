package states;

import states.PlayState;
import states.PlayState;
import backend.MusicBeatState;
import backend.Song;
import backend.StageData;
import states.PlayState;
import states.stages.*;
import objects.Character;

class CharacterSelectState extends MusicBeatState
{
    var boyfriend:Character;
    var curStage:String = '';

    override function create()
    {
        curStage = PlayState.curStage;

        switch (curStage)
        {
            case 'brainysland', 'brainyslandnight': new Brainy();
            case 'skidsland': new SkidLand();
        }

        var stageData:StageFile = StageData.getStageFile(curStage);

        boyfriend = new Character(stageData.boyfriend[0], stageData.boyfriend[1], 'bf', true);
        startCharacterPos(boyfriend);
        add(boyfriend);

        FlxG.camera.zoom = stageData.defaultZoom;
        FlxG.camera.follow(boyfriend);
    }

    function startCharacterPos(char:Character) {
		char.x += char.positionArray[0];
		char.y += char.positionArray[1];
	}
}