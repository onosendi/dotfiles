local utils = {}

function utils.set_keymap(opts)
  local mode = opts.mode or "n"
  local bufnr = opts.bufnr or 0
  local expr = opts.expr or false

  vim.keymap.set(
    mode,
    opts.key,
    opts.cmd,
    {
      expr = expr,
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = opts.desc,
    }
  )
end

function utils.exe_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

return utils
