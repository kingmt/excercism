defmodule Bowling do

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @spec start() :: any
  def start do
    []
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `:ok`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t
  def roll(_, roll) when roll < 0, do: {:error, "Pins must have a value from 0 to 10"}
  def roll(_, roll) when roll > 10, do: {:error, "Pins must have a value from 0 to 10"}
  def roll(game, roll) do
    # if roll does not exceed 10 for the frame
    game ++ [roll]
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(any) :: integer | String.t
  def score(game) do
    # add together all the balls
    # a frame with a spare also add the next ball
    # a frame with a strike also adds the next 2 balls


  end

  def frames_for_printing rolls do
    _slice_frames rolls
  end

  defp _slice_frames([]), do: []

  defp _slice_frames rolls do
    [ball1 | tail] = rolls
    if tail == [] do
      [[ball1]]
    else
      if ball1 == 10 do
        [["X"]] ++ _slice_frames(tail)
      else
        [ball1, ball2 | tail] = rolls
        if ball1 + ball2 == 10 do
          [[ball1, "/"]] ++ _slice_frames(tail)
        else
          [[ball1, ball2]] ++ _slice_frames(tail)
        end
      end
    end
  end


  @doc """
    Prints the game like:

    +---+---+---+---+---+---+    +---+---+---+---+
    | 0 | / |   | X | 0 | 0 |    |   | X | 1 | 2 |
    |   +___+   +---+   +---+....+   +---+---+---+
    |       |       |       |    |       |
    |   20  |   30  |   30  |    |  145  |
    +-------+-------+-------+    +-------+
  """
  def pretty_print rolls, score do
    cell_count = List.length rolls
    bonus_cell_count = cell_count - 20
    top_line = "+#{String.duplicate "---+", cell_count}"
    roll_line = Enum.map_reduce rolls, "|", fn x -> " #{} |" end
    under_roll_line = "|#{String.duplicate "   +---+",10}"
    above_score_line = "|#{String.duplicate "       |", 10}"
    score_line = Enum.map_reduce score, "|", score_in_cell(x)
    bottom_line =      "+#{"-------+", 10}"
  end

  @doc """
    |   0   |   30  |  130  |
  """
  def score_in_cell(score) do
    cond do
      score > 100 -> "   #{score}   |"
      score >  99 -> "  #{score}  |"
      true        -> "   #{score}  |"
    end
  end

  def cell_count frames
    last_frame = List.last frames
    cond do
      List.length(frames) == 10 -> 20
      List.length(last_frame) == 1 -> 21
      List.length(last_frame) == 2 -> 22
    end
  end

  def _pretty_print_top_line cell_count do
  end


  def score_frame(frame, following_ball_1, following_ball_2) do
    base_score = Enum.sum(frame)
    if base_score == 10 do
      # frame is a spare or strike, need to see which
      if length(frame) == 2 do
        # it is a spare
        10 + following_ball_1
      else
        10 + following_ball_1 + following_ball_2
      end
    else
      base_score
    end
  end
end
