package Game 
{
	import HUD.TargetUnitFrame;
	import Menu.MenuButton;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	
	public class SpellCast extends Entity 
	{
		protected var spellcastName:String;
		protected var spellcastGraphiclist:Graphiclist;
		protected var castBar:Image;
		protected var castBarElapsed:Image;
		protected var castBarText:Text;
		protected var timeElapsed:Number;
		protected var timeElapsedText:Text;
		protected var e:Enemy
		
		public function SpellCast(spellcastName:String)
		{
			timeElapsed = 0;
			timeElapsedText = new Text(String(timeElapsed));
			castBarText = new Text(spellcastName);
			castBar = new Image(new BitmapData(300, 30, false, 0x000000)); //set cast bar graphic
			castBarElapsed = new Image(new BitmapData(300,30,false,0x444444)); //set cast bar graphic
			spellcastGraphiclist = new Graphiclist(castBar,castBarElapsed,castBarText, timeElapsedText);
			//graphic = spellcastGraphiclist;
			
			castBarElapsed.scaleX = 0;
			castBarText.x = this.x;
			castBarText.y = this.y;
			timeElapsedText.x = this.x + this.width - timeElapsedText.width;
			timeElapsedText.y = this.y;
			this.x = FP.screen.width / 2 - castBar.width / 2;
			this.y = FP.screen.height - FP.screen.height / 4;
			castBarText.color = 0xFFFFFF;
			
		}
		
		override public function added():void 
		{
			super.added();
			
			if (this.world.classCount(SpellCast) > 1)
			{
				trace("spell already casting");
				this.world.remove(this);
			}
			
			else
			{
				if (this.world.classCount(TargetUnitFrame) != 1)
				{
					trace("no target sellected");
					this.world.add (new MenuButton("you have no target", 0));
					this.world.remove(this);
				}
				else
				{
					var tuf = this.world.classFirst(TargetUnitFrame);
					e = tuf.GetEnemy();
					
					trace("current health: " + e.enemyCurrentHealth + " max health: " + e.enemyMaxHealth);
				}
			}
		}
		
		override public function update():void 
		{
			timeElapsed += FP.elapsed;
			super.update();
			//trace (timeElapsed);
			if (timeElapsed < 3)
			{
				
				timeElapsedText = new Text(String(Math.round(timeElapsed *10 ) / 10) + "/3", 300);
				castBarElapsed.scaleX = timeElapsed / 3;
				spellcastGraphiclist = new Graphiclist(castBar,castBarElapsed,castBarText, timeElapsedText);
				
				graphic = spellcastGraphiclist;
			}
			else
			{
				e.enemyCurrentHealth -= 50;
				this.world.remove(this);
			}
		}
	}

}