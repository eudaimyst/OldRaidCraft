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
			
			add (new SpellButton(GV.CHOSEN_SPELL_1, 1));
			add (new SpellButton(GV.CHOSEN_SPELL_2, 2));
			add (new SpellButton(GV.CHOSEN_SPELL_3, 3));
			add (new SpellButton(GV.CHOSEN_SPELL_4, 4));
			add (new SpellButton(GV.CHOSEN_SPELL_5, 5));
			add (new SpellButton(GV.CHOSEN_SPELL_6, 6));
			add (new SpellButton(GV.CHOSEN_SPELL_7, 7));
			add (new SpellButton(GV.CHOSEN_SPELL_8, 8));

			
			
		}
		
	}

}