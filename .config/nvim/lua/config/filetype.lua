vim.filetype.add({
    extension = {
        mb = "multibase",
    },
    pattern = {
        [".*%.blade%.php"] = "html",
    },
})
