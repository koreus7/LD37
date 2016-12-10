package dialog;

/**
 * ...
 * @author Leo
 */
class DialogNode
{
	private var _options: Array<Int>;
	private var _text: String;

	public function new(text: String, options: Array<Int>) 
	{
		_options = options;
		_text = text;
	}
	
	public function GetOptions() : Array<Int>
	{
		return _options;
	}
	
	public function GetText(): String
	{
		return _text;
	}
}