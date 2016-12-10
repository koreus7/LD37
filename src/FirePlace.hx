package;
import com.haxepunk.graphics.Spritemap;

/**
 * ...
 * @author Leo
 */
class FirePlace extends BaseWorldEntity
{

	public function new() 
	{
		var fire = new Spritemap("graphics/fire.png", 64,64);
		
		fire.add("burn", [0, 1, 2, 3, 4], 10);
		fire.play("burn");
		
		this.graphic = fire;
		
		super();
	}
	
}