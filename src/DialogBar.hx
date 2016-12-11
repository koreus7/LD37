package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.gui.Button;
import com.haxepunk.gui.Carousel;
import com.haxepunk.gui.Label;
import dialog.DialogTree;
import dialog.DialogNode;
import dialog.DialogTransition;
import com.haxepunk.Entity;
import dialog.DummySideEffect;
import haxe.ds.Option;

/**
 * ...
 * @author Leo
 */
class DialogBar extends BaseWorldEntity
{
	private var _border: RepeatingBorder;
	private var _stageContainer: DialogStageContainer;
	private var _nextButton: Button;
	private var _prevButton: Button;
	private var _tree: DialogTree;
	private static inline var _containerPadding: Int = 10;
	private var _borderWidth: Int = 512;
	private var _borderHeight: Int = 112;
	
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
		
		_nextButton.x = _border.x + _borderWidth -_nextButton.width - 10;
		_prevButton.x = _border.x + 10;
		_nextButton.y = _prevButton.y = _border.y + _borderHeight - _nextButton.height - 10;
		
		_stageContainer.x = _border.x + _containerPadding;
		_stageContainer.y = _border.y + _containerPadding;
		
	}
	
	override public function firstUpdateCallback():Void 
	{
				
		_border = new RepeatingBorder("graphics/border.png", _borderWidth, _borderHeight, 6);
		baseWorld.add(_border);
		
		
		var transitions = new Array<DialogTransition>();
		transitions.push(new DialogTransition(new DummySideEffect(), 3, "Hi Son"));
	    transitions.push(new DialogTransition(new TestSideEffect(), 1, "Hi J"));
	    transitions.push(new DialogTransition(new DummySideEffect(), 2, "Hi K"));
		
		var nodes = new Array<DialogNode>();
		nodes.push(new DialogNode("Hi Dad", [0, 1, 2]));
		nodes.push(new DialogNode("My Name is not J!", []));
		nodes.push(new DialogNode("I'm glad you recognised me", []));
		nodes.push(new DialogNode("Sonny day isn't it ;)", []));
		
		_tree = new DialogTree(nodes, transitions);
		
		_stageContainer = newStageContainer();
		
		
		_nextButton = new Button(">", 0, 0, 20, 20);
		_prevButton = new Button("<", 0, 0, 20, 20);
		
		_nextButton.addEventListener(Button.CLICKED, function(data: Dynamic) {
			_stageContainer.GoToNextPage();
		});
		
		_prevButton.addEventListener(Button.CLICKED, function(data: Dynamic) {
			_stageContainer.GoToPreviousPage();
		});
		
		_nextButton.color = _prevButton.color = 0xffffff;
		
		baseWorld.add(_nextButton);
		baseWorld.add(_prevButton);
		baseWorld.add(_stageContainer);
		super.firstUpdateCallback();
	}
	
	override public function removed():Void 
	{
		baseWorld.remove(_border);
		super.removed();
	}
	
	private function newStageContainer(): DialogStageContainer
	{
		return new DialogStageContainer(_borderWidth - _containerPadding, _borderHeight - _containerPadding, _tree.GetOptions(), _tree.GetCurrentText(), function (data: Dynamic)
		{
			var op = cast(data, DialogTransition);
			_tree.ChooseOption(op);
			baseWorld.remove(_stageContainer);
			_stageContainer = newStageContainer();
			baseWorld.add(_stageContainer);
		});
	}
}