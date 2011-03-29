package Spells 
{
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image
	import flash.display.BitmapData
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Fireball extends BaseSpell
	{
		private var spellIcon:Image = new Image(GC.GFX_SPELL_ICON_FIRE);
		
		public function Fireball(i:Number) 
		{
			super(i);
			spellName = "Fireball";
			castTime = 1.5;
			spellDamage = 100;
			
			hasProjectile = true;
			projectileImage = new Image(new BitmapData(4, 8, false, 0xff9000));
			projectileSpeed = FP.elapsed * 1000;
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}