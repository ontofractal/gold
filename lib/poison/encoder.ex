if Code.ensure_loaded?(Poison) and not Module.defines?(Elixir.Poison.Encoder.Decimal, {:encode, 2}) do
  defimpl Poison.Encoder, for: Decimal do
    @doc """
    Implements custom Decimal encoder that allows serialization of Decimal objects
    into JSON using Poison.
    Definition copied from Ecto
    """
    def encode(decimal, _opts), do: <<?", Decimal.to_string(decimal)::binary, ?">>
  end
end