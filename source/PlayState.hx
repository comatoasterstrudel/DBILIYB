package;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		add(new FlxSprite().loadGraphic('assets/images/temp.png'));
		add(new ButtonSprite('assets/images/ph_button.png', 'assets/images/ph_buttonpressed.png', function():Void
		{
			trace('lickin my weiner');
		}, 5, 5));
		FlxG.mouse.load('assets/images/cursor.png');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
