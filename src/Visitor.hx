package;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Leo
 */
class Visitor extends BaseWorldEntity
{

	public function new() 
	{
		var img = new Image("graphics/man.png");
		
		graphic = img;
		
		super();
		
		setHitbox(img.width, img.height);
	}
	
}