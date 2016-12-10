package Dialog;

/**
 * ...
 * @author Leo
 */
class DialogNode
{
	private var _options: Array<DialogTransition>;
	private var _text: String;

	public function new(options: Array<DialogTransition>, text: String) 
	{
		_options = options;
		_text = text;
	}
	
	public function GetOptions() : Array<DialogTransition>
	{
		return _options;
	}
	
	public function GetText(): String
	{
		return _text;
	}
}