package Levels 
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class GroundLayer extends Entity 
	{
		protected var groundImage:Image;
		private var _tiles:Tilemap;
		private var lavaCollision:Grid;
		
		public function GroundLayer(xml:Class) 
		{
			_tiles = new Tilemap(GC.GFX_TILE_TEST, 1600, 1216, 32, 32);
			graphic = _tiles;
			layer = 5;
			
			lavaCollision = new Grid(1600, 1216, 32, 32, 0, 0);
			mask = lavaCollision;
			
			type = "lava";
			
			loadlevel(xml);
		}
		
		private function loadlevel(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			var xmlData:XML = new XML(dataString);
			
			var dataList:XMLList;
			var dataElement:XML;
			
			dataList = xmlData.OurTiles.tile;
			for each(dataElement in dataList)
			{
				_tiles.setTile(int(dataElement.@x) / 32, int(dataElement.@y) / 32, int(dataElement.@tx) / 32);
				lavaCollision.setTile(int(dataElement.@x) / 32, int(dataElement.@y) / 32, (int(dataElement.@tx) / 32 == 2));
			}
			
		}
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function update():void 
		{
			super.update();

		}
		
	}

}