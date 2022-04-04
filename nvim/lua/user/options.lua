-- Nvim options
local options = {
    clipboard = "unnamedplus",              -- allows neovim to access the system clipboard 
    mouse = a,                              -- allow the mouse to be used
    number = true,
    relativenumber = true,                  -- relative line numbers
    tabstop = 4,                            -- tabstops
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    pumheight = 10,                          -- pop up menu height
    hlsearch = false,			            -- do not highlight search results
    wrap = false,			                -- do not wrap lines
    swapfile = false,                       -- do not generate swap files
    backup = false,							-- create backup file
    undofile = true,                        -- persistent undo
    undodir = "~/.local/share/nvim/undo",   -- persisten undofile location
    incsearch = true,
    splitright = true,
    scrolloff = 8,
    colorcolumn = "80",
    signcolumn = "yes",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
