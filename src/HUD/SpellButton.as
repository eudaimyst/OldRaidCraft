package HUD 
{
	import adobe.utils.CustomActions;
	import Game.SpellCast;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellButton extends Entity 
	{
		// define graphics variables
		protected var spellButtonPressed:Image;
		protected var spellButtonEmpty:Image;
		protected var spellButtonNormal:Image;
		protected var spellIcon:Image;
		
		protected var spellButtonNumber:Text;
		public var spellButtonNumberInt:int;
		
		protected var spellGraphiclist:Graphiclist;
		protected var spellGraphiclistPressed:Graphiclist;
		
		protected var spellButtonName:String; // variable to hold the name of the spell called to this entity
		
		protected var spellLoaded:Boolean; //set to true if a spell is loaded in this entity
		
		protected var isActionBarButton:Boolean; //set to true if this entity is in the actionbar, false if it's in spellselect screen
		
		protected var buttonClicked:Boolean; //set to true if button is clicked
		
		private var mbdX:Number; //used for calculating the difference between mouse and button location when dragging
		private var mbdY:Number;
		private var buttonPosX:Number; //used for storing position of button on mouse press to move it back if no collision
		private var buttonPosY:Number;
		
		public function SpellButton(spellName:String, spellNumber:int, gridLocX:int, gridLocY:int)
		{
			spellButtonName = spellName;
			spellButtonNumberInt = spellNumber;
			
			// set graphics for spell buttons
			spellButtonPressed = new Image(GC.GFX_SPELL_BUTTON_PRESSED);
			spellButtonNormal = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
			spellButtonEmpty = new Image(GC.GFX_SPELL_BUTTON_EMPTY);
			
			spellButtonEmpty.scale = 2;
			spellButtonNormal.scale = 2;
			spellButtonPressed.scale = 2;
			// set text for spell number to passed int
			spellButtonNumber = new Text(String(spellNumber));
			spellButtonNumber.x = 4;
			
			spellLoaded = true;
			
			this.setHitbox (spellButtonNormal.scaledWidth, spellButtonNormal.scaledHeight);
			this.type = GC.TYPE_SPELL_BUTTON;
			
			
			SetSpell(spellName); //calls the SetSpell function to set a spell graphic for this entity, if a spell is passed to this entity when this entity is added
			
			
			
			
			
			if (spellNumber != 0) // if the spell number passed to this entity is not zero (ie, this IS an action bar spell)
			{
				isActionBarButton = true;
				this.x = (FP.screen.width / 9 * spellNumber - spellButtonNormal.scaledWidth); //set location of this entity to the action bar area
				this.y = (FP.screen.height - spellButtonNormal.scaledHeight * 1.25);
			}
			else // if the spell number is 0 (this is a spell select spell)
			{
				isActionBarButton = false;
				this.x = (FP.screen.width / 14 + FP.screen.width / 8 * gridLocX); //set location of this entity to the spell select area
				this.y = (FP.screen.height / 6 * gridLocY);
				spellGraphiclist.remove (spellButtonNumber); //remove the 
			}
			
			
			graphic = spellGraphiclist;
			
			if (spellName == "")
			{
				this.type = GC.TYPE_SPELL_BUTTON_EMPTY;
				spellLoaded = false;
				trace ("empty loaded");
			}
			
		}
		
		public function SetHUDSpell(setSpellNumberInt:int):void //sets the chosen spell variables
		{
			switch (setSpellNumberInt)
			{
				case 1:
				GV.CHOSEN_SPELL_1 = spellButtonName;
				break;
				case 2:
				GV.CHOSEN_SPELL_2 = spellButtonName;
				break;
				case 3:
				GV.CHOSEN_SPELL_3 = spellButtonName;
				break;
				case 4:
				GV.CHOSEN_SPELL_4 = spellButtonName;
				break;
				case 5:
				GV.CHOSEN_SPELL_5 = spellButtonName;
				break;
				case 6:
				GV.CHOSEN_SPELL_6 = spellButtonName;
				break;
				
				default:
				break;
				
				
			}
		}
		
		public function SetSpell(spellName:String):void //this function will set the spell graphic
		{
			//case checks the passed string
			switch (spellName) {
				
				
				case "fireball":	//if fireball
									//sets spell icon to fireball graphic and adds spell icon to graphiclist
				spellIcon = new Image(GC.GFX_SPELL_ICON_FIRE); 
				spellIcon.scale = 2;
				spellGraphiclist = new Graphiclist(spellButtonNormal, spellIcon, spellButtonNumber);
				spellGraphiclistPressed = new Graphiclist(spellButtonPressed, spellIcon, spellButtonNumber);
				trace ("fireball loaded");
				
				break;
				
				case "arcane":		//if fireball
									//sets spell icon to fireball graphic and adds spell icon to graphiclist
				spellIcon = new Image(GC.GFX_SPELL_ICON_ARCANE); 
				spellIcon.scale = 2;
				spellGraphiclist = new Graphiclist(spellButtonNormal, spellIcon, spellButtonNumber);
				spellGraphiclistPressed = new Graphiclist(spellButtonPressed, spellIcon, spellButtonNumber);
				trace ("arcane loaded");
				break;
				
				case "frost":		//if fireball
									//sets spell icon to fireball graphic and adds spell icon to graphiclist
				spellIcon = new Image(GC.GFX_SPELL_ICON_FROST); 
				spellIcon.scale = 2;
				spellGraphiclist = new Graphiclist(spellButtonNormal, spellIcon, spellButtonNumber);
				spellGraphiclistPressed = new Graphiclist(spellButtonPressed, spellIcon, spellButtonNumber);
				trace ("frost loaded");
				break;
				
				case "death":		//if fireball
									//sets spell icon to fireball graphic and adds spell icon to graphiclist
				spellIcon = new Image(GC.GFX_SPELL_ICON_DEATH); 
				spellIcon.scale = 2;
				spellGraphiclist = new Graphiclist(spellButtonNormal, spellIcon, spellButtonNumber);
				spellGraphiclistPressed = new Graphiclist(spellButtonPressed, spellIcon, spellButtonNumber);
				trace ("death loaded");
				break;
				
				case "lightning":	//if fireball
									//sets spell icon to fireball graphic and adds spell icon to graphiclist
				spellIcon = new Image(GC.GFX_SPELL_ICON_LIGHTNING); 
				spellIcon.scale = 2;
				spellGraphiclist = new Graphiclist(spellButtonNormal, spellIcon, spellButtonNumber);
				spellGraphiclistPressed = new Graphiclist(spellButtonPressed, spellIcon, spellButtonNumber);
				trace ("lightning loaded");
				break;
				
				default:			//if no spell is passed
									// sets adds empty button graphic to graphiclist
				spellGraphiclist = new Graphiclist(spellButtonEmpty, spellButtonNumber);
				
				return;
			}
		}
		
		override public function update():void
		{
			
			super.update();

			if (spellLoaded == true) //if this entity has a spell loaded
			{
				

				
				if (this.collide(GC.TYPE_MOUSE, x, y)) //if mouse is over this entity
				{
					if (isActionBarButton == true) //if this button is on the actionbar
					{
						if (Input.mousePressed) //if mouse is pressed
						
						{
							trace(String(spellButtonName));
							trace(String(isActionBarButton)); //trace if this entity is an actionbar button (testing)
							this.world.add (new SpellCast(spellButtonName));
						}
						
					}
					if (isActionBarButton == false) //if it's on the spell select screen
					{
						if (Input.mousePressed) //if mouse is pressed on this frame
						{
							buttonPosX = this.x;
							buttonPosY = this.y;
							mbdX = Input.mouseX - this.x; //calculates the difference between where the mouse is and the button
							mbdY = Input.mouseY - this.y;
							trace(String(mbdX)); //trace this value (testing)
							buttonClicked = true; //get to true, for later checking
						}
					}
				}
				
				if (buttonClicked == true) //if mouse was pressed and hasn't been released
				{
					this.x = (Input.mouseX) - mbdX; // this entity location = the position of the mouse minus this value (the offset between the mouse and button when mouse was pressed)
					this.y = (Input.mouseY) - mbdY;
					this.layer = -1; //set to infront of other entities
					
					
					
					
					if (Input.mouseReleased) 
					{
						
						var f:Entity = collide(GC.TYPE_SPELL_BUTTON, x, y) //if, on mouse release this entity is colliding with a non empty button
						if (f)
						{
							trace("colliding with non-empty button");
							this.x = buttonPosX;
							this.y = buttonPosY;
						}
						else
						{
							var e:HUD.SpellButton = collide(GC.TYPE_SPELL_BUTTON_EMPTY, x, y) as HUD.SpellButton; // if, on mouse release, this entity is colliding with an empty button
							if (e)
							{
								trace("colliding with empty button");
								this.x = e.x; //move this entity to the empty buttons location
								this.y = e.y;
								SetHUDSpell(e.spellButtonNumberInt); //gets the spell button number of the spell button this spell button is colliding with, and passes to function
							
							}
							
							else
							{
								trace("colliding with nothing");
								this.x = buttonPosX; //if it's colliding with nothing, move this entity to it's original location (when the mouse was last pressed)
								this.y = buttonPosY;
							}
						}
						
						buttonClicked = false; // if mouse was released, set to false so this entity no longer moves with the mouse
						
						
					}
				}
				
				
				if (Input.pressed(48 + spellButtonNumberInt)) //if they spellNumber passed to this entity is pressed
				{
					graphic = spellGraphiclistPressed;
					spellIcon.x -= 2;
					spellIcon.y += 2;
					this.world.add (new SpellCast(spellButtonName));
				}
				
				if (Input.released(48 + spellButtonNumberInt)) //if it's released
				{
					graphic = spellGraphiclist;
					spellIcon.x += 2;
					spellIcon.y -= 2;
					
				}
			}
		}
		
		
	}

}