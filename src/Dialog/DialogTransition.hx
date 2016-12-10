package Dialog;

/**
 * ...
 * @author Leo
 */
class DialogTransition
{
	private var _sideEffect: IDialogSideEffect;
	private var _playerSpeech: String;
	private var _nextNode: DialogNode;

	public function new(sideEffect: IDialogSideEffect, nextNode: DialogNode, playerSpeach: String) 
	{
		_sideEffect = sideEffect;
		_nextNode = nextNode;
		_playerSpeech = playerSpeach;
	}
	
	public function GetPlayerSpeech(): String
	{
		return _playerSpeech;
	}
	
	public function DoTransition(): DialogNode
	{
		_sideEffect.ApplyEffect();
		return _nextNode;
	}
	
}