local db = require('dashboard')

db.custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 '',
}


db.custom_center = {
  {
    icon = '  ',
    desc = 'Recently opened files ',
    action = 'History',
  },
  {
    icon = '  ',
    desc = 'Home Directory        ',
    action = 'FZF ~',
  },
  {
    icon = '  ',
    desc = 'Current Directory     ',
    action = 'FZF',
  },
  {
    icon = '  ',
    desc = 'Find word             ',
    action = 'Rg',
  },
  {
    icon = '  ',
    desc = 'Commit History        ',
    action = 'Commits',
  },
  {
    icon = '  ',
    desc = 'Open Personal dotfiles',
    action = 'FZF ~/.stowfiles',
  }
}

