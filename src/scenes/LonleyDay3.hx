package scenes;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import dialog.DialogNode;
import dialog.DialogTransition;
import dialog.DialogTree;
import dialog.DummySideEffect;
import dialog.DialogTransition;
import dialog.IDialogSideEffect;
/**
 * ...
 * @author Leo
 */
class LonleyDay3 extends BaseWorld
{
	override public function begin() 
	{
		super.begin();
		
			
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var door = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(door);
		
		
		var oldMan = new OldMan();
		oldMan.x = 80;
		oldMan.y = G.floorTop - 64  + 20;
		add(oldMan);
		
		
		var treeImage = new Image("graphics/xmastree.png");
		var tree = new BaseWorldEntity(door.x - 64 - 20, G.floorTop - 128 + 10, treeImage );
		add(tree);
		
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
		
		add(new SceneIntro("Saturday."));
		
		var factory = new MedsTextTreeFactory();
		
		var tree = factory.make([
			"(Nobody visits today, but there’s a letter in the post saying your pension cheque has come through, so you decide to ring up the shops and order everybody’s Christmas presents today. As you go to get the catalogue, you find your pill box placed on top of it.)",
			"(Today’s pills are still in the labelled box.)"
		], 
		"You’ve got to take them every day. Take meds", 
		"(You pop the day’s pills, and wash them down with some tea.)", 
		"The side effects will dampen your good day. Don’t take meds", 
		"(Your mind is your own today, and you don’t want to limit that. You put the pills away without taking them.)",
		[
		"(You flick through the catalogue, double checking your choices, before ringing up and getting everything ordered. It’ll be delivered around the 21st, just in time for Christmas.)"
		], this, new LonleyDay3());
		
		dialogBar.PlayDialogTree(tree);
		
		
	}
	
}