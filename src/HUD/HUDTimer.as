package HUD 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUDTimer extends Entity
	{
		static public var hudTimerNum:Number = 0;
		public var hudTimerText:Text;
		
		public function HUDTimer() 
		{
			hudTimerText = new Text("time:" + String(Math.round(hudTimerNum*10)/10));
			
			graphic = hudTimerText;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
		}
		
		override public function update():void 
		{
			super.update();
			
			hudTimerNum += FP.elapsed;
			
			hudTimerText = new Text("time:" + String(Math.round(hudTimerNum*100)/100));
			graphic = hudTimerText;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
		
	}

}