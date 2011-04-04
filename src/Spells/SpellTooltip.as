package Spells 
{
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
	public class SpellTooltip extends Entity 
	{
		protected var passedSpell:BaseSpell;
		
		protected var spellNameText:Text;
		protected var spellDamageText:Text;
		protected var spellCastTimeText:Text;
		protected var spellCoolDownText:Text;
		protected var spellCostText:Text;
		protected var spellBuffText:Text;
		protected var spellRangeText:Text;
		
		protected var tooltipBackground:Image;
		
		protected var tooltipGraphiclist:Graphiclist;
		
		public function SpellTooltip(i:BaseSpell) 
		{
			trace("spell tooltip called");
			
			passedSpell = i;
			
			tooltipBackground = new Image(new BitmapData(FP.screen.width / 6, FP.screen.height / 4, false, 0x000000));
			tooltipBackground.alpha = .6;
			
			spellNameText = new Text (passedSpell.spellName);
			spellNameText.size = 12;
			
			spellDamageText = new Text ("Damage: " + passedSpell.spellDamage);
			spellDamageText.size = 12;
			spellDamageText.y = spellNameText.textHeight;
			
			spellCostText = new Text ("ManaCost: " + passedSpell.manaCost)
			spellCostText.size = 12;
			spellCostText.y = spellNameText.textHeight * 2;
			
			spellCastTimeText = new Text ("CastTime: " + passedSpell.castTime + "s")
			spellCastTimeText.size = 12;
			spellCastTimeText.y = spellNameText.textHeight * 3;
			
			spellCoolDownText = new Text ("CoolDown: " + passedSpell.cooldownTime + "s")
			spellCoolDownText.size = 12;
			spellCoolDownText.y = spellNameText.textHeight * 4;
			
			spellRangeText = new Text ("Range: " + passedSpell.spellRange + "m")
			spellRangeText.size = 12;
			spellRangeText.y = spellNameText.textHeight * 5;
			
			spellBuffText = new Text (passedSpell.buffText)
			spellBuffText.size = 12;
			spellBuffText.y = spellNameText.textHeight * 6;
			
			
			tooltipGraphiclist = new Graphiclist (tooltipBackground, spellNameText, spellCostText, spellDamageText, spellCastTimeText, spellCoolDownText, spellRangeText, spellBuffText);
			
			graphic = tooltipGraphiclist;
			
			x = FP.screen.width - tooltipBackground.width - 10;
			y = FP.screen.height - tooltipBackground.height - 10;
			trace(String(x), String(y));
			
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (collideRect(world.mouseX - FP.camera.x, world.mouseY - FP.camera.y, passedSpell.x, passedSpell.y, passedSpell.width, passedSpell.height))
			{
				
			}
			else
			{
				FP.world.remove(this);
			}
		}
		
		
	}

}