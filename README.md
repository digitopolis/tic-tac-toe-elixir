# Tic Tac Toe

 Two players take turns marking spaces on the board, trying to be the first to mark a line of consecutive spaces (horizontally, vertically, or diagonally).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

To run the tests and play the game, make sure you have [Elixir installed](https://elixir-lang.org/install.html). To confirm it's installed, run the following command in the terminal to check the version:

```elixir
$ elixir --version
```

### Installing

Fork and clone a copy of this repo onto your local machine

Navigate to the project directory

```elixir
$ cd tic-tac-toe-elixir
```

And install dependencies using the command:

```elixir
$ mix deps.get
```

Finally, run the game with:

```elixir
$ mix tic_tac_toe
```

The game begins by asking each player for their names, then alternating turns until there is a winner, or board is full and the game ends in a draw.

## Running the tests

Tests are contained in the `tic-tac-toe/tests` directory.

### Running Unit Tests

From the top level directory `tic-tac-toe-elixir` run tests with the command:

```elixir
$ mix test
```

## Built With

* [Elixir](https://elixir-lang.org/) - a dynamic, functional language designed for building scalable and maintainable applications
* [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html) - Unit testing framework for Elixir

## Authors

* **Matt Readout** - *Initial work* - [digitopolis](https://github.com/digitopolis)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
