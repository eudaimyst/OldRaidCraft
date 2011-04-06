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
		public var defaultEnemySpeed:Number = 30;
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
			
			type = GC.TYPE_ENEMY;
		}
		
		override public function added():void 
		{
			isTargeted = false;
			trace("enemy added, name: " + enemyName + ", health: " + enemyCurrentHealth + ", mana: " + enemyCurrentMana)
			graphic = enemyImage;
			this.setHitbox(enemyImage.scaledWidth, enemyImage.scaledHeight);
			
			super.added();
		}
		
		public function getDistance():Number
		{
			distanceToPlayer = FP.distance(this.x + this.halfWidth, this.y + this.halfHeight, Player.xLoc, Player.yLoc);
			return distanceToPlayer;
			//if (distanceToPlayer < 224)
			
			
		}
		
		
		override public function update():void 
		{
			super.update();
			getDistance();
			if (collide(GC.TYPE_ENEMY, x, y))
			{
				var myArray:Array = new Array();
				collideInto(GC.TYPE_ENEMY, x, y, myArray) //store each enemy entity this entity is colliding with in the array
				
				for each (var collidingEnemies:Enemy in myArray) //for each instance of Enemy in the Array
				{
					//trace(allSpells.spellName); //error checking
					moveTowards(x - (collidingEnemies.x - x), y - (collidingEnemies.y - y), FP.elapsed * currentEnemySpeed) //move this entity away from any entity in the array
				}
				
				
				
				//moveTowards(x - (Player.xLoc - x), y - (Player.yLoc - y), FP.elapsed * currentEnemySpeed)// move this entity away from the player
				trace("colliding with enemy");
			}
			else
			{
				moveTowards(Player.xLoc, Player.yLoc, FP.elapsed * currentEnemySpeed)
			}
			
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