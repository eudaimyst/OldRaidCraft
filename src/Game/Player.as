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
			playerMaxHealth = 1000;
			playerMaxMana = 500;
			playerCurrentHealth = 1000;
			playerCurrentMana = 500;
			
			UpdateHealth();
			
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
			super.update();
			if (GV.PLAYER_HEALTH_CURRENT < GV.PLAYER_HEALTH_MAX) //if health is less than the maximum, regenerate
			{
				playerCurrentHealth += .2;
				UpdateHealth();
			}
			
			if (GV.PLAYER_MANA_CURRENT < GV.PLAYER_MANA_MAX) //if mana is less than the maximum, regenerate
			{
				playerCurrentMana += .1;
				UpdateHealth();
			}
			
			
			if (Input.pressed(Key.DIGIT_1)) //if key1 is pressed, remove some health (testing)
			{
				playerCurrentHealth -= 20;
				trace (playerCurrentHealth);
				UpdateHealth();
			}
			
			if (Input.pressed(Key.DIGIT_2)) //if key2 is pressed, remove some mana (testing)
			{
				playerCurrentMana -= 20;
				trace (playerCurrentMana);
				UpdateHealth();
			}
			
			if (playerCurrentHealth <= 0) { //if players health is less than or equal to 0, dead
				if (playerDead == false)
				{
					this.world.add (new MenuButton("you died", -1));
					playerDead = true;
				}
				
			}
		}
		
	}

}