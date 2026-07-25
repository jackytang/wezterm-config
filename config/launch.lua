local platform = require('utils.platform')

---@type Config
local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   local git_bash = 'C:\\Users\\JackyTang\\scoop\\apps\\git\\current\\bin\\bash.exe'
   local git_zsh = {
      git_bash,
      '--noprofile',
      '--norc',
      '/c/Users/JackyTang/.local/bin/git-zsh',
   }

   options.default_prog = git_zsh
   options.launch_menu = {
      { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
      { label = 'Msys2', args = { 'ucrt64.cmd' } },
      { label = 'Git Zsh', args = git_zsh },
      {
         label = 'Git Bash',
         args = { git_bash },
      },
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options
