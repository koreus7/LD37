package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import dialog.DialogTree;

/**
 * ...
 * @author Leo
 */
class DialogBar extends BaseWorldEntity
{
	private var _border: RepeatingBorder;
	
	public function new(x:Float=0, y:Float=0, width: Int, height: Int) 
	{		
		super(x, y);
		setHitbox(width, height);
	}
	
	public function PlayDialogTree(tree: DialogTree)
	{
		
	}
	
	override public function update():Void 
	{
		super.update();
		
		_border.x = x + width -_border.width - 20;
		_border.y = y + 20;
	}
	
	override public function firstUpdateCallback():Void 
	{
				
		_border = new RepeatingBorder("graphics/border.png", 512, 112, 6);
		baseWorld.add(_border);
		
		super.firstUpdateCallback();
	}
	
	override public function removed():Void 
	{
		baseWorld.remove(_border);
		super.removed();
	}
	
}