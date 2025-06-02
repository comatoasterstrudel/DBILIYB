package;

class PlayState extends FlxState //god the code for this is awful
{
	var bg:MenuBackground;

	var guy:ButtonSprite;
	var nervoussystem:FlxSprite;

	var clickbrain:ButtonSprite;
	var clickspine:ButtonSprite;

	var peripheralspr:FlxSprite;

	var progress:Int = 0;

	var strokebutton:ButtonSprite;

	var evilstroke:FlxSprite;
	
	var stroke:FlxSprite;
	
	var grateful:FlxSprite;
	
	var text:FlxText;
	
	override public function create()
	{
		super.create();
		bg = new MenuBackground(.1);
		add(bg);

		evilstroke = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xFFFF0000);
		evilstroke.alpha = .5;
		evilstroke.visible = false;
		add(evilstroke);

		guy = new ButtonSprite('assets/images/guyunselected.png', 'assets/images/guyselected.png', function():Void
		{
			if (progress == 0)
			{
				progress++;
				doNervousIntor();
			}
		}, 0, 0);

		guy.screenCenter(X);
		guy.y = 50;
		add(guy);

		stroke = new FlxSprite();
		stroke.frames = FlxAtlasFrames.fromSparrow('assets/images/stroke.png', 'assets/images/stroke.xml');
		stroke.animation.addByPrefix('idle', 'stroke idle', 10);
		stroke.animation.play('idle');
		stroke.setPosition(guy.x, guy.y);
		stroke.visible = false;
		add(stroke);
		
		nervoussystem = new FlxSprite().loadGraphic('assets/images/nervoussystem.png');
		nervoussystem.setPosition(guy.x, guy.y);
		nervoussystem.alpha = 0;
		add(nervoussystem);

		clickbrain = new ButtonSprite('assets/images/nervoussystem.png', 'assets/images/brain_yes.png', function():Void
		{
			if (progress == 2)
			{
				doBranFun();
			}
		}, nervoussystem.x, nervoussystem.y);
		clickbrain.visible = false;
		clickbrain.selectable = false;
		add(clickbrain);

		clickspine = new ButtonSprite('assets/images/nervoussystem.png', 'assets/images/cord_yes.png', function():Void
		{
			if (progress == 3)
			{
				doSpineFun();
			}
		}, nervoussystem.x, nervoussystem.y);
		clickspine.visible = false;
		clickspine.selectable = false;
		add(clickspine);

		peripheralspr = new FlxSprite().loadGraphic('assets/images/peripheral.png');
		peripheralspr.setPosition(guy.x, guy.y);
		peripheralspr.alpha = 0;
		add(peripheralspr);
				
		DialogueBox.open = true;

		new FlxTimer().start(1, function(f):Void
		{
			add(new DialogueBox(Main.tongue.get("$BEGINNING_1"), function():Void
			{
				add(new DialogueBox(Main.tongue.get("$BEGINNING_2"), function():Void
				{
					add(new DialogueBox(Main.tongue.get("$BEGINNING_3"), function():Void
					{
						add(new DialogueBox(Main.tongue.get("$BEGINNING_4"), function():Void
						{
							add(new DialogueBox(Main.tongue.get("$BEGINNING_5"), function():Void {}, 200, 200));
						}, 100, 100));
					}, 50, 57));
				}, 200, 200));
			}, 100, 100));
		});

