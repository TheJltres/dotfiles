local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

---@type vim.lsp.Config
return {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html', 'templ', 'blade' },
    root_markers = { 'package.json', '.git' },
    settings = {
        html = {
            mirrorCursorOnMatchingTag = true,
        }
    },
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { 'html', 'css', 'javascript' },
    },

    capabilities = capabilities,
}
