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
		
		var visitor = new Visitor();
		visitor.x = HXP.width - 100;
		visitor.y = G.floorTop - visitor.height + 20;
		add(visitor);
		
		var fire = new FirePlace();
		fire.x = 100;
		fire.y = G.floorTop - 100;
		add(fire);
		
		var fog = new Fog();
		add(fog);
		
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		var t = new TestEntity();
		add(t);
	}
	
}