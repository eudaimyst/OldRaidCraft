package HUD 
{
	import adobe.utils.CustomActions;
	import Levels.CameraMover;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import MouseCursorEntity;
	import HUD.SpellButton;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUD extends Entity 
	{
		protected var ActionbarButton1:Entity;
		protected var ActionbarButton2:Entity;
		protected var ActionbarButton3:Entity;
		protected var ActionbarButton4:Entity;
		protected var ActionbarButton5:Entity;
		protected var ActionbarButton6:Entity;
		
		protected var PlayerUnitFrame1:Entity;
		protected var TargetUnitFrame1:Entity;
		
		protected var MouseCursor1:MouseCursorEntity;
		
		protected var getAbLocX:Boolean;
		
		
		
		public function HUD() 
		{
			getAbLocX = false;
		}
		override public function added():void 
		{
			ActionbarButton1 = new HUD.SpellButton(GV.CHOSEN_SPELL_1, 1, 0, 0);
			ActionbarButton2 = new HUD.SpellButton(GV.CHOSEN_SPELL_2, 2, 0, 0);
			ActionbarButton3 = new HUD.SpellButton(GV.CHOSEN_SPELL_3, 3, 0, 0);
			ActionbarButton4 = new HUD.SpellButton(GV.CHOSEN_SPELL_4, 4, 0, 0);
			ActionbarButton5 = new HUD.SpellButton(GV.CHOSEN_SPELL_5, 5, 0, 0);
			ActionbarButton6 = new HUD.SpellButton(GV.CHOSEN_SPELL_6, 6, 0, 0);
			
			this.world.add (ActionbarButton1);//add spell button with spell name, spell actionbar number, and grid location(used for spell select)
			this.world.add (ActionbarButton2);
			this.world.add (ActionbarButton3);
			this.world.add (ActionbarButton4);
			this.world.add (ActionbarButton5);
			this.world.add (ActionbarButton6);
			
			PlayerUnitFrame1 = new HUD.PlayerUnitFrame()
			this.world.add (PlayerUnitFrame1);
			
			TargetUnitFrame1 = new HUD.TargetUnitFrame()
			this.world.add (TargetUnitFrame1);
			
			MouseCursor1 = new MouseCursorEntity()
			this.world.add (MouseCursor1);
			
			super.added();
		}
		
		override public function update():void 
		{
			if (CameraMover.playerIsMoving == true)
			{
				//move Actionbarbutton's to camera's location if the player is moving (will hopefully clean up later)
				SpellButton.abXd = CameraMover.moveDistanceX;
				SpellButton.abYd = CameraMover.moveDistanceY;
				
				PlayerUnitFrame1.x += CameraMover.moveDistanceX;
				PlayerUnitFrame1.y += CameraMover.moveDistanceY;
				
				TargetUnitFrame1.x += CameraMover.moveDistanceX;
				TargetUnitFrame1.y += CameraMover.moveDistanceY;
				
				MouseCursorEntity.mouseLocX += CameraMover.moveDistanceX;
				MouseCursorEntity.mouseLocY += CameraMover.moveDistanceY;
			}
			super.update();
		}
		
	}

}