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
		public var defaultEnemySpeed:Number = 35;
		public var currentEnemySpeed:Number;
		
		public var enemyImage:Image;
		
		public var isTargeted:Boolean;
		
		private var unitFrameInstance:TargetUnitFrame;
		
		private var distanceToPlayer:Number = 100;
		
		public function Enemy(locX:Number, locY:Number) 
		{
			currentEnemySpeed = defaultEnemySpeed;
			
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
		
		public function getDistance():void
		{
			distanceToPlayer = FP.distance(this.x + this.halfWidth, this.y + this.halfHeight, Player.xLoc, Player.yLoc);
			if (distanceToPlayer < 224)
			{
				trace(distanceToPlayer);
				moveTowards(Player.xLoc, Player.yLoc, FP.elapsed * currentEnemySpeed)
			}
		}
		
		
		override public function update():void 
		{
			super.update();
			getDistance();
			
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
			}
			
			if (enemyDead)
			{
				unitFrameInstance.UpdateFrame();
				this.world.remove(this);
			}
			

		}
		
	}

}