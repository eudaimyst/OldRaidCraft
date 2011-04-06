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
	import HUD.HUDTimer;
	
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
		
		public var waveActive:Boolean = false;
		
		public var currentWave:Number = 0;
		
		
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
		
		public function Wave1():void
		{
			if (waveActive == false) //if the wave has only just started
			{
				SpawnEnemy();
				add (new HUD.HUDMessage("Wave 1: 1 enemy"));
				waveActive = true; //wave has started
			}
		}
		
		public function Wave2():void
		{
			if (waveActive == false) //if the wave has not started
			{
				SpawnEnemy();
				SpawnEnemy();
				add (new HUD.HUDMessage("Wave 2: 2 enemies"));
				waveActive = true; //wave has started
			}
		}
		
		public function Wave3():void
		{
			if (waveActive == false) //if the wave has not started
			{
				SpawnEnemy();
				SpawnEnemy();
				add (new HUD.HUDMessage("Wave 3: 2 enemies"));
				waveActive = true; //wave has started
			}
		}
		
		public function Wave4():void
		{
			if (waveActive == false) //if the wave has not started
			{
				SpawnEnemy();
				SpawnEnemy();
				SpawnEnemy();
				add (new HUD.HUDMessage("Wave 4: 3 enemies"));
				waveActive = true; //wave has started
			}
		}
		
		public function Wave5():void
		{
			if (waveActive == false) //if the wave has not started
			{
				SpawnEnemy();
				SpawnEnemy();
				SpawnEnemy();
				add (new HUD.HUDMessage("Wave 5: Boss Wave"));
				waveActive = true; //wave has started
			}
		}
		
		
		public function SpawnEnemy():void //spawns an enemy at a random portal location
		{
			trace("enemy spawned");
			var spawnLocationX:Number;
			var spawnLocationY:Number;
			
			//choose spawner
			var spawnRand:Number = FP.rand(3);
			
			switch (spawnRand)
			{
				case 0:
				spawnLocationX = enemyPortal1.x;
				spawnLocationY = enemyPortal1.y;
				break;
				
				case 1:
				spawnLocationX = enemyPortal2.x;
				spawnLocationY = enemyPortal2.y;
				break;
				
				case 2:
				spawnLocationX = enemyPortal3.x;
				spawnLocationY = enemyPortal3.y;
				break;
				
				case 3:
				spawnLocationX = enemyPortal4.x;
				spawnLocationY = enemyPortal4.y;
				break;
			}
			add (new EnemyDragon(spawnLocationX, spawnLocationY));
		}
		
		override public function update():void 
		{
			super.update();
			
			trace(currentWave);
			switch (currentWave)
			{
				case 1: //wave 1
				Wave1();
				if (HUDTimer.hudTimerNum > 40)
				{
					currentWave++;
					waveActive = false;
				}
				break;
				
				case 2: //wave 2
				Wave2();
				if (HUDTimer.hudTimerNum > 120)
				{
					currentWave++;
					waveActive = false;
				}
				break;
				
				case 3: //wave 3
				Wave3();
				if (HUDTimer.hudTimerNum > 180)
				{
					currentWave++;
					waveActive = false;
				}
				break;
				
				case 4: //wave 4
				Wave4();
				if (HUDTimer.hudTimerNum > 240)
				{
					currentWave++;
					waveActive = false;
				}
				break;
				
				case 5: //wave 5
				Wave5();
				if (HUDTimer.hudTimerNum > 300)
				{
					currentWave++;
					waveActive = false;
				}
				break;
				
				default: //no wave
				if (HUDTimer.hudTimerNum > 2)
				{
					currentWave++;
				}
				
			}
			
			
		}
		
	}

}