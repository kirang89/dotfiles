Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [
    eval_result: [:green, :bright] ,
    eval_error: [[:red, :bright]],
    eval_info: [:yellow, :bright ],
  ]
)
