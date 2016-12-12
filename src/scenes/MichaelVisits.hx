package scenes;
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
class MichaelVisits extends BaseWorld
{
	private var mk:Michael;
	private var dialogBar: DialogBar;
	private var fire: FirePlace;

	override public function begin() 
	{
		super.begin();
		
		add(new BackDrop());
		
		var image = new Image("graphics/door.png");
		var door = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(door);
		
		var oldMan = new OldMan();
		oldMan.x = 30;
		oldMan.y = G.floorTop - oldMan.height  + 20;
		add(oldMan);
		
		fire = new FirePlace();
		fire.x = 120;
		fire.y = G.floorTop - fire.height;
		add(fire);
		
		var fog = new Fog();
		add(fog);
		
		var letterBox = new LetterBox(G.letterTop, G.letterBottom);
		add(letterBox);
		
		dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		mk = new Michael();
		
		mk.x = door.x - mk.width -10;
		mk.y = G.floorTop - mk.height + 10;
		
		add(mk);
		
		add(new SceneIntro("Wednesday"));
		
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		
		transitions.push(new DialogTransition(new SanitySideEffect( 0.01, this), 1, "Hello, Michael"));
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 2, "Hi, Spud."));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.04, this), 5, "Hey, Pat."));
		transitions.push(new DialogTransition(new SanitySideEffect( 0.02, this), 3, "Get it, like Mr Potato Head?"));
		transitions.push(new DialogTransition(new SanitySideEffect( 0.05, this), 4, "Come on, meals on wheels, where’s my dinner?"));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.05, this), 5, "As in ‘Potato Patrick’, like we used to call you?"));
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 6, "Oh sorry, you sounded just like your brother..."));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.03, this), 7, "Is it? My how you’ve grown!"));
		//xxx
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 10, "There’s this great chippy down the road, ‘Seaworthies’… "));
		transitions.push(new DialogTransition(new SanitySideEffect( 0.7, this), 11, "You know, I first met your mother…"));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.7, this), 9, "Did you get any for Niamh?"));
		//xxx
		transitions.push(new DialogTransition(new DynamicSideEffect(function ()
		{
			var last = mk.x;
			mk.walkTo(HXP.width + 20, function ()
			{
				StartSecondDialog();
			});
		}), 13, "takes it into the kitchen to plate up." ));
		
		var dinner = new DialogNode(["Anyway, here’s your dinner, I’ll go put it on a plate."], [11]);
		
		
		nodes.push(new DialogNode(["Hi Dad!"], [0,1,2]));
		nodes.push(Utils.DialogAppend(["Michael? I know I’m in a suit, but you don’t have to be so formal, you see."], dinner));
		nodes.push(new DialogNode(["Ehah, Spud, that’s a new one."], [3, 4, 5]));
		nodes.push(Utils.DialogAppend(["Oh, well... Baldness runs in the family you see."], dinner));
		nodes.push(Utils.DialogAppend(["Nice to see you too, Dad."], dinner));	
		nodes.push(new DialogNode(["Er no, Dad, it’s me, Mikey, you see?"], [6, 7]));
		nodes.push(Utils.DialogAppend(["Ah, you see, I used to get that all the time from Auntie Sue"], dinner));
		nodes.push(Utils.DialogAppend(["I stopped growing years ago, Dad…"], dinner));
		nodes.push(new DialogNode(["Anyway, here’s your dinner, I’ll go put it on a plate."], [8,9,10]));
		//xxx
		nodes.push(new DialogNode(["No, Dad. She’s… She’s not joining us tonight, you see."], []));
		nodes.push(new DialogNode(["The chips are dry and the fish is always overdone, but the girl serving it has the loveliest smile. Sweet Irish girl, too, with a gorgeous smile. Reminds me of your mother when she was young..."], []));
		nodes.push(new DialogNode(["… at a chippy called ‘Seaworthies’. She was working the till, and I remember I went back every day just to talk to her again. Eventually, she told me to stop pretending I liked the dreadful fish and take her on a date!"], []));
		nodes.push(new DialogNode(["No, Dad. She’s… She’s not joining us tonight, you see."], []));
		//xxx
		nodes.push(new DialogNode([""], []));
		
		//nodes.push(new DialogNode(["When are you putting up your Christmas tree, by the way? I used to love helping Mum decorate it, you see."], []));
		//nodes.push(new DialogNode(["Oh ok, so you’re asking Fiona to help when she comes for your weekly check up?"], []));
		//nodes.push(new DialogNode(["Ah of course, she’s coming for your weekly check up on Wednesday, isn’t she?"], []));
		//nodes.push(new DialogNode(["Would you mind leaving the decorations for the little ones to do next week?"], []));
		
		var tree = new DialogTree(nodes, transitions);
		dialogBar.PlayDialogTree(tree);
	
	}
	
	private function StartSecondDialog()
	{
		var nodes = new Array<DialogNode>();
		var transitions = new Array<DialogTransition>();
		
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 1, "There’s this great chippy down the road, ‘Seaworthies’… "));
		transitions.push(new DialogTransition(new SanitySideEffect( 0.7, this), 2, "You know, I first met your mother…"));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.7, this), 3, "Did you get any for Niamh?"));
		transitions.push(new DialogTransition(new DynamicSideEffect(function ()
		{
			mk.walkTo(HXP.width - 100, function ()
			{
				StartThirdDialog();
			});
		}), 4, "Mikey comes back into the living room"));
		
		nodes.push(new DialogNode(["The smell of vinegar and fresh fish wafts into the lounge."], [0, 1, 2]));
		nodes.push(new DialogNode(["The chips are dry and the fish is always overdone, but the girl serving it has the loveliest smile. Sweet Irish girl, too, with a gorgeous smile. Reminds me of your mother when she was young..."], [3]));
		nodes.push(new DialogNode(["… at a chippy called ‘Seaworthies’. She was working the till, and I remember I went back every day just to talk to her again. Eventually, she told me to stop pretending I liked the dreadful fish and take her on a date!"], [3]));
		nodes.push(new DialogNode(["*upset* No, Dad. She’s… She’s not joining us tonight, you see."], [3]));
		nodes.push(new DialogNode(["..."], []));
		
		var tree = new DialogTree(nodes, transitions);
		dialogBar.PlayDialogTree(tree);
	}
	
	
	private function StartThirdDialog()
	{
		
		var nodes = new Array<DialogNode>();
		var transitions = new Array<DialogTransition>();
		
		transitions.push(new DialogTransition(new DynamicSideEffect(function() {
			mk.walkTo(fire.x + fire.halfWidth -mk.halfWidth, function ()
			{
				
			});
		}), 3, "Mikey crosses to the fire, feeds it some fresh wood"));
		
		nodes.push(new DialogNode(["*upset* Your dinner’s served, and there’s a pot of tea brewing so it’ll all cool off nicely for when you go eat in a minute, you see."], [0]));
		
		var tree = new DialogTree(nodes, transitions);
		dialogBar.PlayDialogTree(tree);
	}
}