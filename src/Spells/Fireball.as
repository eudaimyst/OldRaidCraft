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
		
		
		public function Fireball(i:Number) 
		{
			super(i);
			spellName = "Fireball";
			castTime = 1.5;
			spellDamage = 100;
			cooldownTime = 3;
			manaCost = 20;
			buffText = "60dmg over 6s";
			
			
			spellIconGraphic = GC.GFX_SPELL_ICON_FIRE;
			spellIcon = new Image(spellIconGraphic);
			
			hasProjectile = true;
			projectileImage = new Image(new BitmapData(4, 8, false, 0xff9000));
			projectileSpeed = FP.elapsed * 1000;
			
			hasBuff = true;
			//buffTime = 6;
			buffTickTime = 1;
			buffTicks = 6;
			buffDmg = 10;
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
	}

}