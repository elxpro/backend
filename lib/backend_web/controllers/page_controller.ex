defmodule BackendWeb.PageController do
  use BackendWeb, :controller

  def index(conn, _params) do
    pid = self |> :erlang.pid_to_list() |> to_string
    render(conn, "index.html", process_id: pid)
  end
end
