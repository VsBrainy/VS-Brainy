package objects;

import objects.BGSprite;
import shaders.GlitchEffect;

import backend.ClientPrefs;

//non animatable version of BGSprite with GlitchShader put onto it.
//NOTE TO SELF: ADD THIS TO BRAINY ENGINE

class WavyBGSprite extends BGSprite
{
    var glitch:GlitchEffect;

    override public function new(image:String, x:Float = 0, y:Float = 0, ?scrollX:Float = 1, ?scrollY:Float = 1, amplitude:Float = 0.1, frequency:Float = 5, speed:Float = 2.25)
    {
        super(image, x, y, scrollX, scrollY, null, null);

        glitch = new GlitchEffect();
        glitch.amplitude = amplitude;
        glitch.frequency = frequency;
        glitch.speed = speed;

        this.shader = glitch.shader;
    }

    override public function update(elapsed:Float)
    {
        if (!ClientPrefs.data.flashing && !ClientPrefs.data.shaders)
        {
            super.update(elapsed);
            glitch.update(elapsed);
            this.shader = glitch.shader;
        }
    }
}