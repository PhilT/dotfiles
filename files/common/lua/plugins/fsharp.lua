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
                                                                                -- Create 4 vertical panes with the last one
  vim.cmd('vsplit')                                                             -- containing a test watcher
  vim.cmd('vsplit')                                                             -- and the todo list
  if is_windows then
    vim.cmd('term watch.cmd')
  else
    vim.cmd('term ./watch.cmd')
  end
  vim.cmd('split '..todo_path)
  vim.cmd('wincmd h')
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

function _G.init_build_mappings()                                               -- Setup dotnet build mappings
  local separator = '/'
  if is_windows then separator = '\\' end

  vim.cmd([[set makeprg=.]]..separator..[[build.cmd]])

  map('n', '<Leader>m', '<cmd>Make<CR>')                                        -- dotnet build
  map('n', '<Leader>b', [[<cmd>Dispatch .]]..separator..[[bench.cmd<CR>]])      -- runs benchmarking project
  map('n', '<Leader>c', [[<cmd>Dispatch .]]..separator..[[clean.cmd<CR>]])      -- dotnet clean
  map('n', '<Leader>r', [[<cmd>Dispatch .]]..separator..[[run.cmd<CR>]])        -- dotnet run
  map('n', '<Leader>t', [[<cmd>Dispatch .]]..separator..[[test.cmd<CR>]])       -- dotnet test unit
  map('n', '<Leader>v', [[<cmd>Dispatch .]]..separator..[[visual.cmd<CR>]])     -- dotnet test visual
end


