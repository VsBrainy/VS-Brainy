package states.stages;

import objects.WavyBGSprite;

//class to make it easy to add 

class VoidStage extends BaseStage
{
    public var bg:WavyBGSprite;
    
    public var backgroundImage:String;
    public var scrollFactorX:Float = 1;
    public var scrollFactorY:Float = 1;
    public var scaleX:Float = 1;
    public var scaleY:Float = 1;
    public var hideGirlfriend:Bool = false;
    public var amplitude:Float = 0.1;
    public var frequency:Float = 5;
    public var speed:Float = 2.25;

    override public function new(backgroundImage:String, scrollFactorX:Float = 1, scrollFactorY:Float = 1, scaleX:Float = 1, scaleY:Float = 1, hideGirlfriend = false, amplitude:Float = 0.1, frequency:Float = 5, speed:Float = 2.25)
    {
        this.backgroundImage = backgroundImage;
        this.scrollFactorX = scrollFactorX;
        this.scrollFactorY = scrollFactorY;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        this.hideGirlfriend = hideGirlfriend;
        this.amplitude = amplitude;
        this.frequency = frequency;
        this.speed = speed;

        super();
    }

    override function create()
    {
        super.create();

        bg = new WavyBGSprite(backgroundImage, scrollFactorX, scrollFactorY, amplitude, frequency, speed);
        bg.scale.set(scaleX, scaleY);
        bg.screenCenter();
        add(bg);
    }

    override function createPost()
    {
        super.createPost();

        if (hideGirlfriend) gf.visible = false;
    }

    override function update(elapsed:Float)
    {
        bg.updateShader(elapsed);
        super.update(elapsed);
    }
}
