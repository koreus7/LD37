package;
import com.haxepunk.Tween;
import com.haxepunk.graphics.Image;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Ease;
import flash.display.BlendMode;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */
class Fog extends BaseWorldEntity
{
	public static var _instance;

	private var _image: Image;
	private var _throwWide:Image;
	private var _throwMedium:Image;
	private var _throwNarrow:Image;
	
	public function new() 
	{
		_instance = this;
		
		this.layer = L.front;
		_image =  new Image("graphics/fog.png");
		
		
		_throwWide = new Image("graphics/wideThrow.png");
		_throwWide.blend = BlendMode.MULTIPLY;
		_throwWide.alpha = 0.66;
		//_throwWide.visible = false;
		
		_throwMedium = new Image("graphics/mediumThrow.png");
		_throwMedium.blend = BlendMode.MULTIPLY;
		_throwMedium.alpha = 0.66;
		//_throwMedium.visible = false;
		
		_throwNarrow = new Image("graphics/narrowThrow.png");
		_throwNarrow.blend = BlendMode.MULTIPLY;
		_throwNarrow.alpha = 0.66;
		//_throwMedium.visible = false;
		
		
		if (G.sanity < 0.3)
		{
			addGraphic(_throwNarrow);
		}
		else if (G.sanity < 0.45 )
		{
			addGraphic(_throwMedium);
		}
		else
		{
			addGraphic(_throwWide);
		}
		
		
		updateAlphaSann();
		addGraphic(_image);
		
		//addGraphic(_throwMedium);
		//
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
	
	public function SetAlpha(val: Float)
	{
		_image.alpha = val;
	}
	
	public function updateAlphaSann()
	{
		_image.alpha = (1.0 - G.sanity) * 0.9;
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