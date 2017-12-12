require IEx;

defmodule Bernieflanders.Twitterstream do
  def stream(handles) do
    IO.puts "Starting Twitter Stream"
    userIds = handles
    |> Enum.map(&(ExTwitter.user(&1)))
    |> Enum.map(fn user -> user.id end)

    # Stream tweets from given user
    ExTwitter.stream_filter(follow: Enum.join(userIds, ","))
    # Filter tweets
    |> Stream.filter(&(filterTweet(&1, userIds)))
    # Expand tweets with REST Api
    |> Stream.map(fn tweet -> ExTwitter.show(tweet.id, tweet_mode: "extended") end)
    # Translate Tweet to Ned Flanders
    |> Stream.map(fn %{full_text: text} -> Bernieflanders.Translator.translate(text) end)
    # Truncate Tweet to fit Twitter's Rules
    |> Stream.map(fn translatedText -> String.slice(translatedText, 0..278) end)
    # Tweet
    |> Stream.map(fn translatedText -> ExTwitter.update(translatedText) end)
    |> Enum.to_list
  end

  defp filterTweet(%{text: text, user: %{id: userId}}, userIds) do
    Enum.member?(userIds, userId) && !String.starts_with?(text, "RT")
  end

  defp filterTweet(_, _), do: false
end
