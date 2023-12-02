function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg="none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg="none"})
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='pink', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='darkgray', bold=true })
end

ColorMyPencils()
