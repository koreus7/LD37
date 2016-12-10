package;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;

/**
 * ...
 * @author Leo
 */
class FirePlace extends BaseWorldEntity
{

	public function new() 
	{
		var fire = new Spritemap("graphics/fire.png", 64, 64);
		var frame = new Image("graphics/fireframe.png");
		var back = new Image("graphics/fireback.png");
		
		fire.add("burn", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11], 10);
		fire.play("burn");
		
		this.addGraphic(back);
		this.addGraphic(fire);
		this.addGraphic(frame);
		
		super();
		
		this.setHitbox(64, 64);
	}
	
}