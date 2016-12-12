package dialog;

/**
 * ...
 * @author Leo
 */
class DialogNode
{
	private var _options: Array<Int>;
	private var _text: Array<String>;

	public function new(text: Array<String>, options: Array<Int>) 
	{
		_options = options;
		_text = text;
	}
	
	public function GetOptions() : Array<Int>
	{
		return _options;
	}
	
	public function GetText(): Array<String>
	{
		return _text;
	}
}