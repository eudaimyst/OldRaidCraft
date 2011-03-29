package Game 
{
	import HUD.HUDMessage;
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
		protected var spellcastDamage:Number;
		protected var spellcastTime:Number;
		
		protected var spellcastGraphiclist:Graphiclist;
		protected var castBar:Image;
		protected var castBarElapsed:Image;
		protected var castBarText:Text;
		protected var timeElapsed:Number;
		protected var timeElapsedText:Text;
		
		public function SpellCast(iName:String, iTime:Number, iDamage:Number)
		{
			trace("spell started");
			spellcastName = iName;
			spellcastDamage = iDamage;
			spellcastTime = iTime;
			trace (String(iTime));
			
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
				this.world.add (new HUDMessage("already casting"));
				this.world.remove (this);
			}
			
			else
			{
				if (GV.TARGETED_ENEMY == null)
				{
					trace("no target sellected");
					this.world.add (new HUDMessage("you have no target"));
					this.world.remove(this);
				}
			}
		}
		
		override public function update():void 
		{
			timeElapsed += FP.elapsed;
			super.update();
			//trace (timeElapsed);
			//trace (String(spellcastTime));
			if (timeElapsed < spellcastTime)
			{
				
				timeElapsedText = new Text(String(Math.round(timeElapsed *10 ) / 10) + "/" + String(spellcastTime), 300);
				castBarElapsed.scaleX = timeElapsed / spellcastTime;
				spellcastGraphiclist = new Graphiclist(castBar,castBarElapsed,castBarText, timeElapsedText);
				
				graphic = spellcastGraphiclist;
				graphic.scrollX = 0;
				graphic.scrollY = 0;
			}
			else
			{
				GV.TARGETED_ENEMY.enemyCurrentHealth -= spellcastDamage;
				TargetUnitFrame.targetChanged = true;
				this.world.remove(this);
			}
		}
	}

}