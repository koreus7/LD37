package;

import dialog.IDialogSideEffect;

/**
 * ...
 * @author Leo
 */
class DynamicSideEffect implements IDialogSideEffect
{
	private var _action: Dynamic;

	public function new(action: Dynamic) 
	{
		_action = action;
	}
	
	
	/* INTERFACE dialog.IDialogSideEffect */
	
	public function ApplyEffect():Void 
	{
		_action();
	}
	
}