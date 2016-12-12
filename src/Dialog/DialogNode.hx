package dialog;
import com.haxepunk.HXP;
/**
 * ...
 * @author Leo
 */
class DialogNode
{
	private var _options: Array<Int>;
	private var _text: Array<String>;
	private var _action: Dynamic;

	public function new(text: Array<String>, options: Array<Int>, action:Dynamic = null) 
	{
		_action = action;
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
	
	public function GetAction(): Dynamic
	{
		return _action;
	}
	
	public function SetAction(val :Dynamic)
	{
		_action = val;
	}
	
	public function Trigger()
	{
		if (_action != null)
		{
			_action();
		}
	}
}