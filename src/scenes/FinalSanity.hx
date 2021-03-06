package scenes;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import dialog.DialogNode;
import dialog.DialogTransition;
import dialog.DialogTree;
import dialog.DummySideEffect;

/**
 * ...
 * @author Leo
 */
class FinalSanity extends BaseWorld
{
	private var dialogBar: DialogBar;

	override public function begin() 
	{
		super.begin();
		
		super.begin();
		
			
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var door = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(door);
		
		
			
		var oldMan = new BaseWorldEntity(0,0,new Image("graphics/holdingBaby.png"));
		oldMan.x = 80;
		oldMan.y = G.floorTop - 64  + 20;
		add(oldMan);
		
		
		
		var treeImage = new Image("graphics/xmastree.png");
		var tree = new BaseWorldEntity(door.x - 64 - 20, G.floorTop - 128 + 10, treeImage );
		add(tree);
		
		tree.addGraphic(new Image("graphics/xmastreedecs.png"));
		tree.addGraphic(new Image("graphics/family.png"));
		
		
		
		var fire = new FirePlace();
		fire.x = 120;
		fire.y = G.floorTop - fire.height;
		add(fire);
		
		fire.instantLight();
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		add(new SceneIntro("Sunday. "));
		
		Dialog();
	}
	
	private function Dialog()
	{
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		transitions.push(new DialogTransition(new DummySideEffect(), 1, "As pretty as ever, my love. "));
		transitions.push(new DialogTransition(new DummySideEffect(), 1, "Nevermind the tree, where are my presents?"));
		transitions.push(new DialogTransition(new DummySideEffect(), 1, "All it needs is a certain angel on top! "));
		
		nodes.push(new DialogNode(["It’s a week before Christmas, and the kids are playing by the tree. Mikey and Niamh are decorating it this year, and it looks fantastic, though you can’t help noticing all the chocolates are suspiciously low down…",
		"Niamh turns to you and asks what you think."
		], [0,1,2]));
		
		nodes.push(new DialogNode(["Niamh giggles and beams at you. Young Niamh looks so like her grandmother, you can’t help but see why Mikey named her after your wife.",
		"The day passes in a blur, and you miss most of it. Having Mikey’s family here helps take your mind off things, and you manage to enjoy some of the festive cheer. However, you feel melancholy, missing your Niamh, and knowing things won’t ever be the same without her."
		], []));
		
		
		var tree = new DialogTree(nodes, transitions);
		dialogBar.PlayDialogTree(tree);
	}
	
}