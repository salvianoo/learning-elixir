ExUnit.start

defmodule ProcessMovies do
  def nineties(movies) do
    movies
      |> Enum.filter(&(&1[:year_release] >= 1990 and &1[:year_release] <= 1999))
  end

  def get_rank_and_title(movies) do
    movies
      |> Enum.map &("#{&1[:rank]} - #{&1[:title]}")
  end

  def score_over_eight(movies) do
    movies
      |> Enum.filter &(&1[:rating] >= 8.0)
  end

  def get_title(movies) do
    movies
      |> Enum.map &(&1[:title])
  end
end

defmodule ProcessMoviesTest do
  use ExUnit.Case, async: true

  setup do
    movies = [
      %{title: "The Godfather", rank: 1, year_release: 1974, rating: 9.2},
      %{title: "Star Wars", rank: 2, year_release: 1972, rating: 7.8},
      %{title: "Pulp Fiction", rank: 3, year_release: 1994, rating: 8.2}
    ]
    {:ok, movies: movies}
  end

  test "get the titles", context do
    assert ["The Godfather", "Star Wars", "Pulp Fiction"] == ProcessMovies.get_title context[:movies]
  end

  test "get movies with rank and title", context do
    assert ["1 - The Godfather", "2 - Star Wars", "3 - Pulp Fiction"] == ProcessMovies.get_rank_and_title context[:movies]
  end

  test "get movies from the nineties", context do
    assert ["Pulp Fiction"] == context[:movies]
                               |> ProcessMovies.nineties
                               |> ProcessMovies.get_title
  end

  test "get movies from the nineties with rank and title", context do
    assert ["3 - Pulp Fiction"] == context[:movies]
                                   |> ProcessMovies.nineties
                                   |> ProcessMovies.get_rank_and_title
  end

  test "get movies titles with score greater than eight", context do
    assert ["The Godfather", "Pulp Fiction"] == context[:movies]
                                             |> ProcessMovies.score_over_eight
                                             |> ProcessMovies.get_title
  end

  test "get movies title and rank from the nineties with score greater than eight", context do
    assert ["3 - Pulp Fiction"] == context[:movies]
                                   |> ProcessMovies.nineties
                                   |> ProcessMovies.score_over_eight
                                   |> ProcessMovies.get_rank_and_title
  end
end
