import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class MainScene extends BaseWorld
{
	public override function begin()
	{
		var image = new Image("graphics/nati.png");
		image.scale = 0.1;
		var x = new BaseWorldEntity(100, 100, image);
		add(x);

	}
}