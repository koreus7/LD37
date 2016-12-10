import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class MainScene extends BaseWorld
{
	public override function begin()
	{
		
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var x = new BaseWorldEntity(HXP.width - 100, G.floorTop - image.height, image);
		add(x);
		
		var oldMan = new OldMan();
		oldMan.x = 30;
		oldMan.y = G.floorTop - oldMan.height  + 20;
		add(oldMan);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
	}
	
	override public function update() 
	{	
		super.update();
	}
	
}