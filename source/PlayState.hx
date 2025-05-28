package;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		add(new FlxSprite().loadGraphic('assets/images/temp.png'));
		add(new ButtonSprite('assets/images/ph_button.png', 'assets/images/ph_buttonpressed.png', function():Void
		{
			// trace('lickin my weiner');
			add(new DialogueBox('uhhh placeholder  text to rtest textbox', function():Void
			{
				add(new DialogueBox('you can chain these btw', function():Void
				{
					add(new DialogueBox('this font is called kg-miss-kindergarten-font..', function():Void
					{
						add(new DialogueBox('ok  .  bye                     .', function():Void {}, 200, 250));
					}, 300, 0));
				}, 100, 250));
			}, 300, 100));
		}, 5, 5));
		FlxG.sound.playMusic('assets/music/Vibing Over Venus.ogg');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new TitleState());
		}
	}
}
