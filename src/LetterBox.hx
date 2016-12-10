package;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */
class LetterBox extends BaseWorldEntity
{

	public function new() 
	{
		P5.reset();
		P5.fill(0);
		this.graphic = P5.rect(0, 0, HXP.width, 100);
		
		super();
	}
	
}