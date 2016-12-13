package scenes;
import com.haxepunk.HXP;
/**
 * ...
 * @author Leo
 */
class FinalBuffer extends BaseWorld
{

	public function new() 
	{
		super();
		
		if (G.sanity > 0.4)
		{
			HXP.scene = new FinalSanity();
		}
		else
		{
			HXP.scene = new FinalInsanity();
		}
	}
	
}