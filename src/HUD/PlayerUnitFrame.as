package HUD 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class PlayerUnitFrame extends Entity 
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
			playerHealthBar = new Image (new BitmapData(120, 20, false, 0xcc2222)); //set player health bar graphic
			
			playerManaBar = new Image (new BitmapData(120, 20, false, 0x2222cc)); //set player mana bar graphic
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
			
			this.x = 10; //set co-ordinates of unit frame
			this.y = 345;
			
		}
		
		override public function update():void 
		{
			if (playerHealth.text != String(GV.PLAYER_HEALTH_CURRENT)) //if the player health has changed
			{
				playerHealth = new Text (String(GV.PLAYER_HEALTH_CURRENT)); //update player health text
				playerHealth.x = playerHealthText.x + playerHealthText.width ; //player health location needs to be set again
				playerHealth.y = playerHealthBar.y - 3;
				
				playerHealthBar = new Image (new BitmapData(120*GV.PLAYER_HEALTH_CURRENT/GV.PLAYER_HEALTH_MAX, 20, false, 0xcc2222)); //update health bar graphic
				
				unitFrameGraphicList =  new Graphiclist(playerHealthBar, playerManaBar, playerHealthText, playerManaText, playerHealth, playerMana) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
			}
			
			if (playerMana.text != String(GV.PLAYER_MANA_CURRENT)) //if the player health has changed
			{
				playerMana = new Text (String(GV.PLAYER_MANA_CURRENT)); //update player health text
				playerMana.x = playerManaText.x + playerManaText.width ; //player health location needs to be set again
				playerMana.y = playerManaBar.y - 3;
				
				playerManaBar = new Image (new BitmapData(120 * GV.PLAYER_MANA_CURRENT / GV.PLAYER_MANA_MAX, 20, false, 0x2222cc)); //update health bar graphic
				playerManaBar.y = 25;
				
				unitFrameGraphicList =  new Graphiclist(playerHealthBar, playerManaBar, playerHealthText, playerManaText, playerHealth, playerMana) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
			}
			super.update();
		}
	}

}