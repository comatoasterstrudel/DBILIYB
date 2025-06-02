package;

class DialogueBox extends FlxTypedGroup<FlxSprite>
{
    var box:FlxSprite;
    var text:FlxText;
    var button:FlxSprite;
    
    var endFunction:Void->Void;
    
	public static var open:Bool = false;
    
    public function new(textstring:String, endFunction:Void->Void, x:Float, y:Float):Void{
        super();
        
        this.endFunction = endFunction;
        
		DialogueBox.open = true;

		box = add(new FlxSprite(x, y).makeGraphic(200, 230, 0xFF000000));
        
        box.scale.set(0, 0);
        
        FlxTween.tween(box.scale, {x: 1, y: 1}, 1.0, {onUpdate: function(f):Void{
            box.updateHitbox();
            box.setPosition(x, y);
        }, onComplete: function(f):Void{
            text = new FlxText(x + 5, y + 5, box.width - 10, textstring, 10);
            text.setFormat('assets/fonts/KgMissKindergarten-9v7j.ttf', 16);
            add(text);
            
            button = new ButtonSprite('assets/images/dbox_selected.png', 'assets/images/dbox_selectedsdsd.png', close, box.x + box.width - 10, box.y + box.height - 10);
            add(button);
        }});
        
		FlxG.sound.play('assets/sounds/slide1' + Main.getMusicExtension(), .5);
    }
    
    function close():Void{
        text.destroy();
        button.destroy();
        
        var x = box.x;
        var y = box.y;
        
        FlxTween.tween(box.scale, {x: 0, y: 0}, 1.0, {onUpdate: function(f):Void{
            box.updateHitbox();
            box.setPosition(x, y);
        }, onComplete: function(f):Void{
				DialogueBox.open = false;
            endFunction();
            destroy();
        }});
        
		FlxG.sound.play('assets/sounds/slide2' + Main.getMusicExtension(), .5);
    }
}