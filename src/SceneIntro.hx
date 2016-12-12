package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.gui.Label;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Ease;

/**
 * ...
 * @author Leo
 */
class SceneIntro extends BaseWorldEntity
{
	private var _blackness: Image;
	private var _label: Label;
	private var _text: String;
	public var bAlpha: Float;
	
	public function new(text: String)
	{
		this.layer = L.absoluteFront;
		P5.fill(0,1); 
		P5.rectMode("corner");
		_blackness = P5.rect(0, 0, HXP.width, HXP.height);
		
		var t = new VarTween(null, TweenType.OneShot);
		t.tween(this, "bAlpha", 0.0, 10.0, Ease.quadInOut);
		addTween(t, true);
		
		addGraphic(_blackness);
		_text = text;
		super();
	}
	
	override public function firstUpdateCallback():Void 
	{
		_label.layer = L.absoluteFront;
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
		
		_blackness.alpha = bAlpha;
		_label.alpha = bAlpha;
		super.update();
	}
	
	override public function removed():Void 
	{
		baseWorld.remove(_label);
		super.removed();
	}
	
}