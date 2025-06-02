package;

class ButtonSprite extends FlxSprite{
    var idlePath:String = '';
    var pressedPath:String = '';
    
    var currentSprite:String = '';
    
    var pressedFunction:Void->Void;
    
	public var pressed:Bool = false;
    
	public var selectable:Bool = true;
    
    public function new(idlePath:String, pressedPath:String, pressedFunction:Void->Void, x, y):Void{        
        this.idlePath = idlePath;
        this.pressedPath = pressedPath;
        this.pressedFunction = pressedFunction;
        
        super(x, y);
    }
    
    override function update(elapsed:Float):Void{
        super.update(elapsed);
        
		if (selectable
			&& FlxG.mouse.overlaps(this, this.camera)
			&& !DialogueBox.open
			|| FlxG.mouse.overlaps(this, this.camera)
			&& idlePath == 'assets/images/dbox_selected.png')
		{
            if(currentSprite != pressedPath){
                loadGraphic(pressedPath);
                currentSprite = pressedPath;
            }
            
            if(FlxG.mouse.justPressed){
                pressedFunction();
            }
			pressed = true;
        } else {
            if(currentSprite != idlePath){
                loadGraphic(idlePath);
                currentSprite = idlePath;
            }
			pressed = false;
        }
    }
}