defmodule Covic66.Wiki do
  alias Covic66.Repo
  alias Covic66.Info.Virus

  def get_viruses do
    # Repo.all(Virus)
    Virus |> Repo.all()
  end

  def get_virus_by_code(code) do
    # Repo.get_by(Virus, code: code)
    Virus |> Repo.get_by(code: code)
  end

  def delete_virus(code) do
    Virus
    |> Repo.get_by(code: code)
    |> Repo.delete()
  end

  # def update_virus(attr \\ %{}) do
  #   %Virus{}
  #   |> Virus.changeset(attrs)
  #   |> Repo.update
  # end

  def create_virus(attrs \\ %{}) do
    %Virus{}
    |> Virus.changeset(attrs)
    |> Repo.insert
  end

  def changeset(%Virus{}=virus) do
    Virus.changeset(virus, %{})
  end
   
end
