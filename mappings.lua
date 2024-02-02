-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },
    -- 上下滚动10行
    ["<C-u>"] = { "5k", desc = "Move down 5 lines" },
    ["<C-d>"] = { "5j", desc = "Move up 5 lines" },
    -- 分屏快捷键
    -- 多个窗口之间跳转
    ["<leader>r"] = { desc = "󱂬 Window" },
    ["<leader>rl="] = { "<C-l>=", desc = "Go to the left window" },

    ["<leader>bo"] = { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" },
    ["<leader>ba"] = { function() require("astronvim.utils.buffer").close_all() end, desc = "Close all buffers" },
    ["<leader>bc"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<leader>bC"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" },
    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
