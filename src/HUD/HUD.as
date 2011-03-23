package HUD 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUD extends Entity 
	{
		
		
		public function HUD() 
		{
			
		}
		override public function added():void 
		{
			this.world.add (new HUD.SpellButton("fireball", 1));
			this.world.add (new HUD.SpellButton("arcane", 2));
			this.world.add (new HUD.SpellButton("frost", 3));
			this.world.add (new HUD.SpellButton("lightning", 4));
			this.world.add (new HUD.SpellButton("death", 5));
			this.world.add (new HUD.SpellButton("blahblahtest", 6));
			this.world.add (new HUD.SpellButton("", 7));
			this.world.add (new HUD.SpellButton("", 8));
			
			this.world.add (new HUD.PlayerUnitFrame());
			super.added();
		}
	}

}