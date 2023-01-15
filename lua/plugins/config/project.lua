local project = load_plugin("project_nvim")

if not project then
  return
end

vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { "pattern" },
  patterns = {
    ".git", "_darcs", ".hg", ".bzr", ".svn", 
    "Makefile", "package.json", ".sln"},
})

local telescope = load_plugin("telescope")

pcall(telescope.load_extension, "projects")
