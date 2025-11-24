class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder cleaned = new StringBuilder();

        boolean nextIsUpper = false;
        for (char ch : identifier.toCharArray()) {
            if (nextIsUpper) {
                ch = Character.toUpperCase(ch);
                nextIsUpper = false;
            }

            if (Character.isLetter(ch))
                cleaned.append(ch);
            else if (Character.isWhitespace(ch))
                cleaned.append('_');
            else if (ch == '-')
                nextIsUpper = true;
            else if (ch == '4')
                cleaned.append('a');
            else if (ch == '3')
                cleaned.append('e');
            else if (ch == '0')
                cleaned.append('o');
            else if (ch == '1')
                cleaned.append('l');
            else if (ch == '7')
                cleaned.append('t');

        }
        return cleaned.toString();
    }
}
