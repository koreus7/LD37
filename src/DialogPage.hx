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

	public function new(x:Float=0, y:Float=0, width:Float, height:Float, text:String) 
	{
		_text = text;
		
		var options = new TextOptions();
		
		options.font = "font/Zorus_Serif.ttf";
        options.size = 14;
		
		_textGraphic = new Text(_text, 0, 0, width, height, options);
				
		super(x, y);
		this.addGraphic(_textGraphic);

		
		setHitbox(width, height );
		
	}
	
}