package HUD 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class PlayerUnitFrame extends HUD.HUDEntity 
	{
		protected var playerHealthBar:Image;
		protected var playerManaBar:Image;
		protected var unitFrameGraphicList:Graphiclist;
		
		protected var playerHealthText:Text;
		protected var playerManaText:Text;
		protected var playerHealth:Text;
		protected var playerMana:Text;
		
		
		public function PlayerUnitFrame() 
		{
			playerHealthBar = Image.createRect(120, 20, 0xcc2222); //set player health bar graphic
			
			playerManaBar = Image.createRect(120, 20, 0x2222cc); //set player mana bar graphic
			
			playerManaBar.y = 25;
			
			playerHealthText = new Text ("HP:"); //set player health bar text
			playerHealthText.x = playerHealthBar.width + 5;
			playerHealthText.y = playerHealthBar.y - 3;
			playerManaText = new Text ("MP:"); //set player mana bar text
			playerManaText.x = playerManaBar.width + 5;
			playerManaText.y = playerManaBar.y - 3;
			
			
			playerHealth = new Text (String(GV.PLAYER_HEALTH_CURRENT)); //set player health text to global player health variable
			playerHealth.x = playerHealthText.x + playerHealthText.width;
			playerHealth.y = playerHealthBar.y - 3;
			playerMana = new Text (String(GV.PLAYER_MANA_CURRENT)); //set player mana text to global player mana variable
			playerMana.x = playerManaText.x + playerManaText.width + 5;
			playerMana.y = playerManaBar.y - 3;
			
			
			unitFrameGraphicList = new Graphiclist(playerHealthBar, playerManaBar, playerHealthText, playerManaText, playerHealth, playerMana) //set which graphics to draw
			
			graphic = unitFrameGraphicList; //draw graphics
			graphic.scrollX = 0; //locks this entities graphic to camera
			graphic.scrollY = 0;
			
			this.x = FP.camera.x + FP.screen.width / 40; //set co-ordinates of unit frame
			this.y = FP.camera.y + FP.screen.height / 14;
			
			
		}
		
		override public function update():void 
		{
			
			if (playerHealth.text != String(GV.PLAYER_HEALTH_CURRENT)) //if the player health has changed
			{
				playerHealth = new Text (String(GV.PLAYER_HEALTH_CURRENT)); //update player health text
				playerHealth.x = playerHealthText.x + playerHealthText.width ; //player health location needs to be set again
				playerHealth.y = playerHealthBar.y - 3;
				
				playerHealthBar.scaleX = GV.PLAYER_HEALTH_CURRENT / GV.PLAYER_HEALTH_MAX;
				
				unitFrameGraphicList =  new Graphiclist(playerHealthBar, playerManaBar, playerHealthText, playerManaText, playerHealth, playerMana) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
				graphic.scrollX = 0; //locks this entities graphic to camera
				graphic.scrollY = 0;
			}
			
			if (playerMana.text != String(GV.PLAYER_MANA_CURRENT)) //if the player mana has changed
			{
				playerMana = new Text (String(GV.PLAYER_MANA_CURRENT)); //update player mana text
				playerMana.x = playerManaText.x + playerManaText.width ; //player mana location needs to be set again
				playerMana.y = playerManaBar.y - 3;
				
				playerManaBar.scaleX = GV.PLAYER_MANA_CURRENT / GV.PLAYER_MANA_MAX;
				playerManaBar.y = 25;
				
				unitFrameGraphicList =  new Graphiclist(playerHealthBar, playerManaBar, playerHealthText, playerManaText, playerHealth, playerMana) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
				graphic.scrollX = 0; //locks this entities graphic to camera
				graphic.scrollY = 0;
			}
			super.update();
		}
	}

}