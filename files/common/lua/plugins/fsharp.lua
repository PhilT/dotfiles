local is_windows = vim.fn.has('win32') == 1
local group = vim.api.nvim_create_augroup('mygroup', { clear = true })
local autocmd = vim.api.nvim_create_autocmd
local todo_path = file_exist('TODO.md') and 'TODO.md' or os.getenv('TXT_DIR')..'/todo.txt' -- Set TODO file to local project if it exists otherwise main todo.txt in D:\txt

function _G.term_run(command)                                                   -- Run a build command e.g. 'run', 'test', 'build'
  autocmd('TermEnter', {                                                        -- When entering insert mode in terminal switch back out of it
    command = 'TermOpen * call v:lua.switch_out_of_term()',
    group = group
  })
  vim.cmd('term '..command)
end

function _G.create_fsharp_env()                                                 -- Prepare Neovim for developing F# project
  init_build_mappings()
                                                                                -- Create 4 vertical panes with the last one
  vim.cmd('vsplit')                                                             -- containing a test watcher
  vim.cmd('vsplit')                                                             -- and the todo list
  term_run([[.\watch]])
  vim.cmd('split '..todo_path)
  vim.cmd('wincmd h')
end

function _G.init_build_mappings()                                               -- Setup dotnet build mappings
  vim.cmd([[set makeprg=.\build]])

  map('n', '<Leader>m', '<cmd>Make<CR>')                                    -- dotnet build
  map('n', '<Leader>t', [[<cmd>Dispatch .\test<CR>]])                       -- dotnet test
  map('n', '<Leader>b', [[<cmd>Dispatch .\bench<CR>]])                      -- runs benchmarking project
  map('n', '<Leader>r', [[<cmd>Dispatch .\run<CR>]])                        -- dotnet run
  map('n', '<Leader>c', [[<cmd>Dispatch .\clean<CR>]])                      -- dotnet clean
end


