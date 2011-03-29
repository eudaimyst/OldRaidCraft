package Spells 
{
	import Game.Player;
	import Game.SpellCast;
	import HUD.ActionBarSpell;
	import HUD.HUDMessage;
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
		public var castTime:Number;
		public var spellDamage:Number;
		
		//projectile info
		public var hasProjectile:Boolean;
		public var projectileImage:Image;
		public var projectileSpeed:Number;
		
		protected var spellButton:Image = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
		
		protected var spellGraphiclist:Graphiclist;
		
		
		private var actionbarNumber:Number = 0; //position of spell on actionbar
		
		public function BaseSpell(i:Number) 
		{
			actionbarNumber = i;
			
			spellButton.scale = 2;
			
			this.setHitbox (spellButton.scaledWidth, spellButton.scaledHeight);
			
			this.type = GC.TYPE_SPELL_BUTTON;
			
			spellGraphiclist = new Graphiclist(spellButton);
		}
		override public function added():void 
		{
			super.added();
			
			this.x = actionbarNumber * spellButton.scaledWidth + 10 * actionbarNumber - spellButton.scaledWidth;
			this.y = FP.screen.height - spellButton.scaledHeight - 10;
			graphic = spellGraphiclist;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
		}
		
		public function CastSpell():void
		{
			if (Player.isMoving == false) // if player is not moving
			{
			trace ("spell pressed" + this.spellName + castTime + spellDamage);
			this.world.add (new SpellCast(this as BaseSpell)); //create new spellcast, pass this spell
			}
			else this.world.add (new HUDMessage("cant cast while moving"));
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.mousePressed)
			{
				if (collidePoint(x, y, world.mouseX - FP.camera.x, world.mouseY - FP.camera.y))
				{
					CastSpell();
				}
			}
			
			switch(actionbarNumber) //if key pressed is equal to actionbar binding for this actionbar number, call CastSpell
			{
				case 1:
				if (Input.pressed(GV.BINDING_ACTIONBAR_1)) CastSpell();
				break
				
				case 2:
				if (Input.pressed(GV.BINDING_ACTIONBAR_2)) CastSpell();
				break
				
				case 3:
				if (Input.pressed(GV.BINDING_ACTIONBAR_3)) CastSpell();
				break
				
				case 4:
				if (Input.pressed(GV.BINDING_ACTIONBAR_4)) CastSpell();
				break
				
				case 5:
				if (Input.pressed(GV.BINDING_ACTIONBAR_5)) CastSpell();
				break
				
				case 6:
				if (Input.pressed(GV.BINDING_ACTIONBAR_6)) CastSpell();
				break
				
				case 7:
				if (Input.pressed(GV.BINDING_ACTIONBAR_7)) CastSpell();
				break
				
				case 8:
				if (Input.pressed(GV.BINDING_ACTIONBAR_8)) CastSpell();
				break
				
				case 9:
				if (Input.pressed(GV.BINDING_ACTIONBAR_9)) CastSpell();
				break
				
				case 10:
				if (Input.pressed(GV.BINDING_ACTIONBAR_10)) CastSpell();
				break
				
				
			}
			
			
		}
		
	}

}