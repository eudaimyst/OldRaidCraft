package Game 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Player extends Entity 
	{
		public var playerHealth:int;
		public var playerMana:int;
		
		public function Player()
		{
			playerHealth = 800;
			playerMana = 500;
			
			
			GV.PLAYER_HEALTH_CURRENT = playerHealth;
			GV.PLAYER_MANA_CURRENT = playerMana;
			
		}
		
	}

}