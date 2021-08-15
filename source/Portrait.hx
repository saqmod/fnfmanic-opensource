package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;

using StringTools;

class Portrait extends FlxSprite
{

    private var refx:Float;
    private var refy:Float;

    private var resize = 0.5;

    private var characters:Array<String> = ["bf", "kiki", "kikiali", "crash", "vesper"];

    var posTween:FlxTween;
    var alphaTween:FlxTween;
	
    public function new(_x:Float, _y:Float, _character:String){

        super(_x, _y);

        defineCharacter(_character);
        setGraphicSize(Std.int(width * resize));
        updateHitbox();
        scrollFactor.set();
        antialiasing = true;

        refx = x;
        refy = y + height;

        playFrame();
        posTween = FlxTween.tween(this, {x: x}, 0.1);
        alphaTween = FlxTween.tween(this, {alpha: alpha}, 0.1);
        hide();

    }

    function defineCharacter(_character){

        _character = characters.contains(_character) ? _character : "bf";
        frames = Paths.getSparrowAtlas(_character + "portraits", "manic");

        switch(_character){

            case "noChar":
                addAnim("default", "noChar instance 1");
            case "bf":
                addAnim("confused", "bfconfused.png");
                addAnim("happy", "bfhappy.png");
                addAnim("smile", "bfsmile.png");
                addAnim("frown", "bffrown.png");
                addAnim("dull", "bfdull.png");
                addAnim("scared", "bfscared.png");
                animation.play("confused");
                resize = 0.2;
            case "kiki":
                addAnim("normal", "kikinormal.png");
                addAnim("curious", "kikicurious.png");
                addAnim("smile", "kikismile.png");
                addAnim("happy", "kikihappy.png");
                animation.play("normal");
                resize = 0.3;
            case "kikiali":
                addAnim("uneasy", "kikialiuneasy.png");
                addAnim("smile", "kikialismile.png");
                addAnim("glance", "kikialiglance.png");
                addAnim("hurt", "kikialihurt.png");
                animation.play("uneasy");
                resize = 0.3;
            case "crash":
                addAnim("fire", "crashfire.png");
                addAnim("normal", "crashnormal.png");
                addAnim("angry", "crashangry.png");
                addAnim("irritated", "crashirritated.png");
                animation.play("normal");
                resize = 0.3;
            case "vesper":
                addAnim("angry", "vesperangry.png");
                animation.play("angry");
                resize = 0.3;
        }

    }
    
    function addAnim(anim:String, prefix:String){
        animation.addByPrefix(anim,prefix, 0, false);
    }    

    public function playFrame(?_frame:String = "default")
    {
        visible = true;
        animation.play(_frame);
        flipX = false;
        updateHitbox();
        x = refx;
        y = refy - height;

    }

    public function hide()
    {
        alphaTween.cancel();
        posTween.cancel();
        alpha = 1;
        visible = false;
    }

}
