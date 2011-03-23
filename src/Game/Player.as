package Game 
{
	import Menu.MenuButton;
	import net.flashpunk.Entity;
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
		
		public function Player()
		{
			playerDead = false;
			playerMaxHealth = 800;
			playerMaxMana = 800;
			playerCurrentHealth = 800;
			playerCurrentMana = 500;
			
			GV.PLAYER_HEALTH_MAX = playerMaxHealth;
			GV.PLAYER_MANA_MAX = playerMaxMana;
			GV.PLAYER_HEALTH_CURRENT = playerCurrentHealth;
			GV.PLAYER_MANA_CURRENT = playerCurrentMana;
			
		}
		
		public function UpdateHealth():void
		{
			GV.PLAYER_HEALTH_MAX = int(playerMaxHealth);
			GV.PLAYER_MANA_MAX = int(playerMaxMana);
			GV.PLAYER_HEALTH_CURRENT = int(playerCurrentHealth);
			GV.PLAYER_MANA_CURRENT = int(playerCurrentMana);
		}
		
		override public function update():void 
		{
			super.update();
			if (GV.PLAYER_HEALTH_CURRENT < GV.PLAYER_HEALTH_MAX)
			{
				playerCurrentHealth += .2;
				UpdateHealth();
			}
			
			
			if (Input.pressed(Key.DIGIT_1))
			{
				playerCurrentHealth -= 20;
				trace (playerCurrentHealth);
				UpdateHealth();
			}
			
			if (playerCurrentHealth <= 0) {
				if (playerDead == false)
				{
					this.world.add (new MenuButton("you died", -1));
					playerDead = true;
				}
				
			}
		}
		
	}

}