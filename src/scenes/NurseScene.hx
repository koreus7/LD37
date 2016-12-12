package scenes;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */
class NurseScene extends BaseWorld
{
	override public function begin() 
	{
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var x = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(x);
		
		
		var oldMan = new OldMan();
		oldMan.x = 80;
		oldMan.y = G.floorTop - oldMan.height  + 20;
		add(oldMan);
		
		var fiona = new BaseWorldEntity(oldMan.x + 100, oldMan.y, new Image("graphics/fiona.png"));
		fiona.layer = L.front;
		add(fiona);
		
		
		var fire = new FirePlace();
		fire.x = 120;
		fire.y = G.floorTop - fire.height;
		add(fire);
		
		fire.instantLight();
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		var dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		add(new SceneIntro("Wednesday."));
		
		super.begin();
	}
}