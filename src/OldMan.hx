package;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Leo
 */
class OldMan extends BaseWorldEntity
{

	public function new() 
	{
		var image = new Image("graphics/armchair.png");
		graphic = image;
		
		super();
		
		this.setHitbox(image.width, image.height);
	}
	
}