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
	public class Frost extends BaseSpell
	{
		
		public function Frost(i:Number) 
		{
			super(i);
			spellName = "Frost";
			castTime = 0;
			spellDamage = 10;
			cooldownTime = 1.5;
			manaCost = 20;
			
			spellIconGraphic = GC.GFX_SPELL_ICON_FROST;
			spellIcon = new Image(spellIconGraphic);
			
			hasProjectile = true;
			projectileImage = new Image(new BitmapData(4, 8, false, 0x0090ff));
			projectileSpeed = FP.elapsed * 1000;
			
			hasBuff = true;
			buffTime = 3;
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
		override public function BuffEffect():void 
		{
			super.BuffEffect();
			GV.TARGETED_ENEMY.currentEnemySpeed = GV.TARGETED_ENEMY.defaultEnemySpeed / 2;
			
		}
		
		
	}

}