return {
  "epwalsh/obsidian.nvim",
  -- the obsidian vault in this default config  ~/obsidian-vault
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  event = { "BufReadPre  */obsidian-vault/*.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "hrsh7th/nvim-cmp", optional = true },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gf"] = {
              function()
                if require("obsidian").util.cursor_on_markdown_link() then
                  return "<Cmd>ObsidianFollowLink<CR>"
                else
                  return "fl"
                end
              end,
              desc = "Obsidian Follow Link",
            },
          },
        },
      },
    },
  },

  keys = {
    { "<leader>nd", ":ObsidianToday<cr>", desc = "obsidian [d]aily" },
    { "<leader>nt", ":ObsidianToday 1<cr>", desc = "obsidian [t]omorrow" },
    { "<leader>ny", ":ObsidianToday -1<cr>", desc = "obsidian [y]esterday" },
    { "<leader>nb", ":ObsidianBacklinks<cr>", desc = "obsidian [b]acklinks" },
    { "<leader>nl", ":ObsidianLink<cr>", desc = "obsidian [l]ink selection" },
    { "<leader>nf", ":ObsidianFollowLink<cr>", desc = "obsidian [f]ollow link" },
    { "<leader>nn", ":ObsidianNew<cr>", desc = "obsidian [n]ew" },
    { "<leader>ns", ":ObsidianSearch<cr>", desc = "obsidian [s]earch" },
    { "<leader>no", ":ObsidianQuickSwitch<cr>", desc = "obsidian [o]pen quickswitch" },
    { "<leader>nO", ":ObsidianOpen<cr>", desc = "obsidian [O]pen in app" },
  },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      dir = vim.env.HOME .. "/obsidian-vault", -- specify the vault location. no need to call 'vim.fn.expand' here
      use_advanced_uri = true,
      finder = (astrocore.is_available "telescope.nvim" and "telescope.nvim")
        or (astrocore.is_available "fzf-lua" and "fzf-lua")
        or (astrocore.is_available "mini.pick" and "mini.pick"),

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },

      completion = {
        nvim_cmp = astrocore.is_available "nvim-cmp",
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      follow_url_func = vim.ui.open,
    })
  end,
}
