class Fighter {

    boolean isVulnerable() {
        return true;
    }

    int getDamagePoints(Fighter fighter) {
        return 1;
    }
}

class Warrior extends Fighter {

    @Override
    public String toString() {
        return "Fighter is a Warrior";
    }

    @Override
    boolean isVulnerable() {
        return false;
    }

    @Override
    int getDamagePoints(Fighter fighter) {
        return fighter.isVulnerable() ? 10 : 6;
    }
}

class Wizard extends Fighter {
    boolean haveSpellInAdvance = false;

    @Override
    public String toString() {
        return "Fighter is a Wizard";
    }

    void prepareSpell() {
        haveSpellInAdvance = true;
    }

    @Override
    boolean isVulnerable() {
        return !haveSpellInAdvance;
    }

    @Override
    int getDamagePoints(Fighter fighter) {
        return haveSpellInAdvance ? 12 : 3;
    }
}
