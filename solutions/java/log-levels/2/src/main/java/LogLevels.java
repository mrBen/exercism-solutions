public class LogLevels {

    public static String message(String logLine) {
        return logLine.substring(logLine.indexOf(':') + 1).strip();
    }

    public static String logLevel(String logLine) {
        String level = logLine.substring(1, logLine.indexOf(':') - 1);
        return level.toLowerCase();
    }

    public static String reformat(String logLine) {
        return message(logLine) + " (" + logLevel(logLine) + ")";
    }
}
