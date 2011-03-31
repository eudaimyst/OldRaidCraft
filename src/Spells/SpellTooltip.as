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
			spellDamageText.y = spellNameText.scaledHeight;
			
			spellCastTimeText = new Text ("Cast Time: " + passedSpell.castTime + "s")
			spellCastTimeText.y = spellDamageText.y + spellDamageText.scaledHeight;
			spellCastTimeText.size = 12;
			
			spellCoolDownText = new Text ("Cooldown: " + passedSpell.cooldownTime + "s")
			spellCoolDownText.y = spellCastTimeText.y + spellCastTimeText.scaledHeight;
			spellCoolDownText.size = 12;
			
			
			tooltipGraphiclist = new Graphiclist (tooltipBackground, spellNameText, spellDamageText, spellCastTimeText, spellCoolDownText);
			
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