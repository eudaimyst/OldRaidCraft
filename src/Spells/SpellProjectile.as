package Spells 
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
	import Game.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellProjectile extends Entity 
	{
		private var passedSpell:BaseSpell;
		private var targetProjectileX:Number;
		private var targetProjectileY:Number;
		private var targetProjectileWidth:Number;
		private var targetProjectileHeight:Number;
		private var noTarget:Boolean = true;
		
		private var testBox:Image;
		
		public function SpellProjectile(i:BaseSpell) 
		{
			trace("projectile created");
			
			passedSpell = i;
			
			
			graphic = passedSpell.projectileImage;
			
			targetProjectileX = GV.TARGETED_ENEMY.x ; //sets projectile target to current enemy (needed incase enemy changes)
			targetProjectileY =  GV.TARGETED_ENEMY.y ;
			targetProjectileWidth = GV.TARGETED_ENEMY.width;
			targetProjectileHeight = GV.TARGETED_ENEMY.height;
			
			x = GV.PLAYER_ENTITY.x + GV.PLAYER_ENTITY.halfWidth; //start position at players position
			y = GV.PLAYER_ENTITY.y + GV.PLAYER_ENTITY.halfHeight;
			
			testBox = new Image(new BitmapData(GV.TARGETED_ENEMY.width, GV.TARGETED_ENEMY.height, false, 0x000000));
			
		}
		
		override public function update():void 
		{
			
			super.update();
			
			
			if (collideRect(x, y, targetProjectileX, targetProjectileY, targetProjectileWidth, targetProjectileHeight)) //if colliding with box at enemy location, enemy dimensions
			{
				
				this.world.remove(this); //remove this entity
			}
			else
			{
			passedSpell.projectileImage.angle = 90 + FP.angle(GV.PLAYER_ENTITY.x, GV.PLAYER_ENTITY.y, targetProjectileX, targetProjectileY); //set angle of projectile image (image is stored in BaseSpell) to point towards current enemy
			moveTowards(targetProjectileX + targetProjectileWidth / 2, targetProjectileY + targetProjectileHeight / 2, passedSpell.projectileSpeed); //move towards targeted enemy
			}
			
		}
		
	}

}