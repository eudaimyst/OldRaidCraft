package Game 
{
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
		protected var radians:Number;
		
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
			this.x = FP.screen.width / 2 - playerImage.width / 2;
			this.y = FP.screen.height - FP.screen.height / 3;
			
			playerImage.centerOrigin();
			
			
			
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
			
			FP.camera.x += ((this.x - FP.screen.width / 2) - FP.camera.x) * 0.1;
			FP.camera.y += ((this.y - FP.screen.height + FP.screen.height / 4) - FP.camera.y) * 0.1;
			
			if (Input.check(Key.W))
			{
				this.y -= FP.elapsed * 40;
			}
			if (Input.check(Key.S))
			{
				this.y += FP.elapsed * 40;
			}
			if (Input.check(Key.A))
			{
				this.x -= FP.elapsed * 40;
			}
			if (Input.check(Key.D))
			{
				this.x += FP.elapsed * 40;
			}
			
			super.update();
			
			
			
		}
		
	}

}