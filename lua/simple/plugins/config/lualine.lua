local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = {
  blue = "#569CD6",
  grey = "#3e3e3e",
	white = "#D8DEE9",
	purple = "#C586C0",
	black = "#222222",
  dark = "#2d2d2d",
  bg = "#232222"
}

local custom_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.bg },
  },

  insert = { a = { fg = colors.white, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.purple } },
  replace = { a = { fg = colors.black, bg = colors.white } },

  inactive = {
    a = { fg = colors.blue, bg = colors.grey },
    b = { fg = colors.blue, bg = colors.grey },
    c = { fg = colors.blue, bg = colors.grey },
  },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local icon_main = function ()
 return "  "
end

local file_name = function()
  local filename = vim.fn.expand "%:t"
  local extension = vim.fn.expand "%:e"
  local icon = require("nvim-web-devicons").get_icon(filename, extension)
  if icon == nil then
     icon = " "
     return icon
  end
  return " " .. icon .. " " .. filename .. " "
end

local dir_name = function ()
  local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  return "  " .. dir_name .. " "
end

local current_line = function()
  local current_line = vim.fn.line "."
  local total_line = vim.fn.line "$"

  if current_line == 1 then
     return " Top "
  elseif current_line == vim.fn.line "$" then
     return " Bot "
  end
  local result, _ = math.modf((current_line / total_line) * 100)
  return "  " .. result .. "%% "
end

local lsp_progress = function()
  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if Lsp then
     local msg = Lsp.message or ""
     local percentage = Lsp.percentage or 0
     local title = Lsp.title or ""
     local spinners = {
        "",
        "",
        "",
     }

     local success_icon = {
        "",
        "",
        "",
     }

     local ms = vim.loop.hrtime() / 1000000
     local frame = math.floor(ms / 120) % #spinners

     if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
     end

     return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
  end

  return ""
end


lualine.setup({
	options = {
		icons_enabled = true,
		theme = custom_theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { icon_main },
		lualine_b = { file_name },
		lualine_c = { { dir_name, color = { bg = colors.dark } }, diagnostics, lsp_progress },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = {
      filetype,
      diff,
      { 'branch', color = { bg = colors.dark }, icons_enabled = true, icon = "" },
    },
		lualine_y = { { 'mode', icons_enabled = true, icon = " "} },
		lualine_z = { current_line },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

