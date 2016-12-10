package;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Leo
 */
class BackDrop extends BaseWorldEntity
{

	public function new() 
	{
		graphic = new Image("graphics/backdrop.png");
		super();
	}
	
}