package Dialog;

/**
 * ...
 * @author Leo
 */
class DialogTree
{
	private var _root: DialogNode;
	private var _reporter: IErrorReporter;

	public function new(DialogNode root, IErrorReporter errorReporter) 
	{
		_root = root;
		_reporter = errorReporter;
	}
	
	public function GetRoot(): DialogNode
	{
		return _root;
	}
	
	public function ChooseOption (option: DialogTransition): DialogTree
	{
		var index = _root.GetOptions().indexOf(option);
		
		if (index == -1)
		{
			_reporter.Log("Invalid dialog option");
			return this;
		}
		
		DialogNode nextNode = _root.GetOptions()[index].DoTransition();
		
		return new DialogTree(nextNode, _reporter);
	}
	
}