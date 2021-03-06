package;
import com.haxepunk.gui.Button;
import com.haxepunk.HXP;
import scenes.FinalInsanity;
import scenes.FinalSanity;
import scenes.LonleyDay1;
import scenes.LonleyDay3;
import scenes.MichaelVisits;
import scenes.NurseScene;
import scenes.PatrickVisits;

/**
 * ...
 * @author Leo
 */
class DevMenu extends BaseWorldEntity
{

	public function new() 
	{
		super();
	}
	
	override public function firstUpdateCallback():Void 
	{
		super.firstUpdateCallback();
		
		var b = new Button("skip", 0, 0, 100, 50);
		b.addEventListener(Button.CLICKED, function(data: Dynamic) {
			HXP.scene = new FinalInsanity();
		});
		b.layer = L.absoluteFront;
		
		baseWorld.add(b);
		
		var b1 = new Button("skip", 100, 0, 100, 50);
		b1.addEventListener(Button.CLICKED, function(data: Dynamic) {
			HXP.scene = new FinalSanity();
		});
		b1.layer = L.absoluteFront;
		
		baseWorld.add(b1);
	}
	
}