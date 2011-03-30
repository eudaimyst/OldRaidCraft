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
		
		protected var spellIcon:Image = new Image(GC.GFX_SPELL_ICON_ARCANE);
		
		public function Arcane(i:Number) 
		{
			super(i);
			spellName = "Arcane";
			castTime = .5;
			spellDamage = 20;
			
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}