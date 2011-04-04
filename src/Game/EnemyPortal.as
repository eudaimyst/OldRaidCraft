package Game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class EnemyPortal extends Entity 
	{
		public var portalImage:Image;
		
		public function EnemyPortal(x:Number, y:Number) 
		{
			super(x, y);
			
			portalImage = new Image(GC.GFX_ENEMY_PORTAL);
			portalImage.scale = 2;
			
			graphic = portalImage
			
			
		}
		
	}

}