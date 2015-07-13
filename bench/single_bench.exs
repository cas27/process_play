defmodule SingleBench do
  use Benchfella

  bench "generate 100k lists of data through Faker" do
    Faker.start
    ProcessPlay.WriteCSV.generate_data
  end
end
