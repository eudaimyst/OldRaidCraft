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
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_1, 1,0,0));//add spell button with spell name, spell actionbar number, and grid location(used for spell select)
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_2, 2,0,0));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_3, 3,0,0));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_4, 4,0,0));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_5, 5,0,0));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_6, 6,0,0));
			
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 1, 1));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 2, 1));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 3, 1));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 4, 1));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 5, 1));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 1, 2));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 2, 2));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 3, 2));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 4, 2));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 5, 2));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 1, 3));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 2, 3));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 3, 3));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 4, 3));
			this.world.add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 5, 3));
			
			this.world.add (new HUD.PlayerUnitFrame());
			super.added();
		}
	}

}