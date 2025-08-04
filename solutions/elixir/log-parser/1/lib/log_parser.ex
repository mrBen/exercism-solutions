defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    Regex.split(~r/\<[~\*=-]*\>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line[0-9]+/i, line, "")
  end

  def tag_with_user_name(line) do
    r = ~r/(?<l>.*User\s+(?<u>\S+)\s*.*)/
    if line =~ r do
      "[USER] " <> Regex.named_captures(r, line)["u"] <> " " <> Regex.named_captures(r, line)["l"]
    else
      line
    end
  end
end
