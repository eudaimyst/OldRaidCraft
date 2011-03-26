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
	public class Enemy extends Entity 
	{
		public var enemyCurrentHealth:Number;
		public var enemyCurrentMana:Number;
		public var enemyMaxHealth:Number;
		public var enemyMaxMana:Number;
		public var enemyDead:Boolean;
		public var enemyName2:String;
		public var dragonImage:Image;
		
		protected var enemyImage:Image;
		
		public function Enemy(enemyName:String, enemyMaxHealthPassed:Number, enemyMaxManaPassed:Number, locX:Number, locY:Number) 
		{
			enemyMaxHealth = enemyMaxHealthPassed;
			enemyMaxMana = enemyMaxManaPassed;
			enemyImage = new Image(GC.GFX_ENEMY_DRAGON);
			enemyImage.scale = 2;
			enemyDead = false;
			enemyCurrentHealth = enemyMaxHealth;
			enemyCurrentMana = enemyMaxMana;
			trace("enemy added, name: " + enemyName + ", health: " + enemyCurrentHealth + ", mana: " + enemyCurrentMana)
			enemyName2 = enemyName;
			graphic = enemyImage;
			this.setHitbox(enemyImage.scaledWidth, enemyImage.scaledHeight);
			this.x = locX;
			this.y = locY;
			
		}
		
		
		override public function added():void 
		{
			super.added();
			

		}
		
		override public function update():void 
		{
			super.update();
			if (enemyDead == true)
			{
				this.world.remove(this);
			}
			if (Input.mousePressed)
			{
				if (this.collide(GC.TYPE_MOUSE, x, y))
				{
					
					trace("colliding with enemy");
					var e:Enemy = this as Enemy;
				}
			
			}
		}
		
	}

}