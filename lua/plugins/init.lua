local packer = require("packer")
packer.startup(
  function(use)
    use("wbthomason/packer.nvim") -- update plugin

    use("navarasu/onedark.nvim") -- scheme

    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"})

    use({
      "akinsho/bufferline.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "moll/vim-bbye" }})

    use({
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons"}})
    use("arkav/lualine-lsp-progress")

    use ({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim" }})

    use ("glepnir/dashboard-nvim")

    use ("ahmedkhalf/project.nvim")

    use ({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate" })

    use ("williamboman/nvim-lsp-installer")
    use ({
      "neovim/nvim-lspconfig" })

    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

  end)

function load_plugin(name)
  local status, plugin = pcall(require, name)

  if not status then
    vim.notify("plugin: "..name.." not found")
    return nil
  end
  return plugin
end

require ('plugins.config')
