defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      :fatal -> :ops
      :error -> :ops
      :unknown -> cond do
        legacy? == true -> :dev1
        legacy? == false -> :dev2
      end
      _ -> false
    end
  end
end
