package Menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image
	import flash.display.BitmapData
	import net.flashpunk.World
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class OptionsMenu extends Entity 
	{
		protected var Blackout:Image;
		protected var WhiteBox:Image;
		protected var OptionsGraphics:Graphiclist;
		
		public function OptionsMenu() 
		{
			
			Blackout = new Image (new BitmapData(FP.screen.width, FP.screen.height, false, 0x000000));
			WhiteBox = new Image (new BitmapData(FP.screen.width * .75, FP.screen.height * .75, false, 0xffffff));
			
			Blackout.alpha = .7;
			WhiteBox.x = FP.screen.width * 1 / 8;
			WhiteBox.y = FP.screen.height * 1 / 8;
			this.setHitbox (FP.screen.width, FP.screen.height);
			
			OptionsGraphics = new Graphiclist(Blackout, WhiteBox);
			this.graphic = OptionsGraphics;
		}
		
		override public function added():void 
		{
			this.world.add (new MenuButton("options menu", -2));
			
			super.added();
		}
		
		override public function update():void 
		{
			
			super.update();
		}
	}

}