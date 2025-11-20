import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LogLevels {
    private static final String LEVEL = "\\[(INFO|WARNING|ERROR)\\]:";

    public static String message(String logLine) {
        return logLine.replaceFirst(LEVEL, "").strip();
    }

    public static String logLevel(String logLine) {
        String level = "";
        Matcher matcher = Pattern.compile(LEVEL).matcher(logLine);
        if (matcher.find()) {
            level = matcher.group(1);
        }
        return level.toLowerCase();
    }

    public static String reformat(String logLine) {
        return message(logLine) + " (" + logLevel(logLine) + ")";
    }
}
