package ;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.Tween;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Ease;
import com.haxepunk.Tween.TweenType;


/**
 * ...
 * @author Leo Mahon
 */
class BaseWorldEntity extends Entity
{

	private var baseWorld:BaseWorld;

	private var firstUpdate:Bool;


	public function new(x:Float=0, y:Float=0, graphic:Graphic=null, mask:Mask=null)
	{
		super(x, y, graphic, mask);
		this.layer = L.mid;
		
		firstUpdate = true;

		this.layer = Layers.main;

	}

	override public function update():Void
	{
		super.update();

		if (firstUpdate)
		{
			this.baseWorld = cast(this.scene, BaseWorld);
			firstUpdateCallback();
			firstUpdate = false;
		}
	}

	public function firstUpdateCallback():Void
	{
	}

	public function pos()
	{
		return new Vector2D(this.x, this.y);
	}
	
	public function hide()
	{
		this.visible = false;
	}
	
	public function show()
	{
		this.visible = true;
	}
}