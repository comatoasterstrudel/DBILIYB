package;

class ButtonSprite extends FlxSprite{
    var idlePath:String = '';
    var pressedPath:String = '';
    
    var currentSprite:String = '';
    
    var pressedFunction:Void->Void;
    
    public function new(idlePath:String, pressedPath:String, pressedFunction:Void->Void, x, y):Void{        
        this.idlePath = idlePath;
        this.pressedPath = pressedPath;
        this.pressedFunction = pressedFunction;
        
        super(x, y);
    }
    
    override function update(elapsed:Float):Void{
        super.update(elapsed);
        
        if(FlxG.mouse.overlaps(this, this.camera)){
            if(currentSprite != pressedPath){
                loadGraphic(pressedPath);
                currentSprite = pressedPath;
            }
            
            if(FlxG.mouse.justPressed){
                pressedFunction();
            }
        } else {
            if(currentSprite != idlePath){
                loadGraphic(idlePath);
                currentSprite = idlePath;
            }
        }
    }
}