package states.stages;
import states.PlayState;
import objects.WavyBGSprite;
class MiniSynth extends BaseStage
{
    var bg:WavyBGSprite;
    var dumbBorder:FlxSprite;

    override function create()
    {
        bg = new WavyBGSprite('minisynth/bg', 0, 0, 0.25, 0.25);
        bg.scale.set(2, 2);
        bg.screenCenter();

        dumbBorder = new FlxSprite();
        add(dumbBorder);

        add(bg);
    }

    override function createPost()
    {
        PlayState.instance.gf.visible = false;

        dumbBorder.makeGraphic(Std.int(PlayState.instance.dad.width + 10), Std.int(PlayState.instance.dad.height + 10), FlxColor.BLACK);
        dumbBorder.x = PlayState.instance.dad.x;
        dumbBorder.y = PlayState.instance.dad.y;
    }

    override function update(elapsed:Float)
    {
        bg.updateShader(elapsed);
        super.update(elapsed);
    }
}