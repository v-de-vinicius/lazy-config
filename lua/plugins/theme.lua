return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 100000,
    config = function()
      require("nordic").setup({
        -- Enable bold keywords.
        bold_keywords = false,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable editor background transparency.
        transparent = {
          bg = true,
          float = true,
        },
        -- Enable brighter float border.
        bright_border = false,
        -- Reduce the overall amount of blue in the theme (diverges from base Nord).
        reduced_blue = true,
        -- Swap the dark background with the normal one.
        swap_backgrounds = false,
        -- Cursorline options.
        cursorline = {
          bold = false,
          bold_number = true,
          theme = "dark",
          blend = 0.85,
        },
        -- Visual selection options.
        visual = {
          bold = false,
          bold_number = true,
          theme = "dark",
          blend = 0.85,
        },
        noice = {
          style = "classic",
        },
        telescope = {
          style = "flat",
        },
        leap = {
          dim_backdrop = false,
        },
        ts_context = {
          dark_background = true,
        },
      })
      require("nordic").load()

      -- Customizações de cores do Treesitter para Java (cores quentes e vibrantes)
      -- Usando cores mais distintas e com melhor contraste
      local colors = require("nordic.colors")

      -- Cor para "this" e keywords de declaração - Azul escuro customizado
      local this_color = "#5E81AC"  -- Azul petróleo escuro
      -- Cor para métodos - Azul mais claro
      local method_blue = colors.blue2.base
      -- Cor para classes e interfaces - Ciano claro quase branco
      local light_cyan = "#D8EEEB"  -- Ciano muito claro, quase branco

      -- "this" e "super" - Azul vibrante (cor de referência)
      vim.api.nvim_set_hl(0, "@variable.builtin.java", { fg = this_color, italic = true })

      -- Classes, interfaces, enums - Ciano claro quase branco (sem bold)
      vim.api.nvim_set_hl(0, "@type.java", { fg = light_cyan })
      vim.api.nvim_set_hl(0, "@lsp.type.class.java", { fg = light_cyan })
      vim.api.nvim_set_hl(0, "@lsp.type.interface.java", { fg = light_cyan })
      vim.api.nvim_set_hl(0, "@lsp.type.enum.java", { fg = light_cyan })

      -- Tipos primitivos (void, int, boolean, etc) - Cor do modifier + bold
      vim.api.nvim_set_hl(0, "@type.builtin.java", { fg = this_color, bold = true })

      -- Keyword "var" - Azul bold (independente do tipo inferido)
      vim.api.nvim_set_hl(0, "@lsp.type.type.java", { fg = this_color, bold = true })

      -- Métodos e funções - Azul mais claro
      vim.api.nvim_set_hl(0, "@function.method.java", { fg = method_blue })
      vim.api.nvim_set_hl(0, "@lsp.type.method.java", { fg = method_blue })
      vim.api.nvim_set_hl(0, "@function.call.java", { fg = method_blue })

      -- Métodos estáticos - Azul com itálico
      vim.api.nvim_set_hl(0, "@lsp.typemod.method.static.java", { fg = method_blue, italic = true })

      -- Keywords gerais - Magenta/Roxo (mantém para if, else, while, etc)
      vim.api.nvim_set_hl(0, "@keyword.java", { fg = colors.magenta.base, bold = true })
      vim.api.nvim_set_hl(0, "@keyword.return.java", { fg = colors.magenta.bright, bold = true })

      -- Keywords de declaração - MESMA COR DO "this"
      vim.api.nvim_set_hl(0, "@keyword.function.java", { fg = this_color })

      -- void - Cor do modifier + bold (sobrescreve @type.builtin.java)
      vim.api.nvim_set_hl(0, "@lsp.type.keyword.void.java", { fg = this_color, bold = true })

      -- Implements e extends - Magenta sem bold
      vim.api.nvim_set_hl(0, "@keyword.implements.java", { fg = colors.magenta.base })
      vim.api.nvim_set_hl(0, "@keyword.extends.java", { fg = colors.magenta.base })

      -- Imports - Magenta (mantém)
      vim.api.nvim_set_hl(0, "@keyword.import.java", { fg = colors.magenta.base, bold = true })

      -- Variáveis - Branco/Cinza claro
      vim.api.nvim_set_hl(0, "@variable.java", { fg = colors.white0 })
      vim.api.nvim_set_hl(0, "@variable.parameter.java", { fg = colors.white1 })
      vim.api.nvim_set_hl(0, "@lsp.type.parameter.java", { fg = colors.white1 })

      -- Constantes - Laranja
      vim.api.nvim_set_hl(0, "@constant.java", { fg = colors.orange.base, bold = true })
      vim.api.nvim_set_hl(0, "@variable.member.java", { fg = colors.orange.base })

      -- Campos static final (constantes) - Laranja + bold + itálico
      vim.api.nvim_set_hl(0, "@lsp.typemod.field.static.readonly.java", { fg = colors.orange.base, bold = true, italic = true })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.static.readonly.java", { fg = colors.orange.base, bold = true, italic = true })

      -- Annotations - Verde
      vim.api.nvim_set_hl(0, "@attribute.java", { fg = colors.green.base })
      vim.api.nvim_set_hl(0, "@lsp.type.annotation.java", { fg = colors.green.base })

      -- Strings - Amarelo
      vim.api.nvim_set_hl(0, "@string.java", { fg = colors.yellow.base })

      -- Números - Roxo claro
      vim.api.nvim_set_hl(0, "@number.java", { fg = colors.magenta.bright })

      -- TODOS os modificadores (private, public, protected, static, final, synchronized, etc) - MESMA COR DO "this"
      vim.api.nvim_set_hl(0, "@keyword.modifier.java", { fg = this_color })
      vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", { fg = this_color })
      vim.api.nvim_set_hl(0, "@storageclass.java", { fg = this_color })

      -- Cores especiais para destaque
      local turquoise = "#88C0D0"  -- Turquesa vibrante
      local lilac = "#B48EAD"      -- Roxo lilás

      -- Operadores símbolos - Turquesa vibrante (destaque!)
      vim.api.nvim_set_hl(0, "@operator.java", { fg = turquoise, bold = true })

      -- Operadores keywords (instanceof, new, etc) - Magenta bold
      vim.api.nvim_set_hl(0, "@keyword.operator.java", { fg = colors.magenta.base, bold = true })

      -- Conditionals (if, else, else if) - Roxo lilás (diferente das keywords gerais)
      vim.api.nvim_set_hl(0, "@keyword.conditional.java", { fg = lilac, bold = true })
      vim.api.nvim_set_hl(0, "@keyword.repeat.java", { fg = lilac, bold = true })

      -- Imports/namespaces - Magenta
      vim.api.nvim_set_hl(0, "@namespace.java", { fg = colors.magenta.base })
      vim.api.nvim_set_hl(0, "@lsp.type.namespace.java", { fg = colors.magenta.base })
    end,
  },
}
