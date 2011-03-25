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
	public class TargetUnitFrame extends Entity 
	{
		protected var targetHealthBar:Image;
		protected var targetManaBar:Image;
		protected var unitFrameGraphicList:Graphiclist;
		
		protected var targetHealthText:Text;
		protected var targetManaText:Text;
		protected var targetHealth:Text;
		protected var targetMana:Text;
		
		public function TargetUnitFrame() 
		{
			targetHealthBar = Image.createRect(120, 20, 0xcc2222); //set target health bar graphic
			
			targetManaBar = Image.createRect(120, 20, 0x2222cc); //set target mana bar graphic
			
			targetManaBar.y = 25;
			
			targetHealth = new Text (String(GV.PLAYER_HEALTH_CURRENT)); //set target health text to global target health variable
			targetHealth.x = targetHealthBar.x - 5 - targetHealth.width;
			targetHealth.y = targetHealthBar.y - 3;
			targetHealthText = new Text ("HP:"); //set target health bar text
			targetHealthText.x = targetHealth.x - targetHealthText.width;
			targetHealthText.y = targetHealthBar.y - 3;

			
			targetMana = new Text (String(GV.PLAYER_MANA_CURRENT)); //set target mana text to global target mana variable
			targetMana.x = targetManaBar.x - 5 - targetMana.width;
			targetMana.y = targetManaBar.y - 3;
			targetManaText = new Text ("MP:"); //set target mana bar text
			targetManaText.x = targetMana.x - targetManaText.width;
			targetManaText.y = targetManaBar.y - 3;
			
			
			unitFrameGraphicList = new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana) //set which graphics to draw
			
			graphic = unitFrameGraphicList; //draw graphics
			
			this.x = FP.screen.width - targetHealthBar.width - FP.screen.width / 40; //set co-ordinates of unit frame
			this.y = FP.screen.height / 6;
			
		}
		
		override public function update():void 
		{
			if (targetHealth.text != String(GV.PLAYER_HEALTH_CURRENT)) //if the target health has changed
			{
				targetHealth = new Text (String(GV.PLAYER_HEALTH_CURRENT)); //update target health text
				targetHealth.x = targetHealthText.x + targetHealthText.width ; //target health location needs to be set again
				targetHealth.y = targetHealthBar.y - 3;
				
				targetHealthBar.scaleX = GV.PLAYER_HEALTH_CURRENT / GV.PLAYER_HEALTH_MAX;
				
				unitFrameGraphicList =  new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
			}
			
			if (targetMana.text != String(GV.PLAYER_MANA_CURRENT)) //if the target mana has changed
			{
				targetMana = new Text (String(GV.PLAYER_MANA_CURRENT)); //update target mana text
				targetMana.x = targetManaText.x + targetManaText.width ; //target mana location needs to be set again
				targetMana.y = targetManaBar.y - 3;
				
				targetManaBar.scaleX = GV.PLAYER_MANA_CURRENT / GV.PLAYER_MANA_MAX;
				targetManaBar.y = 25;
				
				unitFrameGraphicList =  new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
			}
			super.update();
		}
	}

}