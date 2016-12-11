package;
import com.haxepunk.graphics.Image;
import flash.geom.Rectangle;

/**
 * ...
 * @author Leo
 */
class RepeatingBorder extends BaseWorldEntity
{
	
	private var _imageLocation: String;
	private var _cornerCutoff: Float;
	private var _imgWidth: Float;
	private var _imgHeight: Float;

	public function new(imageLocation: String, width: Float, height: Float, 
	cornerCutoff: Float ) 
	{
		_imageLocation = imageLocation;
		_cornerCutoff = cornerCutoff;
		_imgWidth = width;
		_imgHeight = height;
		
		var img = new Image(_imageLocation);
		
		var widthToCover = width - 2 * cornerCutoff;
		var heightToCover = height - 2 * cornerCutoff;
		
		var sectionSize = img.width / 2.0 - cornerCutoff;
		
		var widthRepeats: Int = Math.floor(widthToCover / sectionSize);
		var heightRepeats: Int = Math.floor(heightToCover / heightSize);
		
		for (i in 0...widthRepeats)
		{
			var section = GetWidthSection();
			var botSection = GetWidthBottomSection();
			botSection.x = section.x = cornerCutoff + i * sectionSize;
			section.y = 0;
			botSection.y = height - botSection.height;
			addGraphic(section);
			addGraphic(botSection);
		}
		
		for (i in 0...heightRepeats)
		{
			var section = GetHeightSection();
			var rightSection = GetHeightRightSection();
			section.y = rightSection.y = cornerCutoff + i  * sectionSize;
			section.x = 0;
			rightSection.x = width - rightSection.width;
			addGraphic(section);
			addGraphic(rightSection);
		}
		
		var tl = new Image(_imageLocation, 
		new Rectangle(0, 0, _cornerCutoff, _cornerCutoff);
		tl.x = 0;
		tl.y = 0;
		
		var tr = new Image(_imageLocation, 
		new Rectangle(_imgWidth - _cornerCutoff, 0, _cornerCutoff, _cornerCutoff));
		tr.x = width - _cornerCutoff;
		tr.y = 0;
		
		var bl = new Image(_imageLocation,
		new Rectangle(0, _imgHeight -  _cornerCutoff, _cornerCutoff, _cornerCutoff));
		bl.x = 0;
		bl.y = height - _cornerCutoff;
		
		var br = new Image(_imageLocation,
		new Rectangle(_imgWidth - _cornerCutoff, _imgHeight - _cornerCutoff, _cornerCutoff, _cornerCutoff));
		br.x = width - _cornerCutoff;
		br.y = height - _cornerCutoff;
		
		addGraphic(tl);
		addGraphic(tr);
		addGraphic(bl);
		addGraphic(br);
		
	}
	
	private function GetWidthSection(): Image
	{
		var rect = new Rectangle(
		_cornerCutoff, 
		0,
		_imgWidth / 2.0 - _cornerCutoff, 
		_imgHeight / 2.0
		);
		return new Image(_imageLocation, rect);
	}
	
	private function GetWidthBottomSection(): Image
	{
		var rect = new Rectangle(
		_cornerCutoff,
		_imgHeight / 2.0,
		_imgWidth / 2.0 - _cornerCutoff,
		_imgHeight / 2.0
		);
		
		return new Image(_imageLocation, rect);
	}
	
	private function GetHeightSection(): Image
	{
		var rect = new Rectangle(
		0, 
		_cornerCutoff,
		_imgWidth / 2.0,
		_imgHeight / 2.0 - _cornerCutoff)
		return new Image(_imageLocation, rect);
	}
	
	private function GetHeightRightSection(): Image
	{
		var rect = new Rectangle(
		_imgWidth / 2.0,
		_cornerCutoff,
		_imgWidth / 2.0,
		_imgHeight / 2.0 - _cornerCutoff
		);
	}
}