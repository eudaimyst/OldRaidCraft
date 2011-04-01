package  
{
	import Game.Player;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import Spells.Arcane;
	import Spells.Death;
	import Spells.Fireball
	import Game.Enemy
	import Spells.Frost;
	/**
	 * ...
	 * @author skipgamer
	 * 
	 */
	public class GV 
	{
		public static var PLAYER_HEALTH_CURRENT:int = 0;
		public static var PLAYER_MANA_CURRENT:int = 0;
		public static var PLAYER_HEALTH_MAX:int = 0;
		public static var PLAYER_MANA_MAX:int = 0;
		public static var PLAYER_MOVE_SPEED:int = 60;
		public static var PLAYER_IS_CASTING:Boolean = false;
		
		public static var GLOBAL_COOLDOWN_TIME:Number = .5;
		
		public static var CHOSEN_SPELL_1:Class = Fireball;
		public static var CHOSEN_SPELL_2:Class = Arcane;
		public static var CHOSEN_SPELL_3:Class = Death;
		public static var CHOSEN_SPELL_4:Class = Frost;
		public static var CHOSEN_SPELL_5:Class = Fireball;
		public static var CHOSEN_SPELL_6:Class = Fireball;
		
		public static var BINDING_ACTIONBAR_1:int = 49;
		public static var BINDING_ACTIONBAR_2:int = 50;
		public static var BINDING_ACTIONBAR_3:int = 51;
		public static var BINDING_ACTIONBAR_4:int = 52;
		public static var BINDING_ACTIONBAR_5:int = 53;
		public static var BINDING_ACTIONBAR_6:int = 54;
		public static var BINDING_ACTIONBAR_7:int = 55;
		public static var BINDING_ACTIONBAR_8:int = 56;
		public static var BINDING_ACTIONBAR_9:int = 57;
		public static var BINDING_ACTIONBAR_10:int = 48;
		
		public static var BLAH:int = 0;
		
		public static var TARGETED_ENEMY:Enemy;
		public static var PLAYER_ENTITY:Player;
		
	}

}