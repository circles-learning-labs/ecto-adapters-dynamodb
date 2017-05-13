defmodule Ecto.Adapters.DynamoDB.TestSchema.Person do
  use Ecto.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "person" do
    field :first_name, :string
    field :last_name,  :string
    field :age,        :integer
    field :email,      :string
    field :password,   :string
    field :circles,    {:array, :string}
  end

  def changeset(person, params \\ %{}) do
    person
    |> Ecto.Changeset.cast(params, [:first_name, :last_name, :age ])
    |> Ecto.Changeset.validate_required([:first_name, :last_name])
  end
end
