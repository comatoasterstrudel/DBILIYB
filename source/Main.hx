package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var tongue:FireTongue;
	
	public function new()
	{
		super();
		tongue = new FireTongue();

		tongue.initialize({
			locale: "en-US",
			finishedCallback: function():Void
			{
				addChild(new FlxGame(0, 0, TitleState));
				FlxG.mouse.load('assets/images/cursor.png');
			}
		});
	}

	public static function getMusicExtension():String
	{
		#if html
		return '.mp3';
		#end

		return '.ogg';
	}
	
	public static function getSources():String
	{
		return 'https://kidshealth.org/en/parents/brain-nervous-system.html\nhttps://study.com/academy/lesson/spinal-cord-lesson-for-kids-definition-function.html\n
			https://kidshealth.org/en/parents/central-nervous-system.html\nhttps://www.ncbi.nlm.nih.gov/books/NBK542179/\nhttps://kidshealth.org/en/parents/peripheral-nervous-system.html#:~:text=The%20peripheral%20nervous%20system%20is,system%20form%20the%20nervous%20system.\n
		https://www.hopkinsmedicine.org/health/conditions-and-diseases/stroke\nhttps://www.mayoclinic.org/diseases-conditions/stroke/symptoms-causes/syc-20350113\nhttps://www.cdc.gov/stroke/data-research/facts-stats/index.html\nhttps://www.mayoclinic.org/first-aid/first-aid-stroke/basics/art-20056602\n
		https://www.utmbhealth.com/services/neurology/procedures-conditions/stroke/stroke-facts';
	}
}
