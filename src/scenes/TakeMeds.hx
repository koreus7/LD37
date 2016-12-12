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
		
		fire.instantPutOut();
		
		add(new SceneIntro("Monday"));
		var transitions = new Array<DialogTransition>();
		var nodes = new Array<DialogNode>();
		
		transitions.push(new DialogTransition(new SanitySideEffect(Utils.randSign()*0.05, this), 1, "Take Meds"));
		transitions.push(new DialogTransition(new SanitySideEffect(Utils.randSign() * 0.05, this), 2, "Don't take Meds"));
		transitions.push(new DialogTransition(new SanitySideEffect(0.03, this), 3,  "Some kind of Alzheimers" ));
		transitions.push(new DialogTransition(new SanitySideEffect(0, this), 3, "My memory problems"));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.03, this), 4,  "The doctor just prescribed it"));
		transitions.push(new DialogTransition(new SanitySideEffect( 0, this), 5,  "It’s almost Christmas. "));
		transitions.push(new DialogTransition(new DynamicSideEffect(function (){
			G.fireIsLit = true;
			fire.instantLight();
			decreaseSanity(0.3);
		}), 6,  "You need to light the fire."));
		transitions.push(new DialogTransition(new SanitySideEffect( -0.05, this), 7,  "Somebody’s meant to visit soon."));
		transitions.push(new DialogTransition(new DynamicSideEffect(function (){
			var out = new SceneOutro(new MichaelVisits());
			add(out);
		}), 8,  "Time Passes"));
		
		
		var medsBlurb = "As you put your medicine boxes away, you see your name, Trevor Smythe, printed bellow the name of the drug, \"Memantine\" \n This medicine is for...";
		var medsLinks = [2, 3, 4];
		
		var photoBlurb = "Returning to your chair, you spot your family photo on the mantelpiece, wreathed in mistletoe. \n That reminds you…";
		var photoLinks = [5,6, 7];
		
		var time = "Time Passes";
		
		nodes.push(new DialogNode(["As you place your tea back on the table, you notice your medicine packets lying open. \n You aren't sure if you've taken your medicine today."], [0, 1]));
		nodes.push(new DialogNode(["You out your daily pills and take them with a swig of tea.", medsBlurb], medsLinks));
		nodes.push(new DialogNode(["Deciding not to risk a double dose, you don't take the pills.", medsBlurb], medsLinks));
		nodes.push(new DialogNode(["You have dementia, a form of alzheimer's, and are prone to delusions, confusion and memory loss.", photoBlurb], photoLinks));
		nodes.push(new DialogNode(["You weren’t really listening at the time, but you think she said something about memory loss, or confusion, or something.", photoBlurb], photoLinks));
		nodes.push(new DialogNode(["It’s mid December, and your family are coming to visit this week."], [8]));
		nodes.push(new DialogNode(["You enjoy your tea in front of the nice, hot fire."], [8]));
		nodes.push(new DialogNode(["Your eldest son, Michael, is coming over after work today. "], [8]));
		nodes.push(new DialogNode([" "], []));
		var tree = new DialogTree(nodes, transitions);

		
		dialogBar.PlayDialogTree(tree);
		
		
		
	}
	
}