package HUD 
{
	import flash.display.BitmapData;
	import Game.Enemy;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class TargetUnitFrame extends Entity 
	{
		protected var targetedEnemy2:Enemy
		protected var targetHealthBar:Image;
		protected var targetManaBar:Image;
		protected var unitFrameGraphicList:Graphiclist;
		
		protected var targetHealthText:Text;
		protected var targetManaText:Text;
		protected var targetHealth:Text;
		protected var targetMana:Text;
		protected var targetNameText:Text;
		protected var targetName:String;
		
		public function TargetUnitFrame(targetedEnemy:Enemy) 
		{
			targetedEnemy2 = targetedEnemy;
			trace("target unit frame loaded, target name: " + targetName);
			
			targetHealthBar = Image.createRect(120, 20, 0xcc2222); //set target health bar graphic
			targetHealthBar.scaleX = targetedEnemy2.enemyCurrentHealth / targetedEnemy2.enemyMaxHealth;
			
			targetManaBar = Image.createRect(120, 20, 0x2222cc); //set target mana bar graphic
			
			targetManaBar.y = 25;
			
			targetHealth = new Text (String(targetedEnemy.enemyCurrentHealth)); //set target health text to global target health variable
			targetHealth.x = targetHealthBar.x - 5 - targetHealth.width;
			targetHealth.y = targetHealthBar.y - 3;
			targetHealthText = new Text ("HP:"); //set target health bar text
			targetHealthText.x = targetHealth.x - targetHealthText.width;
			targetHealthText.y = targetHealthBar.y - 3;
			
			targetMana = new Text (String(targetedEnemy.enemyCurrentMana)); //set target mana text to global target mana variable
			targetMana.x = targetManaBar.x - 5 - targetMana.width;
			targetMana.y = targetManaBar.y - 3;
			targetManaText = new Text ("MP:"); //set target mana bar text
			targetManaText.x = targetMana.x - targetManaText.width;
			targetManaText.y = targetManaBar.y - 3;
			
			targetNameText = new Text ("Target: " + targetedEnemy.enemyName2);
			targetNameText.x = targetHealthBar.width - targetNameText.width;
			targetNameText.y = -targetNameText.height;
			
			unitFrameGraphicList = new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana, targetNameText) //set which graphics to draw
			
			graphic = unitFrameGraphicList; //draw graphics
			
			this.x = FP.camera.x + FP.screen.width - targetHealthBar.width - FP.screen.width / 40; //set co-ordinates of unit frame
			this.y = FP.camera.y + FP.screen.height / 6;
			
		}
		
		public function GetEnemy():Enemy
		{
			return targetedEnemy2;
		}
		
		override public function update():void 
		{
			
			this.x = FP.camera.x + FP.screen.width - targetHealthBar.width - FP.screen.width / 40; //set co-ordinates of unit frame
			this.y = FP.camera.y + FP.screen.height / 6;
			
			if (targetedEnemy2.enemyCurrentHealth < 1)
			{
				targetedEnemy2.enemyDead = true;
				this.world.remove (this);
				
			}
			if (Input.pressed(Key.ESCAPE))
			{
				this.world.remove(this);
			}
			if (Input.mousePressed)
			{
				this.world.remove(this);
			}
			
			if (targetHealth.text != String(targetedEnemy2.enemyCurrentHealth)) //if the target health has changed
			{
				targetHealth = new Text (String(targetedEnemy2.enemyCurrentHealth)); //update target health text
				targetHealth.x = targetHealthText.x + targetHealthText.width ; //target health location needs to be set again
				targetHealth.y = targetHealthBar.y - 3;
				
				targetHealthBar.scaleX = targetedEnemy2.enemyCurrentHealth / targetedEnemy2.enemyMaxHealth;
				trace (targetedEnemy2.enemyCurrentHealth);
				
				unitFrameGraphicList =  new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana, targetNameText) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
			}
			
			if (targetMana.text != String(targetedEnemy2.enemyCurrentMana)) //if the target mana has changed
			{
				targetMana = new Text (String(targetedEnemy2.enemyCurrentMana)); //update target mana text
				targetMana.x = targetManaText.x + targetManaText.width ; //target mana location needs to be set again
				targetMana.y = targetManaBar.y - 3;
				
				targetManaBar.scaleX = targetedEnemy2.enemyCurrentMana / targetedEnemy2.enemyMaxMana;
				targetManaBar.y = 25;
				
				unitFrameGraphicList =  new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana, targetNameText) //set which graphics to draw
				graphic = unitFrameGraphicList; //draw graphics
			}
			super.update();
		}
	}

}