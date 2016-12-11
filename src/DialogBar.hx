package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.gui.Button;
import com.haxepunk.gui.Carousel;
import com.haxepunk.gui.Label;
import dialog.DialogTree;
import dialog.DialogTransition;
import dialog.DummySideEffect;
import haxe.ds.Option;

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
		
		var trans = new Array<DialogTransition>();
		trans.push(new DialogTransition(new DummySideEffect(), 0, "AAAAA"));
		trans.push(new DialogTransition(new DummySideEffect(), 0, "AbBBBBBBB"));
		trans.push(new DialogTransition(new DummySideEffect(), 0, "CCCCCCCCSCASAC"));
		
		var ops = new OptionsPage(width, height, trans);
		
		ops.x = x;
		ops.y = y;
		
		baseWorld.add(ops);
		
		super.firstUpdateCallback();
	}
	
	override public function removed():Void 
	{
		baseWorld.remove(_border);
		super.removed();
	}
	
}