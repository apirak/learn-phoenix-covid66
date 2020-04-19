defmodule Covic66Web.PageController do
  use Covic66Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
