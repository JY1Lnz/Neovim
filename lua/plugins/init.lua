local packer = require("packer")
packer.startup(
  function(use)
    use("wbthomason/packer.nvim") -- update plugin

    use("navarasu/onedark.nvim") -- scheme

    use({
        "kyazdani42/nvim-tree.lua", 
        requires = "kyazdani42/nvim-web-devicons"})
    
  end)

require ('plugins.config')
