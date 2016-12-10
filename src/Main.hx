import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Key;


class Main extends Engine
{
	
	public static inline var kScreenWidth:Int = 700;
    public static inline var kScreenHeight:Int = 500;
    public static inline var kFrameRate:Int = 30;

	
    function new()
    {
        super(kScreenWidth, kScreenHeight, kFrameRate, false);
    }
	
	override public function init()
	{
		HXP.console.enable();
		HXP.console.toggleKey = Key.F3;
		HXP.scene = new MainScene();
	}

	public static function main() { new Main(); }

}