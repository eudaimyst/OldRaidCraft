package Spells 
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
	import Game.Enemy;
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
		public var spellName:String = "Default Spell";
		public var castTime:Number = 3;
		public var spellDamage:Number = 0;
		public var cooldownTime:Number = .5; //default cooldown time for all spells
		public var manaCost:Number = 0;
		public var healthCost:Number = 0;
		public var spellRange:Number = 8; //set in tiles, 32 pixels per tile, default 8 tiles
		
		//buff info
		public var hasBuff:Boolean = false;
		public var specialBuff:Boolean = false;
		public var buffTickTime:Number = 0; //time between buff ticks
		public var buffTicks:Number = 0;
		public var buffDmg:Number = 0;
		public var buffText:String = "";
		
		//projectile info
		public var hasProjectile:Boolean = false;
		public var projectileImage:Image;
		public var projectileSpeed:Number;
		
		//graphics
		public var spellIcon:Image;
		public var spellIconGraphic:Class;
		protected var spellButton:Image = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
		protected var rangeFade:Image = new Image(new BitmapData(32, 32, false, 0xff0000));
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
		
		//called when spell finishes casting by SpellCast
		public function BuffEffect ():void
		{
			this.world.add (new HUDMessage("Buff Started"));
			FP.world.add (new BaseBuff (this as BaseSpell, GV.TARGETED_ENEMY));
		}
		
		//called when buff finishes by BaseBuff
		public function BuffEffectRemoved (targetedEnemy:Enemy):void
		{
			this.world.add (new HUDMessage("buff ran out"));
		}
		
		//called on update, checks if this player is in this spells range, if not, add a red semi-tranparent graphic
		public function RangeCheck ():void
		{
			var distance:Number = 0;
			if (GV.TARGETED_ENEMY != null)
			{
				if (GV.TARGETED_ENEMY.isTargeted) distance = GV.TARGETED_ENEMY.getDistance();
			}
			
			if (distance <= spellRange * 32) //if distance to enemy is less than spell range
			{
				spellButton.color = 0xffffff;
			}
			else spellButton.color = 0xff0000;
		}
		
		public function CastSpell():void
		{
			if (GV.TARGETED_ENEMY != null) //if there has been an enemy selected
			{
				var distance:Number = GV.TARGETED_ENEMY.getDistance();
				if (distance <= spellRange * 32) //if distance to enemy is less than spell range
				{
					if (GV.PLAYER_MANA_CURRENT > 0) //if mana is not empty
					{
						if (onGlobalCooldown == false) //if global cooldown is not on
						{
							if (GV.PLAYER_IS_CASTING == false) //if the player is not casting
							{
								if (onCooldown == false) //if this spell is not on cooldown
								{
									if (FP.world.classCount(SpellCast) < 1) //if spellCast has not already been added. Error checking incase 2 spells are pressed at the same time
									{
										if (Player.isMoving == false) //if the player is not moving
										{
										trace ("spell pressed: " + this.spellName + " cast time: " + castTime + " spell damage: " + spellDamage);
										this.world.add (new SpellCast(this as BaseSpell)); //create new spellcast, pass this spell
										}
										else //if the player is moving
										{
											if (castTime == 0) //if the spell is instant cast
											{
												trace ("spell pressed: " + this.spellName + " cast time: " + castTime + " spell damage: " + spellDamage);
												this.world.add (new SpellCast(this as BaseSpell)); //create new spellcast, pass this spell
											}
											else this.world.add (new HUDMessage("cant cast while moving")); // if the player is moving and the cast time is not 0
										}
									}
									else this.world.add (new HUDMessage("2 spells pressed at the same time... fail"));
								}
								else this.world.add (new HUDMessage("spell is on cooldown"));
							}
							else this.world.add (new HUDMessage("already casting"));
						}
						else this.world.add (new HUDMessage("global cooldown"));
					}
					else {GV.PLAYER_MANA_CURRENT = 0; this.world.add (new HUDMessage("out of mana"));}
				}
				else this.world.add (new HUDMessage("out of range"));
			}
		else this.world.add (new HUDMessage("no target"));
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
		
		
		public function AddCooldown():void //called from spellcast entity when spell is started
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
			
			RangeCheck();
			
			if (collidePoint(x, y, world.mouseX - FP.camera.x, world.mouseY - FP.camera.y))
			{
				if (world.classCount(SpellTooltip) < 1)
				{
				this.world.add (new SpellTooltip(this as BaseSpell));
				}
			}
			
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