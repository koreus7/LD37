package dialog;

/**
 * ...
 * @author Leo
 */
class DialogTree
{
	var _nodes: Array<DialogNode>;
	var _transitions: Array <DialogTransition>;
	var _currentNodeIndex: Int;
	
	public function new(nodes: Array<DialogNode>, transitions: Array<DialogTransition>) 
	{
		_nodes = nodes;
		_transitions = transitions;
	}
	
	public function ChooseOption(transition: DialogTransition)
	{
		var i = _transitions.indexOf(transition);
		_currentNodeIndex = _transitions[i].DoTransition();
	}
	
	public function GetOptions(): Array<DialogTransition>
	{
		var a = new Array<DialogTransition>();
		var optionsIndicies = _nodes[_currentNodeIndex].GetOptions();
		
		for (i in optionsIndicies)
		{
			a.push(TransitionMap(i));
		}
		
		return a;
	}
	
	public function GetCurrentText() : String
	{
		return _nodes[_currentNodeIndex].GetText();
	}
	
	private function TransitionMap(i: Int): DialogTransition
	{
		return _transitions[i];
	}
	
}