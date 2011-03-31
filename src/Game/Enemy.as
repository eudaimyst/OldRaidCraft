package Game 
{
	import flash.display.BitmapData;
	import HUD.EnemyTooltip;
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
		
		private var unitFrameInstance:TargetUnitFrame;
		
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
			
			if (collidePoint(x, y, world.mouseX, world.mouseY))
			{
				if (world.classCount(EnemyTooltip) < 1)
				{
				this.world.add (new EnemyTooltip(this as Enemy));
				}
			}
			
			
			if (Input.mousePressed)
			{
				
				if (collidePoint(x, y, world.mouseX, world.mouseY))
				{
					
					GV.TARGETED_ENEMY = this as Enemy; //set global variable targeted enemy to this instance of this enemy
					isTargeted = true;
					unitFrameInstance = TargetUnitFrame.unitFrameInstance;
					unitFrameInstance.UpdateFrame();
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
				unitFrameInstance.UpdateFrame();
				this.world.remove(this);
			}
			

		}
		
	}

}