package Game 
{
	import flash.display.BitmapData;
	import HUD.TargetUnitFrame;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class EnemyMonster extends Enemy 
	{
		
		public function EnemyMonster(locX:Number, locY:Number) 
		{	
			super(locX, locY) //passes these values on to enemy
			
			enemyName = "Monster";
			enemyMaxHealth = 800;
			enemyMaxMana = 200;
			enemyImage = new Image(GC.GFX_ENEMY_DRAGON);
			enemyImage.color = 0x8888FF;
			enemyImage.scale = 2;
			enemyDead = false;
			enemyCurrentHealth = enemyMaxHealth;
			enemyCurrentMana = enemyMaxMana;
		}
		
		
		override public function added():void 
		{
			super.added();
			

			
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}