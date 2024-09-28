return {
  'preservim/nerdtree',
  opts = {},
  config = function()
    vim.api.nvim_command "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif "
    vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>', { desc = '[N]erdtree Focus' })
    vim.keymap.set('n', '<C-n>', ':NERDTree<CR>', { desc = '[N]erdtree' })
    vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { desc = 'Nerdtree [T]oggle' })
    vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>', { desc = 'Nerdtree [F]ind' })
  end,
}
