package;
import com.haxepunk.gui.Button;
import com.haxepunk.HXP;
import scenes.MichaelVisits;

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
		
		var b = new Button("Michael", 0, 0, 100, 50);
		b.addEventListener(Button.CLICKED, function(data: Dynamic) {
			HXP.scene = new MichaelVisits();
		});
		b.layer = L.absoluteFront;
		
		baseWorld.add(b);
	}
	
}