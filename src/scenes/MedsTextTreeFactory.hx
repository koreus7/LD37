package scenes;
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
class MedsTextTreeFactory
{

	public function new() 
	{
		
	}
	
	public function make(intro: Array<String>, x1: String, y1: String, x2:String, y2: String, outro: Array<String>, currentScene: BaseWorld, nextScene:BaseWorld): DialogTree
	{
		var nodes = new Array<DialogNode>();
		var transitions = new Array<DialogTransition>();
		
		transitions.push(new DialogTransition(new SanitySideEffect(Utils.randSign()*0.02, currentScene), 1, x1));
		transitions.push(new DialogTransition(new SanitySideEffect(Utils.randSign()*0.02, currentScene), 2, x2));
		transitions.push(new DialogTransition(new DynamicSideEffect(function ()
		{
			var out = new SceneOutro(nextScene);
			currentScene.add(out);
		}), 2, "Time Passes"));
		
		var final = new DialogNode(outro, [2]);
		
		nodes.push(new DialogNode(intro, [0, 1]));
		nodes.push(Utils.DialogAppend([y1], final));
		nodes.push(Utils.DialogAppend([y2], final));
		
		return new DialogTree(nodes, transitions);
	}
	
}