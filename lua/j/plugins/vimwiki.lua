return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        syntax = "default",
        ext = ".wiki",
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
