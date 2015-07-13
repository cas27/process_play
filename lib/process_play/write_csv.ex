defmodule ProcessPlay.WriteCSV do
  Faker.start

  def run(path) do
    file = File.open!(path, [:write])
    #[["Bob", "123 Water St"], ["Larry", "453 Earth Rd"]]
    generate_data
    |> CSV.encode
    |> Enum.each (&IO.write(file, &1))
  end

  def generate_data do
    for x <- 1..100_000, do: [Faker.Name.name, Faker.Address.street_address, Faker.Company.bs]
  end

  def p_generate_data do
    me = self
    Enum.map(1..100_000, fn (_) ->
      spawn_link fn -> (send me, {self, [Faker.Name.name, Faker.Address.street_address, Faker.Company.bs]}) end
    end)
    |> Enum.map(fn (pid) ->
      receive do { ^pid, result } -> result end
    end)
  end
end
