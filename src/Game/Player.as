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
			playerHealth = 1000;
			playerMana = 500;
		}
		
	}

}