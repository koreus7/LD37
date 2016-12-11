package;

import com.haxepunk.Graphic;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
/**
 * ...
 * @author Leo
 */
class DialogPage extends BaseWorldEntity
{
	private var _textGraphic: Text;
	private var _text: String;

	public function new(x:Float=0, y:Float=0, text:String) 
	{
		_text = text;
		
		var options = new TextOptions();
		
		options.font = "font/Zorus_Serif.ttf";
        options.size = 14;
		
		var w: Float = HXP.width * 0.7;
		var h: Float = G.letterBottom * 0.8;
		
		_textGraphic = new Text(_text, 0, 0, w, h, options);
				
		super(x, y);
		this.addGraphic(_textGraphic);

		
		setHitbox(w, h);
		
	}
	
}