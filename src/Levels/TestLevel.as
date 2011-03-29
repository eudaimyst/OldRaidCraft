package Levels 
{
	import Game.Enemy;
	import Game.EnemyDragon;
	import Game.EnemyMonster;
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
			
			add (new EnemyDragon(300, 300));
			add (new EnemyMonster(400, 300));
			add (new EnemyDragon(500, 300));
			
			add (new Player());
			
			add (new GroundLayer(GC.TILEMAP_TEST_LEVEL));
			
		}
		
		override public function begin():void 
		{
			super.begin();
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}