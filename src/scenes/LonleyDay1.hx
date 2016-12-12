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
class LonleyDay1 extends BaseWorld
{
	override public function begin() 
	{
		super.begin();
		
			
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var x = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(x);
		
		
		var chair = new BaseWorldEntity(30, G.floorTop - 64 + 20, new Image("graphics/emptyChair.png"));
		add(chair);
		
		
		
		var fire = new FirePlace();
		fire.x = 120;
		fire.y = G.floorTop - fire.height;
		add(fire);
		
		fire.instantLight();
		
		var man = new BaseWorldEntity(fire.x, fire.y, new Image("graphics/standingOld.png") );
		add(man);
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		var dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		add(new SceneIntro("Tuesday."));
		
		var factory = new MedsTextTreeFactory();
		
		var tree = factory.make([
			"You’re having lunch. You made croque monsieur, just like Niamh taught you. She always was a fantastic cook.",
			"As you put more wood on the fire, you find your medicine boxes on the mantelpiece. You’re not sure why they’re there.",
			"You’re not sure if you’ve taken your medicine today."
		], 
		"Take meds", 
		"You’re worried you might be double dosing, but you can’t risk skipping a day. You take a set of tablets.", 
		"Don’t take meds", 
		"You’re worried you might be double dosing, so you decide not to take the tablets. You wonder how many days you’ve accidentally skipped.",
		[
		"Nobody visits you today. You browse catalogues for Christmas presents in your chair, sipping tea and staying warm by the fire. You note down a few page numbers to order the presents later."
		], this, new NurseScene());
		
		dialogBar.PlayDialogTree(tree);
		
		
	}
	
}