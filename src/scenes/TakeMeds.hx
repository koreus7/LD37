package scenes;
import com.haxepunk.graphics.Image;
import dialog.DialogNode;
import dialog.DialogTransition;
import dialog.DialogTree;
import dialog.DummySideEffect;
import dialog.DialogTransition;
import dialog.IDialogSideEffect;
import com.haxepunk.HXP;
/**
 * ...
 * @author Leo
 */
class TakeMeds extends BaseWorld
{
	
	override public function begin() 
	{
		super.begin();
		
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
		
		
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		if (Utils.coinFlip())
		{
			transitions.push(new DialogTransition(new SanitySideEffect(0.1, this), 2, "Take Medication"));
			transitions.push(new DialogTransition(new SanitySideEffect(-0.1, this), 1, "Don't take Medication"));
			nodes.push(new DialogNode("You can't remember if you took your medication this morning.", [0, 1]));
			nodes.push(new DialogNode("You feel a bit odd", []));
			nodes.push(new DialogNode("You feel like that was a good decision", []));
		}
		else
		{
			fire.instantPutOut();
			transitions.push(new DialogTransition(new SanitySideEffect(-0.1, this), 1, "Take Medication"));
			transitions.push(new DialogTransition(new SanitySideEffect(0.1, this), 2, "Don't take Medication"));
			nodes.push(new DialogNode("You can't remember if you took your medication this morning.", [0, 1]));
			nodes.push(new DialogNode("You feel a bit odd", []));
			nodes.push(new DialogNode("You feel like that was a good decision", []));
		}
		
		var tree = new DialogTree(nodes, transitions);
		
		dialogBar.PlayDialogTree(tree);
		
		add(new SceneIntro("Meds"));
		
	}
	
}