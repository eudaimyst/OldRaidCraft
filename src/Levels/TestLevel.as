package Levels 
{
	import Game.Enemy;
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
			
			add (new Enemy("Enemy1", 500, 100, 300, 300));
			add (new Enemy("Enemy2", 500, 100, 400, 300));
			add (new Enemy("Enemy3", 500, 100, 500, 300));
			
			add (new Player());
			
			
			
		}
		
		override public function begin():void 
		{
			add (new MouseCursorEntity());
			super.begin();
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}