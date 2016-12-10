package;
import dialog.IDialogSideEffect;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */

class TestSideEffect implements IDialogSideEffect
{	
	
	public function new()
	{
		
	}
	public function ApplyEffect(): Void {
		HXP.log("Hello World");
	}
}
