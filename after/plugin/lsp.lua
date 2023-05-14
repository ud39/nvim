local lsp = require('lsp-zero').preset({"recommend"})

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'html',
})

local import_cmp, cmp = pcall(require, 'cmp')
if not import_cmp then return end

local import_luasnip, luasnip = pcall(require, 'luasnip')
if not import_luasnip then return end

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete({}),
		['<C-e>'] = cmp.mapping.close(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {"i", "s"}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),

	}
})



lsp.set_preferences({
	sign_icons = { }
})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)





-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()


vim.diagnostic.config({
    virtual_text = true
})
