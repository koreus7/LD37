package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
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
	private var _label: Text;
	private var _text: String;
	public var bAlpha: Float = 1.0;
	public var lAlpha: Float = 0.0;
	
	public function new(text: String)
	{
		P5.reset();
		P5.fill(0);
		P5.rectMode("corner");
		_blackness = P5.rect(0, 0, HXP.width, HXP.height);
		
		var t1 = new VarTween(function(data:Dynamic) {			
			var bt = new VarTween(null, TweenType.OneShot);
			bt.tween(this, "bAlpha", 0.0, 3.0, Ease.quadInOut);
			addTween(bt, true);
			
			var lt = new VarTween(null, TweenType.OneShot);
			lt.tween(this, "lAlpha", 0.0, 3.0, Ease.quadInOut);
			addTween(lt, true);
		
			
		}, TweenType.OneShot);
		t1.tween(this, "lAlpha", 1.0, 2.0, Ease.cubeInOut);
		addTween(t1, true);
		
		_text = text;
		
		_label = new Text(text,0,0,0,0,{
			color: 0xffffff,
			size: 28
		});
		
		addGraphic(_blackness);
		addGraphic(_label);
		super();
		
		
		
		setHitbox(HXP.width, HXP.height);
		this.layer = L.hud;
	}
	
	
	override public function update():Void 
	{
		_blackness.alpha = bAlpha;
		_label.alpha = lAlpha;
		_label.x = halfWidth - _label.width / 2.0;
		_label.y = halfHeight - _label.height / 2.0;
		super.update();
	}
	
	
}