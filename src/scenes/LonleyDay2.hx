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
class LonleyDay2 extends BaseWorld
{
	override public function begin() 
	{
		super.begin();
		
			
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var door = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(door);
		
		
		var treeImage = new Image("graphics/xmastree.png");
		var tree = new BaseWorldEntity(door.x - 64 - 20, G.floorTop - 128 + 10, treeImage );
		add(tree);
		
		
		var oldMan = new OldMan();
		oldMan.x = 80;
		oldMan.y = G.floorTop - 64  + 20;
		add(oldMan);
		
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
		
		add(new SceneIntro("Friday."));
		
		var factory = new MedsTextTreeFactory();
		
		var tree = factory.make([
			"(You’re having a bad day. You wake up confused, and it takes you a while to remember where you are. Eventually, you decide to make a cup of tea, sit by the fire, and take your meds.)",
			"(Today’s pills are still in the labelled box.)"
		], 
		"They’ll help in the long run. Take meds", 
		"(Today is a bad day, but you take your medicine and hope tomorrow will be better.)", 
		"They aren’t working. Don’t take meds ", 
		"(You’re fed up of the side effects of the memantine. It’s making you drowsy, anxious and, frankly, it’s got you going to the bathroom more than you’re comfortable with. It isn’t working anyway, so you decide not to take it.)",
		[
		"(Nobody visits you today. You’re not sure if you remember to eat, but you drink plenty of tea.)"
		], this, new LonleyDay3());
		
		dialogBar.PlayDialogTree(tree);
		
		
	}
	
}