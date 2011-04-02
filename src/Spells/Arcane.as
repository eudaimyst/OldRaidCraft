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
			
			spellIconGraphic = GC.GFX_SPELL_ICON_ARCANE;
			spellIcon = new Image(spellIconGraphic);
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}