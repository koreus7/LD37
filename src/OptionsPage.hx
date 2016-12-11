package;
import com.haxepunk.gui.Button;
import dialog.DialogTransition;
import com.haxepunk.HXP;

/**
 * ...
 * @author Leo
 */
class OptionsPage extends BaseWorldEntity
{
	private var _options: Array <DialogTransition>;
	private var _buttons: Array<Button>;
	private var _chooseCallback: Dynamic;
	
	private static inline var padding = 2;
	
	public function new(width: Int, height: Int, options: Array<DialogTransition>, chooseCallBack: Dynamic)
	{
		_options = options;
		_buttons = new Array<Button>();
		_chooseCallback = chooseCallBack;
		super();
	}
	
	override public function update():Void 
	{
		for (b in _buttons)
		{
			if (this.visible){
				b.show();
			} else {
				b.hide();
			}
		}
		
		super.update();
	}
	
	override public function firstUpdateCallback():Void 
	{
		var currY = y;
		
		for (op in _options)
		{
			var b = new Button(op.GetPlayerSpeech(), x, currY,  0, 20);
			b.color = 0xffffff;
			b.addEventListener(Button.CLICKED, function  (data:Dynamic) {
				_chooseCallback(op);
			});
			_buttons.push(b);
			baseWorld.add(b);
			currY += b.height + padding;
		}
		
		super.firstUpdateCallback();
	}
	
	override public function removed():Void 
	{
		for (b in _buttons)
		{
			baseWorld.remove(b);
		}
		super.removed();
	}
}