package Levels 
{
	import HUD.SpellButton;
	import Menu.MenuButton;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellSelect extends World 
	{
		
		public function SpellSelect() 
		{
			add (new MenuButton("select your spells", -2));
			add (new MenuButton(GC.TEXT_DONE_SPELL_SELECT, 3));
			
			//create grid
			add (new HUD.SpellButton(SPELLS.SPELL_1_NAME, 0, 1, 1));
			add (new HUD.SpellButton(SPELLS.SPELL_2_NAME, 0, 2, 1));
			add (new HUD.SpellButton(SPELLS.SPELL_3_NAME, 0, 3, 1));
			add (new HUD.SpellButton(SPELLS.SPELL_4_NAME, 0, 4, 1));
			add (new HUD.SpellButton(SPELLS.SPELL_5_NAME, 0, 5, 1));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 1, 2));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 2, 2));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 3, 2));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 4, 2));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 5, 2));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 1, 3));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 2, 3));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 3, 3));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 4, 3));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_8, 0, 5, 3));
			
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_1, 1, 0, 0));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_2, 2, 0, 0));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_3, 3, 0, 0));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_4, 4, 0, 0));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_5, 5, 0, 0));
			add (new HUD.SpellButton(GV.CHOSEN_SPELL_6, 6, 0, 0));
			
			
			
		}
		
		override public function begin():void 
		{
			super.begin();
			add (new MouseCursorEntity());
		}
		
	}

}