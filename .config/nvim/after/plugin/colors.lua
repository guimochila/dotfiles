function SetColorScheme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
end

SetColorScheme()
