package Spells 
{
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Death extends BaseSpell
	{
		
		
		public function Death(i:Number) 
		{
			super(i);
			spellName = "Death";
			castTime = 0;
			spellDamage = 5;
			cooldownTime = 0;
			manaCost = 5;
			spellRange = 6;
			
			spellIconGraphic = GC.GFX_SPELL_ICON_DEATH;
			spellIcon = new Image(spellIconGraphic);
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}