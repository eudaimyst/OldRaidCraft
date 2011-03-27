package 
{
	
	import Menu.MainMenu;
	import net.flashpunk.Engine;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Main extends Engine
	{
		public function Main():void 
		{
			trace("engine loaded");
			super(800, 600, 30, false);
			FP.world = new MainMenu;
			//FP.console.enable();
			
		}
		
		override public function init():void 
		{
			super.init();
			trace("main initialisation");
		}
		
	}
	
}