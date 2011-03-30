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
		
		protected var spellIcon:Image = new Image(GC.GFX_SPELL_ICON_DEATH);
		
		public function Death(i:Number) 
		{
			super(i);
			spellName = "Death";
			castTime = 0;
			spellDamage = 5;
			cooldownTime = 0;
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}