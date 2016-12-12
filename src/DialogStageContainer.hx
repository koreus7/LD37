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
	
	public function new(width: Int, height: Int, options: Array<DialogTransition>, texts: Array<String>, optionCallBack: Dynamic) 
	{
		_dialogPages = new Array<DialogPage>();
		
		_optionsPage = new OptionsPage(width, height, options, optionCallBack);
		
		
		for (t in texts)
		{
			_dialogPages.push( new DialogPage(t, width, height) );
		}
		
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
		_prev.visible = false;
		p.visible = true;
	}
	
	public function GoToPreviousPage()
	{
		var p = GetPage(_selectedIndex - 1);
		_prev.visible = false;
		p.visible = true;
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
		_prev.visible = true;
		_optionsPage.visible = false;
		
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