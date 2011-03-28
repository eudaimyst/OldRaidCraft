package Game 
{
	import flash.display.BitmapData;
	import HUD.HUDMessage;
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
		public var enemyName:String;
		
		public var enemyImage:Image;
		
		public var isTargeted:Boolean;
		
		public function Enemy(locX:Number, locY:Number) 
		{
			this.x = locX;
			this.y = locY;
		}
		
		override public function added():void 
		{
			isTargeted = false;
			trace("enemy added, name: " + enemyName + ", health: " + enemyCurrentHealth + ", mana: " + enemyCurrentMana)
			graphic = enemyImage;
			this.setHitbox(enemyImage.scaledWidth, enemyImage.scaledHeight);
			
			super.added();
		}
		
		
		override public function update():void 
		{
			super.update();
			
			if (Input.mousePressed)
			{
				
				if (collidePoint(x, y, world.mouseX, world.mouseY))
				{
					TargetUnitFrame.targetChanged = true;
					GV.TARGETED_ENEMY = this as Enemy;
					isTargeted = true;
				}
				/*
				else
				{
					TargetUnitFrame.targetChanged = true;
					//GV.TARGETED_ENEMY = null;
					isTargeted = false;
				}
				*/
				
			}
			
			if (enemyDead == true)
			{
				this.world.remove(this);
			}
			

		}
		
	}

}