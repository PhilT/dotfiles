local is_windows = vim.fn.has('win32') == 1
local group = vim.api.nvim_create_augroup('mygroup', { clear = true })
local autocmd = vim.api.nvim_create_autocmd
local todo_path =
  file_exist('TODO.md') and 'TODO.md' or os.getenv('TXT_DIR')..'/todo.txt'      -- Set TODO file to local project if it exists otherwise main todo.txt in D:\txt

function _G.term_run(command)                                                   -- Run a build command e.g. 'run', 'test', 'build'
  autocmd('TermEnter', {                                                        -- When entering insert mode in terminal switch back out of it
    command = 'TermOpen * call v:lua.switch_out_of_term()',
    group = group
  })
  vim.cmd('term '..command)
end

function _G.create_fsharp_env()                                                 -- Prepare Neovim for developing F# project
  setup_lsp_client()
  init_build_mappings()

  vim.cmd([[set errorformat^=\ %#%f(%l\\\,%c):\ %m,\%.%#\ at\ %.%#\ in\ %f:line\ %l]])-- Set errorformats for dotnet build and test errors

  if #vim.api.nvim_tabpage_list_wins(0) == 1 then                               -- Only create splits if there aren't any (E.g. Hasn't had a session reloaded)
    vim.cmd('vsplit')                                                           -- Create 3 vertical panes with the last one
    vim.cmd('vsplit')                                                           -- containing a test watcher and the todo list
    if is_windows then
      vim.cmd('term watch.cmd')
    else
      vim.cmd('term ./watch.cmd')
    end
    vim.cmd('split '..todo_path)
    vim.cmd('wincmd h')
  else                                                                          -- Reload any buffers to ensure LSP is working
    vim.cmd('windo e')
    vim.cmd('wincmd 1w')                                                        -- Return to the first split
  end
  print('F# environment loaded')
end

function _G.setup_lsp_client()
  local fsautocomplete_path = '/home/phil/src/FsAutoComplete/src/FsAutoComplete/bin/Release/net6.0/fsautocomplete.dll'
  if is_windows then
    fsautocomplete_path = 'D:\\tools\\fsautocomplete\\tools\\net6.0\\any\\fsautocomplete.dll'
  end

  local lspconfig = require'lspconfig'
  lspconfig['fsautocomplete'].setup{
    cmd = {'dotnet', fsautocomplete_path, '--adaptive-lsp-server-enabled'},
    root_dir = require('lspconfig').util.root_pattern('*.sln', '.git'),
    on_attach = on_attach,
  }

  -- lua vim.lsp.set_log_level("debug")
  -- lua print(vim.lsp.get_log_path())
end

local run_command = function(command)
  local separator = '/'
  if is_windows then separator = '\\' end
  local basePath = "."..separator..command

  local path = vim.api.nvim_buf_get_name(0)
  local cmd = 'dotnet fsi '..path
  if not path:match('.fsx$') then cmd = basePath..[[.cmd]] end
  if not is_windows and file_exist(command..[[.sh]]) then
    cmd = basePath..[[.sh]]
  end
  vim.cmd([[Dispatch ]]..cmd)
end

function _G.init_build_mappings()                                               -- Setup dotnet build mappings
  vim.keymap.set('n', '<Leader>m', function() run_command('build') end)         -- dotnet build
  vim.keymap.set('n', '<Leader>b', function() run_command('bench') end)         -- runs benchmarking project
  vim.keymap.set('n', '<Leader>c', function() run_command('clean') end)         -- dotnet clean
  vim.keymap.set('n', '<Leader>r', function() run_command('run') end)           -- dotnet run
  vim.keymap.set('n', '<Leader>t', function() run_command('test') end)          -- dotnet test unit
  vim.keymap.set('n', '<Leader>v', function() run_command('visual') end)        -- dotnet test visual
end


