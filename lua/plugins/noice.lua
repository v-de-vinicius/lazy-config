return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Garante que a tabela de rotas existe
      opts.routes = opts.routes or {}

      -- Adiciona nossa regra personalizada na lista de rotas existentes
      table.insert(opts.routes, {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            -- Tenta pegar o nome do cliente LSP (ex: jdtls)
            local client = vim.tbl_get(message.opts, "progress", "client")

            -- Só aplica o filtro se for o jdtls
            if client == "jdtls" then
              local title = vim.tbl_get(message.opts, "progress", "title") or ""
              local msg = vim.tbl_get(message.opts, "progress", "message") or ""

              -- Verifica se o texto contém as palavras que te incomodam
              -- Usamos 'find' para pegar partes do texto
              return (title:find("Validate documents") or msg:find("Validate documents") or
                title:find("Publish Diagnostics") or msg:find("Publish Diagnostics"))
            end
          end,
        },
        opts = { skip = true }, -- Ação: pular (esconder) a mensagem
      })
    end,
  },
}
