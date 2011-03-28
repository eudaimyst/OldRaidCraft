package HUD 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUDMessage extends HUDEntity 
	{
		public var i:int = 0;
		public var message:Text;
		
		public function HUDMessage(messageText:String) 
		{
			message = new Text(messageText);
			message.color = (0xFF0000);
			graphic = message;
			graphic.scrollX = 0;
			graphic.scrollY = 0;

		}
		
		override public function added():void 
		{
			super.added();
			this.x = FP.screen.width / 2 - message.width/2;
			this.y = FP.screen.height / 2;
			
		}
		
		override public function update():void 
		{
			super.update();
			i++
			
			if (i > 10)
			{
				message.alpha -= .1;
				if (i>20) this.world.remove (this);
			}
		}
		
	}

}