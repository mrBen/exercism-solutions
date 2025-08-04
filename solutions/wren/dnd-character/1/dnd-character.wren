import "random" for Random

var Rand = Random.new()

class Util {
  static abilityModifier(n) {
    if (n < 3) {
      Fiber.abort("Ability scores must be at least 3")
    } else if (n > 18) {
      Fiber.abort("Ability scores can be at most 18")
    }
    return ((n - 10) / 2).floor
  }
}

class Character {
  static rollAbility() {
    var dices = []
    for (i in 0...4) {
      dices.add(Rand.int(6) + 1)
    }
    dices = dices.sort()
    return dices[1] + dices[2] + dices[3]
  }

  construct new() {
    _strength = Character.rollAbility()
    _dexterity = Character.rollAbility()
    _constitution = Character.rollAbility()
    _intelligence = Character.rollAbility()
    _wisdom = Character.rollAbility()
    _charisma = Character.rollAbility()
    _hitpoints = 10 + Util.abilityModifier(constitution)
  }

  strength { _strength }
  dexterity { _dexterity }
  constitution { _constitution }
  intelligence { _intelligence }
  wisdom { _wisdom }
  charisma { _charisma }
  
  hitpoints { _hitpoints }
}
