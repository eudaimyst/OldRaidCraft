package HUD 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import MouseCursorEntity;
	import Spells.Fireball;
	//import HUD.SpellButton;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUD extends Entity 
	{
		
		protected var PlayerUnitFrame1:Entity;
		protected var TargetUnitFrame1:Entity;
		protected var ActionBarSpell1:Entity;
		
		protected var MouseCursor1:MouseCursorEntity;
		
		private var i:Number = 0;
		
		public function HUD() 
		{
			
		}
		override public function added():void 
		{
			
			PlayerUnitFrame1 = new HUD.PlayerUnitFrame()
			this.world.add (PlayerUnitFrame1);
			
			TargetUnitFrame1 = new HUD.TargetUnitFrame()
			this.world.add (TargetUnitFrame1);
			
			MouseCursor1 = new MouseCursorEntity()
			this.world.add (MouseCursor1);
			
			this.world.add (new HUD.ActionBarSpell());
			this.world.add (new HUD.ActionBarSpell());
			this.world.add (new HUD.ActionBarSpell());
			this.world.add (new HUD.ActionBarSpell());
			this.world.add (new HUD.ActionBarSpell());
			this.world.add (new HUD.ActionBarSpell());
			
			this.world.add (new GV.CHOSEN_SPELL_1(1));
			
			this.world.add (new GV.CHOSEN_SPELL_2(2));
			/*
			this.world.add (new GV.CHOSEN_SPELL_3(3));
			this.world.add (new GV.CHOSEN_SPELL_4(4));
			this.world.add (new GV.CHOSEN_SPELL_5(5));
			this.world.add (new GV.CHOSEN_SPELL_6(6));
			*/
			
			super.added();
			
		}
		
	}

}