package Game 
{
	import Levels.CameraMover;
	import Levels.GroundLayer;
	import Menu.MenuButton;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.PreRotation;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP
	import net.flashpunk.World
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Player extends Entity 
	{
		protected var playerCurrentHealth:Number;
		protected var playerCurrentMana:Number;
		protected var playerMaxHealth:Number;
		protected var playerMaxMana:Number;
		protected var playerDead:Boolean;
		protected var playerImage:Image;
		static public var playerX:Number; //player x position, accessed by camera function
		static public var playerY:Number; //player y position, accesed by camera function
		protected var movementDelta:Number;
		
		public function Player()
		{
			playerDead = false;
			playerMaxHealth = 1000;
			playerMaxMana = 500;
			playerCurrentHealth = 1000;
			playerCurrentMana = 500;
			
			UpdateHealth();
			
			playerImage = new PreRotation(GC.GFX_PLAYER);
			playerImage.scale = 1;
			graphic = playerImage;
			this.x = FP.screen.width / 2;
			this.y = FP.screen.height - FP.screen.height / 3;
			
			playerImage.centerOrigin();
			
			Input.define("MovePlayer", Key.W, Key.S, Key.A, Key.D); // define the movement keys
		}
		
		public function UpdateHealth():void //function to update the player health and mana (converts numbers to ints and stores in GV)
		{
			GV.PLAYER_HEALTH_CURRENT = int(playerCurrentHealth);
			GV.PLAYER_HEALTH_MAX = int(playerMaxHealth);
			GV.PLAYER_MANA_CURRENT = int(playerCurrentMana);
			GV.PLAYER_MANA_MAX = int(playerMaxMana);
		}
		
		override public function update():void 
		{
			
			
			if (Input.check("MovePlayer")) //send player data to camera mover entity
			{
				CameraMover.moveDistanceX = 0;
				CameraMover.moveDistanceY = 0;
				movementDelta = FP.elapsed * GV.PLAYER_MOVE_SPEED; // speed at which to move the player
				
				if (Input.check(Key.W))
				{
					this.y -= movementDelta;
					CameraMover.moveDistanceY -= movementDelta;
				}
				if (Input.check(Key.S))
				{
					this.y += movementDelta;
					CameraMover.moveDistanceY += movementDelta;
				}
				if (Input.check(Key.A))
				{
					this.x -= movementDelta;
					CameraMover.moveDistanceX -= movementDelta;
				}
				if (Input.check(Key.D))
				{
					this.x += movementDelta;
					CameraMover.moveDistanceX += movementDelta;
				}
				playerX = this.x;
				playerY = this.y;
				CameraMover.playerIsMoving = true;
			}
			else CameraMover.playerIsMoving = false;
			
			super.update();
			
			
			
		}
		
	}

}