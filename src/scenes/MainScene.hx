package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.gui.Button;
import com.haxepunk.gui.Label;
import com.haxepunk.gui.RadioButton;

class MainScene extends BaseWorld
{
	public override function begin()
	{
		
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var x = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(x);
		
		var oldMan = new OldMan();
		oldMan.x = 30;
		oldMan.y = G.floorTop - oldMan.height  + 20;
		add(oldMan);
		
		var fire = new FirePlace();
		fire.x = 120;
		fire.y = G.floorTop - fire.height;
		add(fire);
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		var dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		//var t = new TestEntity();
		//add(t);
	}
	
}