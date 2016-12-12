package scenes;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.tweens.misc.VarTween;
import dialog.DialogNode;
import dialog.DialogTransition;
import dialog.DialogTree;
import dialog.DummySideEffect;
import dialog.DialogTransition;
import dialog.IDialogSideEffect;
import com.haxepunk.utils.Ease;
import com.haxepunk.Tween.TweenType;

/**
 * ...
 * @author Leo
 */
class PatrickVisits extends BaseWorld
{
	private var dialogBar: DialogBar;
	
	override public function begin() 
	{
		
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var door = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(door);
		
		var patrick = new BaseWorldEntity(door.x - 128 , G.floorTop - 64 + 20, new Image("graphics/patrick.png"));
		patrick.layer = L.front;
		add(patrick);
		
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
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		
		super.begin();
		
		FirstDialog();
	}
	
	public function FirstDialog()
	{
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		transitions.push(new DialogTransition(new SanitySideEffect( -0.05, this), 1,  "She’ll be back any minute, Patrick"));
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 2,  "I miss her too."));
		transitions.push(new DialogTransition(new SanitySideEffect( 0.03, this), 3,  "I have something for you, Spud"));
		
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 4,  "Thanks for coming, Spud."));
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 4,  "I’m sorry, Patrick."));
		
		transitions.push(new DialogTransition(new DynamicSideEffect(function(){
			var out = new SceneOutro(new LonleyDay1());
			add(out);
		}), 4,  "Time Passes"));
		
		
		var drink = new DialogNode(["(Patrick still looks uncomfortable. You offer him a drink, but he declines.)",
		"(You sit in companionable silence for a bit, before Patrick speaks up.)",
		"Patrick: I’ll be round next week to sort presents, Dad. See you then."], [3,4]);
		
		nodes.push(new DialogNode(["(The key scratches in the lock for a little while, before the door finally swings open. A tall, skinny man enters, and slams the door shut behind him.)",
		"Patrick: Hey Dad, it’s me!", 
		"YOU: Alright there, Spud? ", 
		"(You greet Patrick, your youngest son, by his high school nickname. He never really grew up, so he never really grew out of it.)",
		"Patrick leans against the wall by the door, visibly uncomfortable.",
		"Patrick: It’s strange being here without Mum around. I miss the smell of her baking."], [0, 1, 2]));
		nodes.push(Utils.DialogAppend(["Patrick looks at you in disbelief.", "Patrick: Dad, I think you’re confused again. Mum passed last spring.",
		"(You’re shaken at the news, and while you know you’ve heard it before, it feels like you’re finding out for the first time all over again.)"], drink));
		nodes.push(Utils.DialogAppend(["(You sip your tea, looking into the fire.)", "(The silence drags on.)"], drink));
		nodes.push(Utils.DialogAppend(["YOU: I found her old recipe book, and I’ve put it with your presents.", 
		"YOU: She always joked you’d become a baked Spud if you spent anymore time near the ovens."], drink));
		nodes.push(new DialogNode(["YOU: I know it’s hard for you to see me struggling with this, especially since your mother passed, and I really appreciate you coming round to check on your old man.",
		"Patrick says he loves you, and says that it’s hard to be around you when he doesn’t know if you’re really there. You think he’s afraid that it could be inherited, and that he doesn’t like being reminded he could end up like you.",
		"You don’t say anything else, and Patrick leaves, slamming the door as he goes."], [5]));
		
		var tree = new DialogTree(nodes, transitions);
		dialogBar.PlayDialogTree(tree);
	}
}