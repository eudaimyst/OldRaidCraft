package HUD 
{
	import net.flashpunk.Entity
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image
	import net.flashpunk.graphics.Graphiclist
	import net.flashpunk.graphics.Text
	import Spells.Fireball;
	import Spells.BaseSpell;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class ActionBarSpell extends HUD.HUDEntity
	{
		protected var spellButton:Image = new Image(GC.GFX_SPELL_BUTTON_EMPTY);
		protected var spellIcon:Image;
		
		protected var spellGraphiclist:Graphiclist;
		
		public function ActionBarSpell()
		{
			// set graphics for spell buttons
			spellButton.scale = 2;
			
			this.setHitbox (spellButton.scaledWidth, spellButton.scaledHeight);
			this.type = GC.TYPE_SPELL_BUTTON;
			
			spellGraphiclist = new Graphiclist(spellButton);
			
			graphic = spellGraphiclist;
		}
		override public function added():void 
		{
			super.added();
			//trace (Spell.spellName);
			
			//x position of this entity is determined by how many of these entities there are
			this.x = world.classCount (HUD.ActionBarSpell) * spellButton.scaledWidth + 10 * world.classCount (HUD.ActionBarSpell) - spellButton.scaledWidth;
			this.y = FP.screen.height - spellButton.scaledHeight - 10;
			
			spellButton = new Image(GC.GFX_SPELL_BUTTON_EMPTY);
			spellButton.scale = 2;
			spellGraphiclist = new Graphiclist(spellButton);
			graphic = spellGraphiclist
			graphic.scrollX = 0; //locks this entities graphic to camera
			graphic.scrollY = 0;
			
			
		}
		
	}

}