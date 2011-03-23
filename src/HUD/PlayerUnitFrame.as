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
			playerHealthBar = new Image (new BitmapData(120, 20, false, 0xcc2222));
			
			playerManaBar = new Image (new BitmapData(120, 20, false, 0x2222cc));
			playerManaBar.y = 25;
			
			playerHealthText = new Text ("HP:");
			playerHealthText.x = playerHealthBar.width + 5;
			playerHealthText.y = playerHealthBar.y - 3;
			playerManaText = new Text ("MP:");
			playerManaText.x = playerManaBar.width + 5;
			playerManaText.y = playerManaBar.y - 3;
			
			
			playerHealth = new Text (String(GV.PLAYER_HEALTH_CURRENT));
			playerHealth.x = playerHealthBar.width + playerHealthText.width + 5;
			playerHealth.y = playerHealthBar.y - 3;
			playerMana = new Text (String(GV.PLAYER_MANA_CURRENT));
			playerMana.x = playerManaBar.width + playerManaText.width + 5;
			playerMana.y = playerManaBar.y - 3;
			
			
			unitFrameGraphicList = new Graphiclist(playerHealthBar, playerManaBar, playerHealthText, playerManaText, playerHealth, playerMana)
			
			graphic = unitFrameGraphicList;
			
			this.x = 10;
			this.y = 345;
			
			GV.PLAYER_HEALTH_CURRENT;
			
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}