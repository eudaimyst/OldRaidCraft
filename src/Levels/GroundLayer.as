package Levels 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class GroundLayer extends Entity 
	{
		protected var groundImage:Image;
		
		
		public function GroundLayer() 
		{
			
			groundImage = new Image(GC.GFX_GROUND);
			
			groundImage.scale = 2;
			
			this.x = 0;
			this.y = 0;
			
			graphic = groundImage;
			
		}
		
		override public function added():void 
		{
			super.added();
			this.layer = 5;
		}
		
		override public function update():void 
		{
			super.update();

		}
		
	}

}