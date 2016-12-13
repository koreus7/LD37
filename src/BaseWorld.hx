package ;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import scenes.FinalInsanity;
/**
 * ...
 * @author Leo Mahon
 */
class BaseWorld extends Scene
{

	public function new()
	{
		super();
	}
	
	override public function begin() 
	{
		super.begin();
		add(new DevMenu());
	}
	
	public function decreaseSanity(amount: Float)
	{
		G.sanity -= amount;
		
		if (G.sanity <= 0)
		{
			var out = new SceneOutro(new FinalInsanity());
			add(out);
		}
		G.sanity = Utils.clamp(G.sanity, 0, 1);
		HXP.log(Std.string(G.sanity));
		Fog.GetInstance().updateAlphaSann();
	}
	
	public function increaseSanity(amount: Float)
	{
		G.sanity += amount;
		G.sanity = Utils.clamp(G.sanity, 0, 1);
		HXP.log(Std.string(G.sanity));
		Fog.GetInstance().updateAlphaSann();
	}

}