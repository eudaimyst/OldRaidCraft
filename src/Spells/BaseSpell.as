package Spells 
{
	import Game.SpellCast;
	import HUD.ActionBarSpell;
	import net.flashpunk.Entity
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image
	import net.flashpunk.graphics.Graphiclist
	import net.flashpunk.graphics.Text
	import Spells.Fireball;
	import Spells.BaseSpell;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class BaseSpell extends Entity
	{
		public var spellName:String;
		
		protected var spellButton:Image = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
		
		protected var spellGraphiclist:Graphiclist;
		
		
		private var actionbarNumber:Number = 0; //position of spell on actionbar
		
		public function BaseSpell(i:Number) 
		{
			actionbarNumber = i;
			
			spellButton.scale = 2;
			
			this.setHitbox (spellButton.scaledWidth, spellButton.scaledHeight);
			
			this.type = GC.TYPE_SPELL_BUTTON;
			
			
		}
		override public function added():void 
		{
			super.added();
			
			this.x = actionbarNumber * spellButton.scaledWidth + 10 * actionbarNumber - spellButton.scaledWidth;
			this.y = FP.screen.height - spellButton.scaledHeight - 10;
			
			/*
			
			//trace (Spell.spellName);
			
			//x position of this entity is determined by how many of these entities there are
			this.x = world.classCount (ActionBarSpell) * spellButton.scaledWidth + 10 * world.classCount (HUD.ActionBarSpell) - spellButton.scaledWidth;
			this.y = FP.screen.height - spellButton.scaledHeight - 10;
			
			spellButton = new Image(GC.GFX_SPELL_BUTTON_EMPTY);
			spellButton.scale = 2;
			spellGraphiclist = new Graphiclist(spellIcon);
			graphic = spellGraphiclist
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
			
			*/
			
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.mousePressed)
			{
				trace ("mouse pos x" + world.mouseX  + "mouse pos y" + world.mouseY)
				trace ("this pos x" + this.x + "this pos y" + this.y)
				if (collidePoint(x, y, world.mouseX - FP.camera.x, world.mouseY - FP.camera.y))
				{
					trace ("spell pressed" + this.spellName);
					this.world.add (new SpellCast(this.spellName));
				}
			}
		}
		
	}

}