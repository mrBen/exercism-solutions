import java.util.HashSet;
import java.util.List;
import java.util.Set;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) {
        Set<String> set = new HashSet<>();
        for (String card : cards) {
            set.add(card);
        }
        return set;
    }

    static boolean addCard(String card, Set<String> collection) {
        return collection.add(card);
    }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
        boolean canTrade = false;
        for (String card : myCollection) {
            if (!theirCollection.contains(card))
                canTrade = true;
        }
        if (!canTrade)
            return false;
        for (String card : theirCollection) {
            if (!myCollection.contains(card))
                return true;
        }
        return false;
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        Set<String> commonCards = new HashSet<>();
        boolean first = true;
        for (Set<String> cards : collections) {
            if (first) {
                for (String card : cards) {
                    commonCards.add(card);
                }
                first = false;
                continue;
            }

            Set<String> newCommonCards = new HashSet<>();
            for (String card : cards) {
                if (commonCards.contains(card))
                    newCommonCards.add(card);
            }
            commonCards = newCommonCards;
        }
        return commonCards;
    }

    static Set<String> allCards(List<Set<String>> collections) {
        Set<String> cards = new HashSet<>();
        for (Set<String> collection : collections) {
            for (String card : collection) {
                cards.add(card);
            }
        }
        return cards;
    }
}
