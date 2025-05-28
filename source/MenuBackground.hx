package;

class MenuBackground extends FlxTypedGroup<FlxSprite>
{
    var bg:FlxSprite;
    var gradient:FlxSprite;
    
    public function new(darkness:Float):Void{
        super();
        
        bg = add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xFFFFFFFF));
        gradient = add(new FlxSprite().loadGraphic('assets/images/bg.png'));
        
        FlxTween.tween(gradient.scale, {y: .4}, 5, {type: PINGPONG});
    }
    
    override function update(elapsed:Float){
        super.update(elapsed);
        
        gradient.updateHitbox();
        gradient.y = FlxG.height - gradient.height;
    }
}