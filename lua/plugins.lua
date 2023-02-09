return require('packer').startup(function(use)
	use {
	  'phaazon/hop.nvim',
	  branch = 'v2', -- optionalut strongly recommended
	  config = function()
		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran'}
	end
	}
	use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	  use {
		  'hrsh7th/nvim-cmp'
	  }
	use({
		"L3MON4D3/LuaSnip",
		tag = "v<CurrentMajor>.*",
		run = "make install_jsregexp"
	})
	use { 'saadparwaiz1/cmp_luasnip' }
end)
