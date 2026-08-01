# Troubleshooting

## Check plugin availability

:lua =vim.pack.get()

## Check keymap ownership

:verbose nmap <key>

Example:

:verbose nmap <leader>ff

## Check health

:checkhealth

## Check Lua errors

:messages

## Reload a module

:lua package.loaded["module"]=nil
