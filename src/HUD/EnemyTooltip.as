package HUD 
{
	import Game.Enemy;
	import net.flashpunk.Entity;
	import HUD.HUDMessage;
	import HUD.TargetUnitFrame;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import Spells.BaseSpell;
	import Spells.SpellProjectile;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class EnemyTooltip extends HUDEntity 
	{
		protected var passedEnemy:Enemy;
		
		protected var enemyNameText:Text;
		protected var enemyHealthText:Text;
		
		protected var tooltipBackground:Image;
		protected var tooltipGraphiclist:Graphiclist;
		
		
		public function EnemyTooltip(i:Enemy) 
		{
			trace ("enemy tooltip called");
			passedEnemy = i;
			
			tooltipBackground = new Image(new BitmapData(FP.screen.width / 6, FP.screen.height / 4, false, 0x000000));
			tooltipBackground.alpha = .6;
			
			enemyNameText = new Text (passedEnemy.enemyName);
			enemyNameText.size = 12;
			
			enemyHealthText = new Text ("HP: " + passedEnemy.enemyCurrentHealth + "/" + passedEnemy.enemyMaxHealth);
			enemyHealthText.size = 12;
			enemyHealthText.y = enemyNameText.scaledHeight;
			
			
			tooltipGraphiclist = new Graphiclist (tooltipBackground, enemyNameText, enemyHealthText);
			
			graphic = tooltipGraphiclist;
			
			x = FP.screen.width - tooltipBackground.width - 10;
			y = FP.screen.height - tooltipBackground.height - 10;
			trace(String(x), String(y));
			
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (collideRect(world.mouseX, world.mouseY, passedEnemy.x, passedEnemy.y, passedEnemy.width, passedEnemy.height))
			{
				
			}
			else
			{
				trace ("enemy tooltip removed");
				FP.world.remove(this);
			}
		}
		
	}

}