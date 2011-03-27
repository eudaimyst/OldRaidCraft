package HUD 
{
	import Levels.CameraMover;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUDEntity extends Entity 
	{
		static public var movementDeltaX:Number = 0; //used for translating camera movement (static so it works for all entities which extend this entity)
		static public var movementDeltaY:Number = 0;
		
		public function HUDEntity() 
		{
			
		}
		
		override public function update():void 
		{
			if (CameraMover.playerIsMoving == true) //if the player is moving
			{
				this.x += movementDeltaX;
				this.y += movementDeltaY;
			}
			super.update();
		}
		
	}

}