package Levels 
{
	import Game.Enemy;
	import Game.EnemyDragon;
	import Game.EnemyMonster;
	import Game.EnemyPortal;
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
		public var enemyPortal1:EnemyPortal = new EnemyPortal(800, 300);
		public var enemyPortal2:EnemyPortal = new EnemyPortal(1350, 650);
		public var enemyPortal3:EnemyPortal = new EnemyPortal(800, 950);
		public var enemyPortal4:EnemyPortal = new EnemyPortal(250, 650);
		
		public var waveNumber:Number = 0;
		
		
		public function TestLevel() 
		{	
			add (new HUD.HUDTimer());
			
			add (enemyPortal1);
			add (enemyPortal2);
			add (enemyPortal3);
			add (enemyPortal4);
			
			add (new HUD());
			
			
			add (new Player(800, 650));
			
			add (new GroundLayer(GC.TILEMAP_TEST_LEVEL));
			
		}
		
		
		override public function begin():void 
		{
			super.begin();
			
			add (new HUD.HUDMessage("blah"));
		}
		
		override public function update():void 
		{
			super.update();
			
			
			
		}
		
	}

}