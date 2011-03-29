package Spells 
{
	import HUD.ActionBarSpell;
	import net.flashpunk.Entity
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image
	import net.flashpunk.graphics.Graphiclist
	import net.flashpunk.graphics.Text
	import Spells.BaseSpell;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Fireball extends BaseSpell
	{
		
		protected var spellIcon:Image = new Image(GC.GFX_SPELL_ICON_FIRE);
		
		
		
		
		public function Fireball(i:Number) 
		{
			super(i);
			spellName = "Fireball";
			castTime = 1.5;
			spellDamage = 100;
			
			
			spellIcon.scale = 2;
			
			
			
			
			spellGraphiclist.add(spellIcon);
			
			graphic = spellGraphiclist;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
		}
		override public function added():void 
		{
			super.added();
			//trace (Spell.spellName);
			
			//x position of this entity is determined by how many of these entities there are

			
		}
		
	}

}