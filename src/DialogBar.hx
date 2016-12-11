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

	public function new(x:Float=0, y:Float=0, graphic:Graphic=null, mask:Mask=null) 
	{
		super(x, y, graphic, mask);
	}
	
	public function PlayDialogTree(tree: DialogTree)
	{
		
	}
	
}