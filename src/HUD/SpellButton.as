package HUD 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
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
		protected var spellButtonNumberInt:int;
		
		protected var spellGraphiclist:Graphiclist;
		protected var spellGraphiclistPressed:Graphiclist;
		
		protected var spellButtonName:String; // variable to hold the name of the spell called to this entity
		
		protected var spellLoaded:Boolean; //set to true if a spell is loaded in this entity
		
		protected var isActionBarButton:Boolean; //set to true if this entity is in the actionbar, false if it's in spellselect screen
		
		protected var buttonClicked:Boolean; //set to true if button is clicked
		
		private var mbdX:Number; //used for calculating the difference between mouse and button location when dragging
		private var mbdY:Number;
		
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
			this.type = GC.TYPE_SPELL_BUTTON;
			this.setHitbox (spellButtonNormal.scaledWidth, spellButtonNormal.scaledHeight);
			
			
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
				spellLoaded = false;
				trace ("empty loaded");
				this.type = GC.TYPE_SPELL_BUTTON_EMPTY;
				
			}
			
			
			
			
			if (spellNumber != 0) // if the spell number passed to this entity is not zero (ie, this IS an action bar spell)
			{
				isActionBarButton = true;
				this.x = (FP.screen.width / 9 * spellNumber - spellButtonNormal.scaledWidth);
				this.y = (FP.screen.height - spellButtonNormal.scaledHeight * 1.25);
			}
			else // if the spell number is 0 (this is a spell select spell)
			{
				isActionBarButton = false;
				this.x = (FP.screen.width / 14 + FP.screen.width / 8 * gridLocX);
				this.y = (FP.screen.height / 6 * gridLocY);
				spellGraphiclist.remove (spellButtonNumber);
			}
			
			
			graphic = spellGraphiclist;
			
			
			
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
						if (Input.mousePressed)
						{
							trace(String(isActionBarButton));
						}
						
					}
					if (isActionBarButton == false) //if it's on the spell select screen
					{
						if (Input.mousePressed)
						{
							mbdX = Input.mouseX - this.x;
							mbdY = Input.mouseY - this.y;
							trace(String(mbdX));
							buttonClicked = true;
						}
					}
				}
				
				if (buttonClicked == true)
				{
					this.x = (Input.mouseX) - mbdX;
					this.y = (Input.mouseY) - mbdY;
					this.layer = -1;
					
					if (this.collide(GC.TYPE_SPELL_BUTTON_EMPTY, x, y))
					{
						trace("colliding with empty button");
					}
					
					if (Input.mouseReleased)
					{
						buttonClicked = false;
					}
				}
				
				
				if (Input.pressed(48 + spellButtonNumberInt)) //if they spellNumber passed to this entity is pressed
				{
					graphic = spellGraphiclistPressed;
					spellIcon.x -= 2;
					spellIcon.y += 2;
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