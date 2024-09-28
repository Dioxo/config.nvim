return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]ppend' })

    vim.keymap.set('n', '<leader>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [M]enu' })

    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon Go to First from list' })

    vim.keymap.set('n', '<leader>hj', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon Go to Second from list' })

    vim.keymap.set('n', '<leader>hk', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon Go to Third from list' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon Go to Fourth from list' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon [P]revious' })

    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon [N]ext' })
  end,
}