		FlxG.sound.playMusic('assets/music/Vibing Over Venus' + Main.getMusicExtension());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new TitleState());
		}
	}
	function doNervousIntor():Void
	{
		guy.selectable = false;

		FlxTween.tween(nervoussystem, {alpha: 1}, 1.0, {
			ease: FlxEase.quartOut,
			onComplete: function(f):Void
			{
				add(new DialogueBox(Main.tongue.get("$NERVOUS_1"), function():Void
				{
					add(new DialogueBox(Main.tongue.get("$NERVOUS_2"), function():Void
					{
						add(new DialogueBox(Main.tongue.get("$NERVOUS_3"), function():Void
						{
							progress++;
							clickbrain.visible = true;
							clickbrain.selectable = true;
						}, 100, 30));
					}, 100, 200));
				}, 100, 100));
			}
		});
	}

	function doBranFun():Void
	{
		clickbrain.visible = false;
		clickbrain.selectable = false;

		add(new DialogueBox(Main.tongue.get("$BRAIN_1"), function():Void
		{
			add(new DialogueBox(Main.tongue.get("$BRAIN_2"), function():Void
			{
				add(new DialogueBox(Main.tongue.get("$BRAIN_3"), function():Void
				{
					progress++;
					clickspine.visible = true;
					clickspine.selectable = true;
				}, 100, 30));
			}, 100, 200));
		}, 100, 100));
	}

	function doSpineFun():Void
	{
		progress++;

		clickspine.visible = false;
		clickspine.selectable = false;

		add(new DialogueBox(Main.tongue.get("$CORD_1"), function():Void
		{
			add(new DialogueBox(Main.tongue.get("$CORD_2"), function():Void
			{
				FlxTween.tween(nervoussystem, {alpha: 0}, 1.0, {
					ease: FlxEase.quartOut,
					onComplete: function(f):Void
					{
						add(new DialogueBox(Main.tongue.get("$NERVOUS_OUTRO_1"), function():Void
						{
							add(new DialogueBox(Main.tongue.get("$NERVOUS_OUTRO_2"), function():Void
							{
								doPeriFun();
							}, 100, 30));
						}, 100, 200));
					}
				});
			}, 100, 200));
		}, 100, 100));
	}

	function doPeriFun():Void
	{
		FlxTween.tween(peripheralspr, {alpha: 1}, 1.0, {
			ease: FlxEase.quartOut,
			onComplete: function(f):Void
			{
				add(new DialogueBox(Main.tongue.get("$PERIPHERAL_1"), function():Void
				{
					add(new DialogueBox(Main.tongue.get("$PERIPHERAL_2"), function():Void
					{
						add(new DialogueBox(Main.tongue.get("$PERIPHERAL_3"), function():Void
						{
							add(new DialogueBox(Main.tongue.get("$PERIPHERAL_4"), function():Void
							{
								add(new DialogueBox(Main.tongue.get("$PERIPHERAL_5"), function():Void
								{
									FlxTween.tween(peripheralspr, {alpha: 0}, 1.0, {
										ease: FlxEase.quartOut,
										onComplete: function(f):Void
										{
											strokeButIntro();
										}
									});
								}, 100, 30));
							}, 100, 200));
						}, 100, 30));
					}, 100, 200));
				}, 100, 100));
			}
		});
	}

	function strokeButIntro():Void
	{
		add(new DialogueBox(Main.tongue.get("$STROKE_BUTTON_1"), function():Void
		{
			strokebutton = new ButtonSprite('assets/images/button_no.png', 'assets/images/button_yes.png', function():Void
			{
				if (progress == 4)
					doStroke();
				else if(progress == 5)
				{
					fixStroke();
				}
			}, 1, 1);
			strokebutton.loadGraphic('assets/images/button_no.png');

			strokebutton.setPosition(20, FlxG.height);
			add(strokebutton);
			strokebutton.selectable = false;

			FlxTween.tween(strokebutton, {y: FlxG.height - 100}, 1.0, {
				onComplete: function(f):Void
				{
					add(new DialogueBox(Main.tongue.get("$STROKE_BUTTON_2"), function():Void
					{
						strokebutton.selectable = true;
					}, 2, 2));
				}
			});
		}, 100, 100));
	}

	function doStroke():Void
	{
		stroke.visible = true;
		
		FlxG.sound.playMusic('assets/music/Controlled Chaos' + Main.getMusicExtension(), .7);
		FlxG.sound.play('assets/sounds/button' + Main.getMusicExtension());

		FlxG.camera.shake();

		strokebutton.selectable = false;

		progress++;

		evilstroke.visible = true;

		new FlxTimer().start(1.5, function(f):Void
		{
			add(new DialogueBox(Main.tongue.get("$STROKE_1"), function():Void {
				add(new DialogueBox(Main.tongue.get("$STROKE_2"), function():Void {
					add(new DialogueBox(Main.tongue.get("$STROKE_3"), function():Void {
						add(new DialogueBox(Main.tongue.get("$STROKE_4"), function():Void {
							add(new DialogueBox(Main.tongue.get("$STROKE_5"), function():Void {
								add(new DialogueBox(Main.tongue.get("$STROKE_6"), function():Void {
									add(new DialogueBox(Main.tongue.get("$STROKE_7"), function():Void {
										add(new DialogueBox(Main.tongue.get("$STROKE_8"), function():Void {
											add(new DialogueBox(Main.tongue.get("$STROKE_9"), function():Void {
												add(new DialogueBox(Main.tongue.get("$STROKE_10"), function():Void {
													add(new DialogueBox(Main.tongue.get("$STROKE_11"), function():Void {
														strokebutton.selectable = true;
													}, 30, 30));
												}, 30, 30));
											}, 30, 30));
										}, 30, 30));
									}, 30, 30));
								}, 30, 30));
							}, 30, 30));
						}, 30, 30));
					}, 30, 30));
				}, 30, 30));
			}, 30, 30));
		});
	}
	
	function fixStroke():Void{
		grateful = new FlxSprite().loadGraphic('assets/images/grateful.png');
		grateful.setPosition(guy.x, guy.y);
		add(grateful);
		
		progress ++;
		
		evilstroke.visible = false;
		stroke.visible = false;
		
		FlxG.sound.playMusic('assets/music/New Friendly' + Main.getMusicExtension());
		FlxG.sound.play('assets/sounds/button' + Main.getMusicExtension());
		
		FlxG.camera.shake();
		
		new FlxTimer().start(.5, function(f):Void
		{
			FlxTween.tween(strokebutton == null ? grateful : strokebutton, {y: FlxG.height}, 1.0, {
				onComplete: function(f):Void
				{
					add(new DialogueBox(Main.tongue.get("$END_1"), function():Void {
						add(new DialogueBox(Main.tongue.get("$END_2"), function():Void {
							add(new DialogueBox(Main.tongue.get("$END_3"), function():Void {
								
								text = new FlxText(FlxG.width, 0, 0, Main.getSources());
								text.setFormat('assets/fonts/papyrus.ttf', 16);
								text.color = 0xFF000000;
								add(text);
								text.screenCenter(Y);
								text.angularVelocity = 200;
								text.immovable = false;
								FlxTween.tween(text, {x: -text.width}, 3, { onComplete: function(d):Void{
									add(new DialogueBox(Main.tongue.get("$END_4"), function():Void {
										add(new DialogueBox(Main.tongue.get("$END_5"), function():Void {
											FlxTween.tween(FlxG.camera, {alpha: 0}, 3, {
												onComplete: function(f):Void
												{
													#if desktop
													Sys.exit(1);
													#end
												}
											});
										}, 100, 100));
									}, 100, 100));	
								}});
							}, 100, 100));
						}, 100, 100));
					}, 100, 100));
				}
			});
		});
	}
}