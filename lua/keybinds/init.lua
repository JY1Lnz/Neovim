vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

local opt = { 
  noremap = true,
  silent = true,
}

local pluginKeys = {
  nvimTreeList = {
    -- 打开文件或文件夹
    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
  },
  telescopeList = {
    i = {
      ["<C-j>"]  = "move_selection_next",
      ["<C-k>"]  = "move_selection_previous",
      ["<Down>"] = "move_selection_next",
      ["<Up>"]   = "move_selection_previous",

      ["<C-c>"]  = "close"
    }
  },
  mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
  end,
  cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
  end,
}


map("n", "s", "", opt)

map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)

map("n", "<C-j>", "10j", opt)
map("n", "<C-k>", "10k", opt)

map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)



-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- find files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)

map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

return pluginKeys

