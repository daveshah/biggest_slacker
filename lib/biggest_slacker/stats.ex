defmodule BiggestSlacker.Stats do

  def users_to_message_counts(list_of_history) do
    list_of_history
    |> Enum.reduce(%{}, &(add_match(&1, &2)))
    |> Enum.sort(fn({_, v1}, {_, v2}) -> v1 > v2 end)
  end

  defp add_match(%{user: user}, map) do
    Map.update(map, user, 1, &(&1 + 1))
  end
end
