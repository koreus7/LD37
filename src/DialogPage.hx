package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.gui.Label;
/**
 * ...
 * @author Leo
 */
class DialogPage extends BaseWorldEntity
{
	private var _label: Label;
	private var _text: String;

	public function new(text:String, width:Int, height:Int) 
	{
		_text = text;
		super();
		setHitbox(width, height);
		
	}
	
	override public function update():Void 
	{
		if (_label != null)
		{
			_label.visible = this.visible;
		}
		
		super.update();
	}
	
	override public function firstUpdateCallback():Void 
	{
		Label.defaultColor = 0xffffff;
		_label = new Label(_text, x, y, width, height);
		_label.multiline = true;
		baseWorld.add(_label);
		super.firstUpdateCallback();
	}
	
	override public function removed():Void 
	{
		baseWorld.remove(_label);
		super.removed();
	}
}