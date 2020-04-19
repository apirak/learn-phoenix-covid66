defmodule Covic66Web.VirusController do
  use Covic66Web, :controller
  alias Covic66.Wiki
  alias Covic66.Info.Virus

  def index(conn, _params) do
    viruses = Wiki.get_viruses
    render(conn, "index.html", viruses: viruses)
  end

  def show(conn, %{"code" => code}) do
    virus = Wiki.get_virus_by_code(code)
    render(conn, "show.html", virus: virus)
  end
  
  def delete(conn, %{"code" => code}) do
    {:ok, info} = Wiki.delete_virus(code)
  
    conn
    |> put_flash(:info, "Virus deleted successfully.")
    |> redirect(to: Routes.virus_path(conn, :index))
  end  

  def edit(conn, %{"code" => code}) do
    virus = Wiki.get_virus_by_code(code)
    update_virus = Wiki.change_virus(virus)
    render(conn, "form.html", virus: update_virus)
  end

  # def update(conn, %{"virus" => virus_params}) do

  # end

  def new(conn, _params) do
    #why name changeset from first plact
    changeset = Wiki.changeset(%Virus{}) 
    render(conn, "form.html", changeset: changeset)
  end

  def create(conn, %{"virus" => virus_params}) do
    {:ok, info} = Wiki.create_virus(virus_params)

    conn
    |> put_flash(:info, "created!")
    |> redirect(to: Routes.virus_path(conn, :index))
  end
end