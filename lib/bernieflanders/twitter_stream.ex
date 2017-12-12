require IEx;

defmodule Bernieflanders.Twitterstream do
  def stream(handles) do
    IO.puts "Starting Twitter Stream"

    userIds = twitterIds(handles)

    # Stream tweets from given user
    ExTwitter.stream_filter(follow: Enum.join(userIds, ","))
    # Filter tweets
    |> Stream.filter(&(filterTweet(&1, userIds)))
    # Expand tweets with REST Api
    |> Stream.map(&(ExTwitter.show(&1.id, tweet_mode: "extended")))
    # Translate Tweet to Ned Flanders
    |> Stream.map(&(Bernieflanders.Translator.translate(&1.full_text)))
    # Truncate Tweet to fit Twitter's Rules
    |> Stream.map(&(String.slice(&1, 0..278)))
    # Tweet
    |> Stream.map(&(ExTwitter.update(&1)))
    |> Enum.to_list
  end

  defp twitterIds(handles) do
    handles
    |> Enum.map(&(ExTwitter.user(&1)))
    |> Enum.map(&(&1.id))
  end

  # Remove retweets
  defp filterTweet(%{text: "RT" <> _}, _), do: false

  # Remove mentions and replies
  defp filterTweet(%{user: %{id: id}}, userIds), do: Enum.member?(userIds, id)

  # Remove anything else
  defp filterTweet(_, _), do: false
end
