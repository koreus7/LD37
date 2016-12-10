import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class MainScene extends BaseWorld
{
	public override function begin()
	{
		var image = new Image("graphics/door.png");
		var x = new BaseWorldEntity(100, 100, image);
		add(x);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
	}
	
	override public function update() 
	{
		
		super.update();
	}
	
}