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
		protected var playerHealth:int;
		protected var playerMana:int;
		protected var playerDead:Boolean;
		
		public function Player()
		{
			playerDead = false;
			playerHealth = 800;
			playerMana = 500;
			
			
			GV.PLAYER_HEALTH_CURRENT = playerHealth;
			GV.PLAYER_MANA_CURRENT = playerMana;
			
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.pressed(Key.DIGIT_1))
			{
				GV.PLAYER_HEALTH_CURRENT -= 20;
				trace (GV.PLAYER_HEALTH_CURRENT);
			}
			if (GV.PLAYER_HEALTH_CURRENT <= 0) {
				if (playerDead == false)
				{
					this.world.add (new MenuButton("you died", -1));
					playerDead = true;
				}
				
			}
		}
		
	}

}