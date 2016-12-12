import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Key;
import scenes.MainScene;
import scenes.TakeMeds;


class Main extends Engine
{
	override public function init()
	{
#if debug
		HXP.console.enable();
		HXP.console.toggleKey = Key.F3;
#end
		HXP.scene = new TakeMeds();
	}

	public static function main() { new Main(); }

}