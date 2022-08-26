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
    icon = '  ',
    desc = 'Empty Buffer          ',
    action = 'enew',
  },
  {
    icon = '  ',
    desc = 'Recently Opened Files ',
    action = 'History',
  },
  {
    icon = 'ﳎ  ',
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
    desc = 'Find Word             ',
    action = 'Rg',
  },
  {
    icon = '  ',
    desc = 'Commit History        ',
    action = 'Commits',
  },
  {
    icon = '  ',
    desc = 'Open Personal Dotfiles',
    action = 'FZF ~/.stowfiles',
  }
}

