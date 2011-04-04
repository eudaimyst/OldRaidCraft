package Spells 
{
	import Game.Enemy;
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
			spellRange = 4;
			
			spellIconGraphic = GC.GFX_SPELL_ICON_FROST;
			spellIcon = new Image(spellIconGraphic);
			
			hasProjectile = true;
			projectileImage = new Image(new BitmapData(4, 8, false, 0x0090ff));
			projectileSpeed = FP.elapsed * 1000;
			
			hasBuff = true;
			buffTicks = 1;
			buffTickTime = 3;
			buffDmg = 0;
			buffText = "slows 50% for 3s"
			
			spellIcon.scale = 2;
			spellGraphiclist.add(spellIcon);
			
		}
		
		//used for creating special buff effects
		
		override public function BuffEffect():void 
		{
			super.BuffEffect();
			GV.TARGETED_ENEMY.currentEnemySpeed = GV.TARGETED_ENEMY.defaultEnemySpeed / 2;
		}
		
		
		
		override public function BuffEffectRemoved (targetedEnemy:Enemy):void
		{
			super.BuffEffectRemoved(targetedEnemy);
			targetedEnemy.currentEnemySpeed = targetedEnemy.defaultEnemySpeed;
		}
		
		
	}

}