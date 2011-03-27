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
		public var enemyName:String;
		
		public var enemyImage:Image;
		
		public function Enemy(locX, locY) 
		{

			
			this.x = locX;
			this.y = locY;
			
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
				if (collide(GC.TYPE_MOUSE,x,y))
				{
					trace(enemyName);
				}
			}
		}
		
	}

}