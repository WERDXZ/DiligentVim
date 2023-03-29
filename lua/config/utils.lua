local M = {}

-- Root patterns for fallback
M.root_patterns = { ".git", ".hg", ".svn" }

--- Returns the project root directory based on:
--- * lsp workspace folders
--- * lsp root_dir
--- * root pattern of filename of the current buffer
--- * root pattern of cwd
---@return string?
function M.get_root()
	-- Get the current buffer name (file path)
	local bufname = vim.api.nvim_buf_get_name(0)

	-- Get the realpath of the current buffer name
	local realpath = bufname ~= "" and vim.loop.fs_realpath(bufname) or nil

	-- Initialize an empty table to store root directories
	local roots = {}

	-- If realpath exists, then proceed
	if realpath then
		-- Loop through all active LSP clients
		for _, client in ipairs(vim.lsp.get_active_clients()) do
			-- Get the workspace folders or root_dir from the LSP client
			local workspace_folders = client.config.workspace_folders

			local paths = workspace_folders
					and vim.tbl_map(function(ws)
						return vim.uri_to_fname(ws.uri)
					end, workspace_folders)
				or (client.config.root_dir and { client.config.root_dir })
				or {}
			--print(vim.inspect(paths))

			-- Loop through all paths found in the LSP client
			for _, p in ipairs(paths) do
				-- Get the realpath of the path
				local r = vim.loop.fs_realpath(p)

				-- Check if realpath contains the path found in LSP client
				if realpath:find(r or "", 1, true) then
					-- If it does, insert the path into the roots table
					table.insert(roots, r)
				end
			end
		end
	end

	-- Sort the roots table by length, in descending order (longest first)
	table.sort(roots, function(a, b)
		return #a < #b
	end)

	-- Get the first root from the sorted roots table, or fallback to root pattern search, or use the current working directory
	local root = roots[1]
		or (function(path, patterns)
			local _path = path and vim.fs.dirname(path) or vim.loop.cwd()
			local _root = vim.fs.find(patterns, { path = _path, upward = true })[1]
			return _root and vim.fs.dirname(_root) or vim.loop.cwd()
		end)(realpath, M.root_patterns)

	--print(vim.inspect(root))
	-- Return the root directory
	return root
end

M.init_or_toggle = function()
	vim.cmd([[ ToggleTermToggleAll ]])

	-- list current buffers
	local buffers = vim.api.nvim_list_bufs()

	-- check if toggleterm buffer exists. If not then create one by vim.cmd [[ exe 1 . "ToggleTerm" ]]
	local toggleterm_exists = false
	for _, buf in ipairs(buffers) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:find("toggleterm#") then
			toggleterm_exists = true
			break
		end
	end

	if not toggleterm_exists then
		vim.cmd([[ exe 1 . "ToggleTerm" ]])
	end
end

M.get_git_root = function()
	local git_root = vim.fn.system("git rev-parse --show-toplevel")
	return git_root
end

M.better_esc = function()
	local api = vim.api

	-- 获取当前窗口和缓冲区
	local cur_win = api.nvim_get_current_win()
	local cur_buf = api.nvim_get_current_buf()

	-- 判断当前是否在终端模式
	if vim.bo[cur_buf].buftype == "terminal" then
		api.nvim_command("setlocal nobuflisted | hide")
	else
		-- 判断当前是否在 normal mode
		if vim.api.nvim_get_mode().mode == "n" then
			if vim.bo[cur_buf].filetype == "noice" then
				vim.cmd[[q]]
			else
				-- 如果有搜索，则清除
				api.nvim_command("nohlsearch")
			end
		end
	end
end

-- Example usage

return M
