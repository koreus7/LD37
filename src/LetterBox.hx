package;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */
class LetterBox extends BaseWorldEntity
{

	public function new(cutTop: Float, cutBottom: Float ) 
	{
		P5.reset();
		P5.fill(0);
		P5.rectMode("corner");
		this.addGraphic(P5.rect(0, 0, HXP.width, cutTop));
		this.addGraphic(P5.rect(0, HXP.height - cutBottom, HXP.width, cutBottom));
		super();
	}
	
}