package Game 
{
	import Levels.GroundLayer;
	import Menu.MenuButton;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
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
		protected var movementDelta:Number;
		static public var isMoving:Boolean = false;
		static public var xLoc:Number;
		static public var yLoc:Number;
		
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
			graphic = new Graphiclist(playerImage);
			
			
			x = 400; y = 600; xLoc = x; yLoc = y;
			
			
			FP.camera.x = this.x - FP.screen.width / 2;
			FP.camera.y = this.y - FP.screen.height * 2 / 3;
			
			
			setHitbox (20, 10,-11,-27);
			
			Input.define("MovePlayer", Key.W, Key.S, Key.A, Key.D); // define the movement keys
		}
		
		override public function added():void
		{
			FP.camera.x = x - FP.screen.width / 2;
			FP.camera.y = y - FP.screen.height * 2 / 3;
			
			GV.PLAYER_ENTITY = this as Player; //set global variable player entity to this instance of this enemy
			
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
			if (collide("level", x, y))
			{
				//colliding with level
				trace("collision!");//test
				GV.PLAYER_HEALTH_CURRENT -= 1;
			}
			
			if (Input.check("MovePlayer")) //send player data to camera mover entity
			{
				isMoving = true;
				
				movementDelta = FP.elapsed * GV.PLAYER_MOVE_SPEED; // speed at which to move the player
				
				if (Input.check(Key.W))
				{
					this.y -= movementDelta;
				}
				if (Input.check(Key.S))
				{
					this.y += movementDelta;
				}
				if (Input.check(Key.A))
				{
					this.x -= movementDelta;
				}
				if (Input.check(Key.D))
				{
					this.x += movementDelta;
				}
				FP.camera.x = this.x - FP.screen.width / 2;
				FP.camera.y = this.y - FP.screen.height * 2 / 3;
				xLoc = x; yLoc = y;
			}
			else
			{
				if (isMoving == true) isMoving = false;
			}
			
			super.update();
			
			
			
		}
		
	}

}