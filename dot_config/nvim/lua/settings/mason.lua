require("mason").setup({
    ensure_installed = {},
    automatic_installation = false,

    ui = {
        check_outdated_servers_on_open = true,

        border = "none",

        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },

})
