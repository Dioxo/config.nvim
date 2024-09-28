local function init()
  local Worktree = require 'git-worktree'
  local Job = require 'plenary.job'
  local harpoon = require 'harpoon'

  local function killProcessAndLaunchCommand(tmuxProcessNumber, command)
    for i = 1, 5, 1 do
      Job:new({
        command = 'tmux',
        args = { 'send-keys', '-t', tmuxProcessNumber, 'C-c', 'Enter' },
      }):start()
    end

    local _, commandCode = Job:new({
      command = 'tmux',
      args = { 'send-keys', '-t', tmuxProcessNumber, command, 'Enter' },
    }):sync()

    if commandCode ~= 0 then
      print('Error launching command in tmux process ' .. tmuxProcessNumber .. ' : ' .. command)
      return
    end
  end

  function InitTmuxConfig()
    local function handle48HCProject(op, metadata)
      if (op == Worktree.Operations.Switch or op == Worktree.Operations.Create) and string.find(metadata.path, '/cpts.git/') ~= nil then
        killProcessAndLaunchCommand(
          '1',
          'cd '
            .. metadata.path
            .. '/backend'
            .. " && cp /home/dioxo/projects/cpts.git/.env ./ && npm i --lockfile-version 1 && nodemon --exec 'node --inspect=0.0.0.0:9229 --require ts-node/register' ./src/main.ts"
        )
        killProcessAndLaunchCommand('2', 'cd ' .. metadata.path .. '/frontend/portail-medecin' .. ' && npm i --lockfile-version 1 && npm run start')
      end
    end

    -- start listening to worktree changes
    Worktree.on_tree_change(function(op, metadata)
      handle48HCProject(op, metadata)

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED
    end)
  end
end

return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  config = function()
    init()
    -- git worktree keymaps
    vim.keymap.set('n', '<leader>gws', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[G]it [W]orktree [S]witch' })
    vim.keymap.set('n', '<leader>gwc', require('telescope').extensions.git_worktree.create_git_worktree, { desc = '[G]it [W]orktree [C]reate' })

    if vim.fn.exepath 'tmux' ~= nil then
      InitTmuxConfig()
    end
  end,
}
