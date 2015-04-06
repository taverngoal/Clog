defmodule Clog.Services.Toolkit do

  @doc """
    from https://gist.github.com/10nin/5713366
  """
  def md5(s) do
    :crypto.hash(:md5, s)
          |> :erlang.bitstring_to_list
          |> Enum.map(&(:io_lib.format("~2.16.0b", [&1])))
          |> List.flatten
          |> :erlang.list_to_bitstring
  end

  # def authorized?(conn) do
  #   if get_session(conn, :user) == true, do: true, else: false
  # end
end
