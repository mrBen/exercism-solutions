class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder cleaned = new StringBuilder();

        boolean nextIsUpper = false;
        for (char ch : identifier.toCharArray()) {
            char toAppend = ch;

            if (nextIsUpper) {
                nextIsUpper = false;
                toAppend = Character.toUpperCase(toAppend);
            }

            if (Character.isWhitespace(ch)) {
                toAppend = '_';
            }

            if (ch == '-') {
                nextIsUpper = true;
                continue;
            }

            if (ch == '4') {
                toAppend = 'a';
            }
            if (ch == '3') {
                toAppend = 'e';
            }
            if (ch == '0') {
                toAppend = 'o';
            }
            if (ch == '1') {
                toAppend = 'l';
            }
            if (ch == '7') {
                toAppend = 't';
            }

            if (!Character.isLetter(toAppend) && toAppend != '_') {
                continue;
            }

            cleaned.append(toAppend);
        }
        return cleaned.toString();
    }
}
