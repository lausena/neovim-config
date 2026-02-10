require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Cargo (run in a split terminal that auto-closes on success)
local function cargo_cmd(cmd)
  return function()
    vim.cmd("botright split | terminal cargo " .. cmd)
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function()
        vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
          callback = function()
            vim.api.nvim_buf_delete(buf, { force = true })
          end,
        })
        -- Switch out of terminal mode so the "q" mapping works
        vim.cmd("stopinsert")
        vim.api.nvim_echo({ { "Press q to close", "WarningMsg" } }, false, {})
      end,
    })
  end
end

map("n", "<Leader>cr", cargo_cmd("run"), { desc = "Cargo run" })
map("n", "<Leader>cb", cargo_cmd("build"), { desc = "Cargo build" })
map("n", "<Leader>ct", cargo_cmd("test"), { desc = "Cargo test" })
