package;
import com.haxepunk.HXP;
/**
 * ...
 * @author Leo
 */
class HXPErrorReporter implements IErrorReporter
{
	public function Log(error: String): Void
	{
		HXP.log("ERROR! !" + error);
	}
	
}