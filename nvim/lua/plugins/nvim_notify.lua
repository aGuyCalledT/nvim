local notify = require("notify")

notify.setup({
    stages = "fade",

    timeout = 3000,

    -- 3. Position & Layout
    -- Wo sollen sie erscheinen?
    top_down = true, -- true = oben, false = unten

    -- 4. Stil (Wie sehen sie aus?)
    -- Optionen:
    -- "default"  (mit Rahmen und Titel)
    -- "minimal"  (nur Text, sehr clean)
    -- "compact"  (noch kleiner)
    render = "default",

    -- 5. Icons & Titel
    icons = {
        ERROR = " error",
        WARN = " warning",
        INFO = " info",
        DEBUG = "  debug",
        TRACE = "✎ trace",
    },

    background_colour = "#000000",

    max_width = 100,
    max_height = 20,

    fps = 120,
})

vim.notify = notify
