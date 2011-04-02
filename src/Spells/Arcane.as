package Spells 
{
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Arcane extends BaseSpell
	{
		
		
		public function Arcane(i:Number) 
		{
			super(i);
			spellName = "Arcane";
			castTime = .5;
			spellDamage = 20;
			manaCost = 10;
			spellIcon = new Image(GC.GFX_SPELL_ICON_ARCANE);
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}