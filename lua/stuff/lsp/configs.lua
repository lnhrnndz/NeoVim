local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- for omnisharp
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"

local lspconfig = require("lspconfig")

local servers = {
    "jsonls",
    "lua_ls",
    --"csharp_ls",
    "bashls",
    "pyright",
    "clangd",
    "html",
    "cssls"
}

lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("stuff.lsp.handlers").on_attach,
		capabilities = require("stuff.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "stuff.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
