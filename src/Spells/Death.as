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
			spellIcon = new Image(GC.GFX_SPELL_ICON_DEATH);
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}