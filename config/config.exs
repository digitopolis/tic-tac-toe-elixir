import Config

config :tic_tac_toe, TicTacToe.Repo,
  database: "tic_tac_toe_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :tic_tac_toe, ecto_repos: [TicTacToe.Repo]
