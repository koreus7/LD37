package;
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
class TestEntity extends BaseWorldEntity
{
	
	private function Setup(): DialogTree 
	{
		var transitions = new Array<DialogTransition>();
		
		transitions.push(new DialogTransition(new DummySideEffect(), 3, "Hi Son"));
	    transitions.push(new DialogTransition(new TestSideEffect(), 1, "Hi J"));
	    transitions.push(new DialogTransition(new DummySideEffect(), 2, "Hi K"));
		
		var nodes = new Array<DialogNode>();
		nodes.push(new DialogNode("Hi Dad", [0, 1, 2]));
		nodes.push(new DialogNode("My Name is not J!", []));
		nodes.push(new DialogNode("I'm glad you recognised me", []));
		nodes.push(new DialogNode("Sonny day isn't it ;)", []));
		return new DialogTree(nodes, transitions);
	}
	
	public function Run(): Void
	{
		var t = Setup();
		HXP.log("No side Effect");
		t.ChooseOption(t.GetOptions()[0]);
		
		
		t = Setup();
		HXP.log("Side Effect!");
		t.ChooseOption(t.GetOptions()[1]);
		
		
		t = Setup();
		HXP.log("No side Effect");
		t.ChooseOption(t.GetOptions()[2]);
	}
	
	override public function firstUpdateCallback():Void
	{
		Run();
	}
	
}