package;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;

/**
 * ...
 * @author Leo
 */
class FirePlace extends BaseWorldEntity
{
	private var _fire: Spritemap;
	
	public function new() 
	{
		_fire = new Spritemap("graphics/fire.png", 64, 64);
		var frame = new Image("graphics/fireframe.png");
		var back = new Image("graphics/fireback.png");
		
		_fire.add("burn", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11], 10);
		_fire.play("burn");
		
		this.addGraphic(back);
		this.addGraphic(_fire);
		this.addGraphic(frame);
		
		super();
		
		this.setHitbox(64, 64);
	}
	
	public function instantPutOut()
	{
		_fire.visible = false;
	}
	
}