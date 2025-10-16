return {
    "folke/noice.nvim",
    opts = {
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "emsg",
                    find = "File is not being analyzed"
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "emsg",
                    find = "request handler for client"
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "emsg",
                    find = "Error detected while processing"
                },
                opts = { skip = true },
            },
        },
    }

}
