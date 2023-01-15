local treesitter = load_plugin("nvim-treesitter.configs")

if not treesitter then
  return
end

treesitter.setup({
  ensure_installed = {
    "json", "html", "vim", "lua", "c", "cpp", "llvm", "python"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
