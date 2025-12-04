public class LogLine {
    LogLevel level;
    String message;

    public LogLine(String logLine) {
        int sep = logLine.indexOf(":");
        switch (logLine.substring(1, sep - 1)) {
            case "TRC":
                level = LogLevel.TRACE;
                break;
            case "DBG":
                level = LogLevel.DEBUG;
                break;
            case "INF":
                level = LogLevel.INFO;
                break;
            case "WRN":
                level = LogLevel.WARNING;
                break;
            case "ERR":
                level = LogLevel.ERROR;
                break;
            case "FTL":
                level = LogLevel.FATAL;
                break;
            default:
                level = LogLevel.UNKNOWN;
        }
        message = logLine.substring(sep + 1).strip();
    }

    public LogLevel getLogLevel() {
        return level;
    }

    public String getOutputForShortLog() {
        return String.format("%d:%s", level.intValue(), message);
    }
}
