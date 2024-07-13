Zero = {}
Zero.plugins = {}

require('core.init')
require('plugins.init')

Zero.utils.set_options(Zero.options)
Zero.utils.set_keymaps(Zero.keymap)

require('lazy').setup(Zero.plugins)
