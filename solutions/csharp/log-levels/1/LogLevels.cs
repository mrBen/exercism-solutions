using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        string[] parts = logLine.Split(":");
        return parts[1].Trim();
    }

    public static string LogLevel(string logLine)
    {
        string[] parts = logLine.Split(":");
        return parts[0].Substring(1, parts[0].Length - 2).ToLower();
    }

    public static string Reformat(string logLine)
    {
        return Message(logLine) + " (" + LogLevel(logLine) + ")";
    }
}
