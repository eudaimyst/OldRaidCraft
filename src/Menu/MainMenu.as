package Menu 
{
	import flash.ui.MouseCursor;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	import net.flashpunk.graphics.Image
	import net.flashpunk.utils.Input
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MainMenu extends World 
	{
		protected var gameVersion:Text;
		
		
		public function MainMenu():void
		{
			super(); //not sure what this does, but it needs to be here.
			
			
			add (new TitleGraphic());
			add (new MenuButton(GC.TEXT_PLAY_BUTTON, 1));
			add (new MenuButton(GC.TEXT_OPTIONS_BUTTON, 2));
			add (new MenuButton(GC.TEXT_EXIT_BUTTON, 4));
			
			Text.size = 24;
			
			//game version
			gameVersion = new Text(GC.TEXT_GAME_VERSION,10,10);
			addGraphic(gameVersion);
			
			
			
			
			trace ("Menu loaded");
			
			add (new MouseCursorEntity());
			
		}
		
		override public function update():void 
		{
			super.update();
			
			//on mouse press fire mouse flash entity
			if (Input.mousePressed)
			{
				
			}
		}
		
		
	}

}