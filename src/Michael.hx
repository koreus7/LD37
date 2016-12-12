package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Ease;

/**
 * ...
 * @author Leo
 */
class Michael extends BaseWorldEntity
{
	private var _sprite: Spritemap;
	private var _speed: Float = 50.0;
	
	public function new()
	{
		super();
		
		_sprite = new Spritemap("graphics/michael.png", 64, 64);
		
		_sprite.add("shopStand", [0], 10);
		_sprite.add("shopWalk", [4, 5, 6, 7], 10);
		_sprite.add("xmasStand", [1], 10);
		
		this.addGraphic(_sprite);
		
		super();
		
		this.setHitbox(64, 64);
	}
	
	public function walkTo(xPos: Float, callBack: Dynamic=null, finishAnimation:String="shopStand")
	{
		_sprite.flipped = xPos < x;
		
		var t = new VarTween(function(data: Dynamic) {
			_sprite.play("shopStand");
			if (callBack != null)
			{
				callBack();
			}
		}, TweenType.OneShot);
		
		t.tween(this, "x", xPos, Utils.mod(x - xPos)/_speed, Utils.linearEase);
		addTween(t, true);
		
		_sprite.play("shopWalk");
	}
	
}