defmodule Bernieflanders.Translator do
  def regexReplace(text, locationRegex, replacement) do
    Regex.replace(locationRegex, text, replacement)
  end

  def translate(text) do
    text
    |> regexReplace(~r/\bhi\b/iu, "hi diddly ho")
    |> regexReplace(~r/\bhello\b/iu, "hi diddly ho")
    |> regexReplace(~r/\bde([a-zA-Z]+)/iu, "de-diddly-\\0")
    |> regexReplace(~r/\b([a-zA-Z]?)el([a-zA-Z]+)/iu, "\\1el-diddly-el\\2")
    |> regexReplace(~r/\bde([a-zA-Z]+)/iu, "diddly ding dong \\0")
    |> regexReplace(~r/\bsq([a-zA-Z]+)/iu, "squibbily-sq\\1")
    |> regexReplace(~r/\br([a-zA-Z]+)/iu, "riddly-r\\1")
    |> regexReplace(~r/([a-zA-Z]+)ility\b/iu, "\\1ilitydility")
    |> regexReplace(~r/([a-zA-Z]+)oos\b/iu, "\\1oosies")
    |> regexReplace(~r/([a-zA-Z]+)b\b/iu, "\\1berino")
    |> regexReplace(~r/([a-zA-Z]+)ch\b/iu, "\\1charoo")
    |> regexReplace(~r/([a-zA-Z]+)bour\b/iu, "\\1bourino")
    |> regexReplace(~r/([a-zA-Z]+)cks\b/iu, "\\1ckeroos")
    |> regexReplace(~r/([a-zA-Z]+)er\b/iu, "\\1eroo")
    |> regexReplace(~r/([a-zA-Z]+)eed\b/iu, "\\1eedily-noodily")
    |> regexReplace(~r/\bgood\b/iu, "dandy")
    |> regexReplace(~r/\bman\b/iu, "fella")
    |> regexReplace(~r/\bstupid\b/iu, "silly")
  end
end
