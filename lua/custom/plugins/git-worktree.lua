return {
  'ThePrimeagen/git-worktree.nvim',
  opts = {},
  config = function()
    -- git worktree keymaps
    vim.keymap.set('n', '<leader>gws', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[G]it [W]orktree [S]witch' })
    vim.keymap.set('n', '<leader>gwc', require('telescope').extensions.git_worktree.create_git_worktree, { desc = '[G]it [W]orktree [C]reate' })
  end,
}
