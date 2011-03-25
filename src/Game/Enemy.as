package Game 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Enemy extends Entity 
	{
		protected var enemyCurrentHealth:Number;
		protected var enemyCurrentMana:Number;
		protected var enemyMaxHealth:Number;
		protected var enemyMaxMana:Number;
		protected var enemyDead:Boolean;
		protected var enemyName:String;
		
		public function Enemy(enemyName:String, enemyMaxHealth:Number, enemyMaxMana:Number) 
		{
			enemyDead = false;
			enemyCurrentHealth = enemyMaxHealth;
			enemyCurrentMana = enemyMaxMana;
			trace("enemy added, name: " + enemyName + ", health: " + enemyCurrentHealth + ", mana: " + enemyCurrentMana)
			
		}
		
	}

}