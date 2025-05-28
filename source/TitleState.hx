package;

class TitleState extends FlxState
{
    var bg:MenuBackground;
    var logo:FlxSprite;
    
    var play:ButtonSprite;
    
    var buttonalpha:Float = 1;
    
    override function create()
    {
        bg = new MenuBackground(.1);
        add(bg);
        
        logo = new FlxSprite().loadGraphic('assets/images/logo.png');
        logo.scale.set(.8, .8);
        logo.screenCenter(X);
        logo.y -= 40;
        add(logo);
        
        play = new ButtonSprite('assets/images/start.png', 'assets/images/start.png', function():Void{
            gobyebye();
        }, 1, 350);
        play.screenCenter(X); //?
        add(play);
        
        FlxTween.num(.2, 1, .5, {type: PINGPONG}, function(f:Float):Void{
            if(play.pressed){
                play.alpha = f;
            } else {
                play.alpha = .5;
            }
        });
        
        FlxG.sound.playMusic('assets/music/Sneaky Snitch.ogg');
    }
    
    override function update(elapsed:Float):Void{
        super.update(elapsed);
        
        play.screenCenter(X);
    }
    
    function gobyebye():Void{
        FlxG.switchState(new PlayState());
    }
}