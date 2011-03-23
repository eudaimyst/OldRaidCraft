package Levels 
{
	import Game.Player;
	import HUD.HUD;
	import Menu.MainMenu;
	import Menu.MenuButton;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class TestLevel extends World 
	{
		
		public function TestLevel() 
		{
			add (new MenuButton("this is a TestLevel", -2));
			
			add (new HUD());
			
			add (new MouseCursorEntity());
			
			add (new Player());
			
			
			
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}