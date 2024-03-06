return {
  "akinsho/toggleterm.nvim", build = ":ToggleTerm",
  cmd = { "ToggleTerm", "TermExec" },
  lazy = false,
  opts = {
    size = 10,
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = "float",
    float_opts = { border = "curved", highlights = { border = "Normal", background = "Normal" } },
  },
}
