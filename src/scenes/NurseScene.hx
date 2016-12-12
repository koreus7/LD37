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
class NurseScene extends BaseWorld
{
	private var dialogBar: DialogBar;
	private var treeImage: Image;
	
	override public function begin() 
	{
		add(new BackDrop());
		
		
		var image = new Image("graphics/door.png");
		var door = new BaseWorldEntity(HXP.width - 50 - image.width, G.floorTop - image.height, image);
		add(door);
		
		var oldMan = new BaseWorldEntity(0,0,new Image("graphics/bottleArmChair.png"));
		oldMan.x = 80;
		oldMan.y = G.floorTop - 64  + 20;
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
		
		dialogBar = new DialogBar(0, HXP.height - G.letterBottom, HXP.width, G.letterBottom, null);
		add(dialogBar);
		
		
		add(new SceneIntro("Wednesday."));
		
		FirstDialog();
		
		
		super.begin();
	}
	
	override public function update() 
	{
		super.update();
	}

	public function FirstDialog()
	{
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 1,  "I’m keeping on top of it all."));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.02, this), 2,  "It’s getting harder to manage, I think."));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.02, this), 2,  "I’m working through it."));
		
		var option = 0;
		
		if (sanity < 40)
		{
			option = 1;
		}
		else if (sanity < 60)
		{
			option = 2;
		}
		
		var moveOn = function ()
		{
			var t= new TimerEntity(4.0, function()
			{
				SecondDialog();
			});
			
			add(t);
		}
		
		nodes.push(new DialogNode(["(You and Fiona, your nurse, are sat drinking tea.)", 
		"(You told her you’re losing track of whether or not you’re taking your medicine, and she’s given you a labelled pill box.)",
		"(As you take a long, soothing sip of tea, she looks at her file and gently asks you a few more questions.)",
		"Fiona: How are your symptoms? Are you still having more good days than bad days?"], [option]));
		nodes.push(new DialogNode(["(Fiona looks pleased, and moves quickly on to the next question.)"], [], moveOn));
		nodes.push(new DialogNode(["(Fiona looks concerned, but when you don’t say anything more, she moves on to the next question.)"], [], moveOn));
		
		var tree = new DialogTree(nodes, transitions);
		dialogBar.PlayDialogTree(tree);
	}
	
	public function SecondDialog()
	{
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 1,  "I want one last Christmas at home."));
		transitions.push(new DialogTransition(new SanitySideEffect( 0.02, this), 2,  "And miss out on your lovely company?"));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.04, this), 3,  "I need to be here for Niamh."));
		transitions.push(new DialogTransition(new DynamicSideEffect(function ()
		{
			var out = new SceneOutro( new PatrickVisits() );
			add(out);
		}), 1,  "Fiona Leaves."));
		
		
		var changeTopic = new DialogNode(["(Fiona doesn’t look convinced, so you decide to change the topic.)", 
		"YOU: Do you think you could give me a hand setting up the Christmas tree? I promised Mikey I’d let the little ones decorate it on Sunday, but it’s a bit heavy for me to move this year", 
		"(Fiona helps you move the tree, and the conversation turns to lighter topics; Mikey took baby Noah to get Christened, Fiona got engaged to her partner, and general Christmas plans.",
		"You open a bottle of port, and while Fiona can’t join you for a drink, you pass the rest of your consultation hour joking and laughing freely.",
		"Time Passes"], [3]);
		
		nodes.push(new DialogNode(["Fiona: Are you ready to consider moving towards residential care? I think the regular company could really help you, Trevor.", 
		"(You can tell that, while she’s pushing you towards a decision you don’t want to make, Fiona is genuinely concerned about you being alone this Christmas.)"], [0, 1, 2]));
		nodes.push(Utils.DialogAppend(["(You know you’re going to need extra care soon, but you want to be with your family this Christmas. You give Fiona a reassuring smile so she doesn’t worry.)"], changeTopic));
		nodes.push(Utils.DialogAppend(["(You give Fiona a cheeky grin, but you know you’re going to need extra care soon. You want to be independent and true to yourself while you still can.)"], changeTopic));
		nodes.push(Utils.DialogAppend(["(Fiona looks concerned by this, so you decide to reassure her.)", 
		"YOU: I know the cancer’s getting bad, but I can look after Niamh for one last Christmas"], changeTopic));
		var tree = new DialogTree(nodes, transitions);
		
		
		dialogBar.PlayDialogTree(tree);
	}
}