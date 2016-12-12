package ;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
/**
 * ...
 * @author Leo Mahon
 */
class BaseWorld extends Scene
{

	private var sanity: Float = G.sanity;
	
	public function new()
	{
		super();
	}
	
	public function decreaseSanity(amount: Float)
	{
		sanity -= amount;
		//Fog.GetInstance().Flash();
	}
	
	public function increaseSanity(amount: Float)
	{
		sanity += amount;
	}

}