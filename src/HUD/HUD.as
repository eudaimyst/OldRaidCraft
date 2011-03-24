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
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_1, 1));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_2, 2));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_3, 3));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_4, 4));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_5, 5));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_6, 6));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_7, 7));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 8));
			
			this.world.add (new HUD.PlayerUnitFrame());
			super.added();
		}
	}

}