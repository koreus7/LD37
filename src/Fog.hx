package;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Leo
 */
class Fog extends BaseWorldEntity
{

	public function new() 
	{
		var img = new Image("graphics/fog.png");
		img.alpha = 0.2;
		graphic = img;
		super();
	}
	
}