package;
import com.haxepunk.graphics.Image;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Ease;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */
class SceneOutro extends BaseWorldEntity
{
	private var _blackness: Image;
	private var _newScene: BaseWorld;

	public function new(newScene: BaseWorld)
	{
		_newScene = newScene;
		P5.reset();
		P5.fill(0);
		P5.rectMode("corner");
		_blackness = P5.rect(0, 0, HXP.width, HXP.height);
				
		var t = new VarTween(function (data: Dynamic)
		{
			HXP.scene = _newScene;
		}, TweenType.OneShot);
		t.tween(_blackness, "alpha", 1.0, 1.0, Ease.quadInOut);
		addTween(t, true);
		
		addGraphic(_blackness);
		super();
		
		layer = L.absoluteFront;
	}
	
}