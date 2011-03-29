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
	import Spells.BaseSpell;
	import Spells.SpellProjectile;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	
	public class SpellCast extends Entity 
	{
		protected var passedSpell:BaseSpell;
		
		protected var spellcastGraphiclist:Graphiclist;
		protected var castBar:Image;
		protected var castBarElapsed:Image;
		protected var castBarText:Text;
		protected var timeElapsed:Number;
		protected var timeElapsedText:Text;
		
		
		public function SpellCast(i:BaseSpell) //set spell cast bar graphics
		{
			passedSpell = i;
			//trace("spell started");
			
			timeElapsed = 0;
			timeElapsedText = new Text(String(passedSpell.spellName));
			castBarText = new Text(passedSpell.spellName);
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
			super.update();
			
			timeElapsed += FP.elapsed;
			
			//trace (timeElapsed);
			//trace (String(spellcastTime));
			if (timeElapsed < passedSpell.castTime) //if time passed since this entity was created is less than the cast time of this spell, update cast bar graphics
			{
				timeElapsedText = new Text(String(Math.round(timeElapsed *10 ) / 10) + "/" + passedSpell.castTime, 300);
				castBarElapsed.scaleX = timeElapsed / passedSpell.castTime;
				spellcastGraphiclist = new Graphiclist(castBar,castBarElapsed,castBarText, timeElapsedText);
				
				graphic = spellcastGraphiclist;
				graphic.scrollX = 0;
				graphic.scrollY = 0;
			}
			else // if spell has finished casting
			{
				if (passedSpell.hasProjectile == true) //if spell has a projectile
				{
					this.world.add (new SpellProjectile(passedSpell as BaseSpell)); 
				}
				GV.TARGETED_ENEMY.enemyCurrentHealth -= passedSpell.spellDamage;
				TargetUnitFrame.targetChanged = true;
				this.world.remove(this);
			}
		}
	}

}