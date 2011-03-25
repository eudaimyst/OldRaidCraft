package Game 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellCast extends Entity 
	{
		protected var spellcastName:String
		
		public function SpellCast(spellcastName:String):void 
		{
			trace(spellcastName);
		}
		
		
	}

}