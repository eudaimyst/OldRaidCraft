package Spells 
{
	import HUD.TargetUnitFrame;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image
	import net.flashpunk.FP
	import net.flashpunk.graphics.Spritemap
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class BaseBuff extends Entity
	{ 
		private var buffGraphiclist:Graphiclist;
		private var buffBackground:Image = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
		private var sprBuffCooldown:Spritemap = new Spritemap(GC.GFX_COOLDOWN, 32, 32);
		private var timeElapsed:Number = 0;
		private var buffIcon:Image;
		
		private var passedSpell:BaseSpell;
		
		public function BaseBuff(i:BaseSpell) 
		{
			passedSpell = i;
			
			buffIcon = new Image(passedSpell.spellIconGraphic);
			
			buffBackground.scale = .5;
			buffIcon.scale = .5;
			
			buffGraphiclist = new Graphiclist(buffBackground, buffIcon);
			graphic = buffGraphiclist;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
			
			x = TargetUnitFrame.unitFrameInstance.x;
			y = TargetUnitFrame.unitFrameInstance.y + 50;
			
			trace("Drawn buff graphic: ");
		}
		
	}

}