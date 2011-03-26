package Levels
{
	import Game.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CameraMover extends Entity
	{
		static public var playerIsMoving:Boolean;
		static public var moveDistanceX:Number;
		static public var moveDistanceY:Number;
		
		public function CameraMover():void
		{
			moveDistanceX = 0;
			moveDistanceY = 0;
		}
		
		override public function update():void 
		{
			if (playerIsMoving == true)
			{
				trace ("move camera running");
				FP.camera.y += moveDistanceY;
				FP.camera.x += moveDistanceX;
			}
			
			super.update();
		}
	}

}