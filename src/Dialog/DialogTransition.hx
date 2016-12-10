package dialog;

/**
 * ...
 * @author Leo
 */
class DialogTransition
{
	private var _sideEffect: IDialogSideEffect;
	private var _playerSpeech: String;
	private var _nextNodeIndex: Int;

	public function new(sideEffect: IDialogSideEffect, nextNode: Int, playerSpeach: String) 
	{
		_sideEffect = sideEffect;
		_nextNodeIndex = nextNode;
		_playerSpeech = playerSpeach;
	}
	
	public function GetPlayerSpeech(): String
	{
		return _playerSpeech;
	}
	
	public function DoTransition(): Int
	{
		_sideEffect.ApplyEffect();
		return _nextNodeIndex;
	}
	
}