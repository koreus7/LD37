package;
import com.haxepunk.Tween;
import com.haxepunk.graphics.Image;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Ease;

/**
 * ...
 * @author Leo
 */
class Fog extends BaseWorldEntity
{
	public static var _instance;

	private var _image: Image;
	
	public function new() 
	{
		_instance = this;
		_image =  new Image("graphics/fog.png");
		_image.alpha = 0.2;
		graphic = _image;
		super();
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
	public static function GetInstance(): Fog
	{
		return _instance;
	}
	
	public function Flash()
	{
		var t = new VarTween(function(data: Dynamic) {
			var v = new VarTween(null, TweenType.OneShot);
			v.tween(_image, "alpha", 0.2, 1.2, Ease.expoOut);
			this.addTween(v, true);
		}, TweenType.OneShot);
		t.tween(_image, "alpha", 0.4, 0.1, Ease.quadInOut);
		this.addTween(t, true);
	}
	
}