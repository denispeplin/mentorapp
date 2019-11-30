defmodule UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """
  require Logger

  alias Ueberauth.Auth

  def find_or_create(%Auth{} = auth) do
    {:ok, basic_info(auth)}
  end

  defp basic_info(%{info: info} = auth) do
    %{
      id: auth.uid,
      name: info.name,
      nickname: info.nickname,
      description: info.description,
      avatar: avatar_from_auth(auth)
    }
  end

  defp avatar_from_auth(%{info: %{urls: %{avatar_url: image}}}), do: image
end
