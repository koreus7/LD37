package scenes;

/**
 * ...
 * @author Leo
 */
class SonVisit extends BaseWorld
{
	override public function begin() 
	{
				
		var image = new Image("graphics/door.png");
		var x = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
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
		fire.x = 120;
		fire.y = G.floorTop - fire.height;
		add(fire);
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		var dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom);
		add(dialogBar);
		
		super.begin();
	}
}