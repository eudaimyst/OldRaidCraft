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
		static public var moveDistanceX:Number = 0;
		static public var moveDistanceY:Number = 0;
		private var cameraPosX:Number = 0;
		private var cameraPosY:Number = 0;
		
		
		public function CameraMover():void
		{
		}
		
		override public function update():void 
		{
			if (playerIsMoving == true)
			{
				//trace ("move camera running");
				trace(moveDistanceX);
				
				FP.camera.x = Player.playerX - FP.screen.width / 2;
				FP.camera.y = Player.playerY - FP.screen.height * 2 / 3;
				
				//moveDistanceX = FP.camera.x - cameraPosX; 
				//moveDistanceY = FP.camera.y - cameraPosY; 
				
				//cameraPosX = Player.playerX
				//cameraPosY = Player.playerY
				
			}
			
			super.update();
		}
	}

}