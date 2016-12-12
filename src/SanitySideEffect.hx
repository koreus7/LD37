package;

import dialog.IDialogSideEffect;

/**
 * ...
 * @author Leo
 */
class SanitySideEffect implements IDialogSideEffect
{
	private var _amount: Float;
	private var _world: BaseWorld;

	public function new(amount: Float, world: BaseWorld) 
	{
		_amount = amount;
		_world = world;
	}
	
	
	/* INTERFACE dialog.IDialogSideEffect */
	
	public function ApplyEffect():Void 
	{
		if (_amount < 0)
		{
			_world.decreaseSanity(_amount);
		}
		else if (_amount > 0)
		{
			_world.increaseSanity(_amount);
		}
	}
	
}