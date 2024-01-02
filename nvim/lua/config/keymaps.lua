-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--- local discipline = require("other.discipline")
--- discipline.cowboy()
require("other.harpoon")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--- Inrement/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

--- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

--- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

--- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Copy to external clipboard by adding <leader> prefix to yank
keymap.set({ "v", "n" }, "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+yg_')
keymap.set("n", "<leader>yy", '"+yy')
-- Paste from clipboard by adding <leader> prefix to paste
keymap.set({ "n", "v" }, "<leader>p", '"+p')
keymap.set({ "n", "v" }, "<leader>P", '"+P')

--- Open explorer
keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move selected lines up (K) and down (J)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- After joining lines, cursor stays at the same place he was left
keymap.set("n", "J", "mzJ`z")

-- TODO:
-- Insert mode keymaps from VS code
keymap.set("i", "<C-BS>", "<C-o>db")
keymap.set("i", "C-<Del>", "de")
keymap.set("i", "<C-Enter>", "<C-o>o")
keymap.set("i", "C-S-<CR>", "<ESC>O")
