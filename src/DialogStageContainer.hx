package;
import com.haxepunk.Entity;
import dialog.DialogNode;
import dialog.DialogTree;
import dialog.DialogTransition;
import com.haxepunk.HXP;
import dialog.DummySideEffect;

/**
 * ...
 * @author Leo
 */
class DialogStageContainer extends BaseWorldEntity
{
	
	private var _dialogPages: Array<DialogPage>;
	private var _optionsPage: OptionsPage;
	private var _prev: BaseWorldEntity;
	private var _selectedIndex: Int = 0;
	private static inline var MaxChars = 1024;
	
	public function new(width: Int, height: Int, options: Array<DialogTransition>, text: String, optionCallBack: Dynamic) 
	{
		_dialogPages = new Array<DialogPage>();
		
		var trans = new Array<DialogTransition>();
		trans.push(new DialogTransition(new DummySideEffect(), 0, "jdskjf2"));
		trans.push(new DialogTransition(new DummySideEffect(), 0, "dfffffffff"));
		trans.push(new DialogTransition(new DummySideEffect(), 0, "22222222"));
		
		_optionsPage = new OptionsPage(width, height, trans, optionCallBack);
		
		//var dialogString = dialogTree.GetCurrentText();
		//var numChunks: Int = Math.floor(dialogString.length / MaxChars);
		//
		//for (i in 0...numChunks)
		//{
			//var length: Int = i == numChunks? dialogString.length - i * numChunks : numChunks;
			//_dialogPages.push( new DialogPage(dialogString.substr(i * numChunks, length ), width, height) );
		//}
		//
		
		_dialogPages.push(new DialogPage("Hello", width, height));
		_dialogPages.push(new DialogPage("Wold", width, height));
		_dialogPages.push(new DialogPage("sdfsdfdfdsfsd", width, height));
		_prev = _dialogPages[0];
		
		super();
		
		setHitbox(width, height);
	}
	
	public function GetPage(index: Int): BaseWorldEntity 
	{
		_prev = _getPage(_selectedIndex);
		return _getPage(index);
	}
	
	private function _getPage(index: Int): BaseWorldEntity
	{	
		if (index >= _dialogPages.length)
		{
			if (index == _dialogPages.length)
			{
				_selectedIndex = index;
				return _optionsPage;
			}
			else 
			{
				_selectedIndex = 0;
				return _dialogPages[_selectedIndex];
			}
		}
		else if (index >= 0)
		{
			_selectedIndex = index;
			return _dialogPages[_selectedIndex];
		}
		else
		{
			_selectedIndex = _dialogPages.length;
			return _optionsPage;
		}
	}
	
	
	public function GoToNextPage()
	{
		var p = GetPage(_selectedIndex + 1);
		_prev.hide();
		p.show();
	}
	
	public function GoToPreviousPage()
	{
		var p = GetPage(_selectedIndex - 1);
		_prev.hide();
		p.show();
	}
	
	override public function removed():Void 
	{
		for (page in _dialogPages)
		{
			baseWorld.remove(page);
		}
		
		baseWorld.remove(_optionsPage);
		super.removed();
	}
	
	override public function firstUpdateCallback():Void 
	{
		for (page in _dialogPages)
		{
			baseWorld.add(page);
			page.hide();
		}
		
		
		baseWorld.add(_optionsPage);
		_prev.show();
		_optionsPage.hide();
		
		super.firstUpdateCallback();
	}
	
	override public function update():Void 
	{
		for (page in _dialogPages)
		{
			page.x = x;
			page.y = y;
		}
		
		_optionsPage.x = x;
		_optionsPage.y = y;
		super.update();
	}
	
}