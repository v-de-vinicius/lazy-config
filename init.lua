-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- bootstrap lazy.nvim, LazyVim and your plugins                                                                                                                                │mp, [date]-jvmRun[N].dump and [date].dumpstream.
require("config.lazy")                                                                                                                                                          │[ERROR] -> [Help 1]
-- Habilita o autoread nativo                                                                                                                                                   │[ERROR]
vim.opt.autoread = true                                                                                                                                                         │[ERROR] To see the full stack trace of the errors, re-run M
                                                                                                                                                                                │aven with the -e switch.
-- Força o Neovim a checar mudanças sempre que você focar na janela ou entrar num buffer                                                                                        │[ERROR] Re-run Maven using the -X switch to enable full deb
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {                                                                                                      │ug logging.
  callback = function()                                                                                                                                                         │[ERROR]
    if vim.fn.mode() ~= "c" then                                                                                                                                                │[ERROR] For more information about the errors and possible
      vim.cmd("checktime")                                                                                                                                                      │solutions, please read the following articles:
    end                                                                                                                                                                         │[ERROR] [Help 1] http://cwiki.apache.org/confluence/display
  end,                                                                                                                                                                          │/MAVEN/MojoFailureException
})
