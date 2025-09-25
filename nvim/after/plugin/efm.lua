prettier = function ()
	return {
		formatCommand = "prettier --stdin-filepath '${INPUT}' ${--range-start:charStart} ${--range-end:charEnd}",
		formatStdin = true,
		formatCanRange = true,
		rootMarkers = {
			'.prettierrc',
			'.prettierrc.json',
			'.prettierrc.js',
			'.prettierrc.yml',
			'.prettierrc.yaml',
			'.prettierrc.json5',
			'.prettierrc.mjs',
			'.prettierrc.cjs',
			'.prettierrc.toml',
			'prettier.config.js',
			'prettier.config.cjs',
			'prettier.config.mjs',
		}
	}
end

vim.lsp.config('efm', {
	init_options = { documentFormatting = true },
	filetypes = { "go", "markdown", "rust", "typescript", "typescriptreact" },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			cpp = {
				{ formatCommand = "clang-format -", formatStdin = true }
			},
			go = {
				{ formatCommand = "gofmt", formatStdin = true }
			},
			markdown = {
				{
					formatCommand = "pandoc -f markdown -t gfm -sp",
					formatStdin = true
				}
			},
			rust = {
				{ formatCommand = "rustfmt", formatStdin = true }
			},
			typescript = { prettier() },
			typescriptreact = { prettier() }
		}
	}
})

