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
	import net.flashpunk.graphics.Spritemap;
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
		private var onCooldown:Boolean = false;
		public static var onGlobalCooldown:Boolean = false;
		
		//spell variables, to be set in entities which extend this
		public var spellName:String;
		public var castTime:Number;
		public var spellDamage:Number;
		public var cooldownTime:Number = .5; //default cooldown time for all spells
		
		//projectile info
		public var hasProjectile:Boolean;
		public var projectileImage:Image;
		public var projectileSpeed:Number;
		
		//graphics
		protected var spellButton:Image = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
		public var sprCooldown:Spritemap = new Spritemap(GC.GFX_COOLDOWN, 32, 32, RemoveCooldown);
		public var sprGlobalCooldown:Spritemap = new Spritemap(GC.GFX_COOLDOWN, 32, 32, RemoveGlobalCooldown);
		
		public var spellGraphiclist:Graphiclist;
		
		//position of spell on actionbar, set by whatever calls this entity
		private var actionbarNumber:Number = 0; 
		
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
			
			//cooldown
			sprCooldown.add("cooldown", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], 32 / cooldownTime, true);
			sprCooldown.scale = 2;
			sprCooldown.alpha = .5;
			sprCooldown.color = 0x000000;
			
			sprGlobalCooldown.add("cooldown", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], 32 / GV.GLOBAL_COOLDOWN_TIME, true);
			sprGlobalCooldown.scale = 2;
			sprGlobalCooldown.alpha = .5;
			sprGlobalCooldown.color = 0x000000;
			
			//spellbutton graphic
			this.x = actionbarNumber * spellButton.scaledWidth + 10 * actionbarNumber - spellButton.scaledWidth;
			this.y = FP.screen.height - spellButton.scaledHeight - 10;
			graphic = spellGraphiclist;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
		}
		
		public function CastSpell():void
		{
			if (onGlobalCooldown == false) //if global cooldown is not on
			{
				if (GV.PLAYER_IS_CASTING == false) //if the player is not casting
				{
					if (onCooldown == false) //if this spell is not on cooldown
					{
						
						trace ("spell pressed: " + this.spellName + " cast time: " + castTime + " spell damage: " + spellDamage);
						this.world.add (new SpellCast(this as BaseSpell)); //create new spellcast, pass this spell
						
					}
					else this.world.add (new HUDMessage("spell is on cooldown"));
				}
				else this.world.add (new HUDMessage("already casting"));
			}
			else this.world.add (new HUDMessage("global cooldown"));
		}
		
		public function AddGlobalCooldown():void //called from spellcast entity
		{
			trace("play cooldown and add to graphiclist");
			sprGlobalCooldown.play("cooldown"); //play cooldown sprite in base spell entity
			spellGraphiclist.add(sprGlobalCooldown); //add cooldown sprite to graphiclist in base spell entity
			//BaseSpell.onGlobalCooldown = true;
		}
		public function RemoveGlobalCooldown():void //called at the end of cooldown animation
		{
			spellGraphiclist.remove(sprGlobalCooldown);
			trace("removed global cooldown");
			BaseSpell.onGlobalCooldown = false;
		}
		
		
		public function AddCooldown():void //called from spellcast entity
		{
			if (cooldownTime != 0) // if the spell has a cooldown time, if not, do nothing
			{
			trace("play cooldown and add to graphiclist");
			sprCooldown.play("cooldown"); //play cooldown sprite in base spell entity
			spellGraphiclist.add(sprCooldown); //add cooldown sprite to graphiclist in base spell entity
			onCooldown = true;
			}
		}
		
		public function RemoveCooldown():void //called at the end of cooldown animation
		{
			spellGraphiclist.remove(sprCooldown);
			trace("removed cooldown");
			onCooldown = false;
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