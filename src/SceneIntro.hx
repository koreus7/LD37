package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.gui.Label;

/**
 * ...
 * @author Leo
 */
class SceneIntro extends BaseWorldEntity
{
	private var _blackness: Image;
	private var _label: Label;
	private var _text: String;
	
	public function new(text: String)
	{
		P5.fill(0,1); 
		P5.rectMode("corner");
		_blackness = P5.rect(0, 0, HXP.width, HXP.height);
		addGraphic(_blackness);
		_text = text;
		super();
	}
	
	override public function firstUpdateCallback():Void 
	{
		_label = new Label(_text);
		_label.size = 28;
		super.firstUpdateCallback();
	}
	
	override public function update():Void 
	{
		if (_label != null)
		{
			_label.x = width / 2.0 - _label.halfWidth; 
			_label.y = height / 2.0 - _label.halfHeight;
		}
		super.update();
	}
	
	override public function removed():Void 
	{
		baseWorld.remove(_label);
		super.removed();
	}
	
}