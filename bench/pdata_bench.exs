defmodule ParallelData do
  use Benchfella

  bench "generate 100k lists of data in parallel through faker" do
    Faker.start
    ProcessPlay.WriteCSV.p_generate_data
  end
end
