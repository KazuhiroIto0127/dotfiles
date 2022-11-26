local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' -- いろいろな依存もと

  -- 見た目
  use({
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        -- ...
      })
    end
  })
  use "sainnhe/sonokai"
  use "rebelot/kanagawa.nvim"
  -- use "folke/tokyonight.nvim"
  -- use "EdenEast/nightfox.nvim"
  -- use { "ellisonleao/gruvbox.nvim" }

  -- ※ session-managerと共存する方法がいまのところわかっていないため使っていない
  -- 通知やコマンド入力をポップアップでかっこよく表示できる
  -- use {
  --   'folke/noice.nvim',
  --   requires = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  -- }

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'hoob3rt/lualine.nvim' -- Statusline

  use 'akinsho/nvim-bufferline.lua' -- タブの表示をいい感じにするやつ
  use 'norcalli/nvim-colorizer.lua' -- #000000 みたいなやつに色をつける
  use {
    "kwkarlwang/bufresize.nvim", -- terminalのウィンドウサイズを変更したときにいい感じにレイアウトを修正してくれる。使い方わかってない
    config = function()
      require("bufresize").setup()
    end
  }
  use 'mrjones2014/smart-splits.nvim' -- ウインドウサイズをいい感じに変更
  use("petertriho/nvim-scrollbar") -- スクロールバーを表示する
  use "lukas-reineke/indent-blankline.nvim" -- インデント表示

  use 'akinsho/toggleterm.nvim' -- nvimからterminalを開ける

  -- スニペット
  use 'L3MON4D3/LuaSnip' -- Snippet

  -- LSPと自動補完
  -- -- 自動補完系
  use 'hrsh7th/nvim-cmp' -- 自動補完プラグイン
  use 'onsails/lspkind-nvim' -- cmp で補完の種類におしゃれなアイコン出せるようになる。
  use 'hrsh7th/cmp-nvim-lsp' -- lsp 用の補完ソース
  use 'hrsh7th/cmp-buffer' -- バッファ補完用の補完ソース
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- lsp 用の補完ソース。関数の引数を教えてくれる
  use 'hrsh7th/cmp-path' -- path用の補完ソース。
  use 'hrsh7th/cmp-emoji' -- emoji用ソース
  use 'hrsh7th/cmp-calc' -- 計算してくれる
  use 'hrsh7th/cmp-cmdline' -- コマンドでも補完してくれる
  use 'f3fora/cmp-spell' -- spellチェッカー
  use 'uga-rosa/cmp-dictionary' -- 辞書補完
  use 'yutkat/cmp-mocword' -- 次の英単語を予測してくれる）用の補完ソース。
  use 'ray-x/cmp-treesitter' -- treesitter補完
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  -- -- LSP
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- -- LSP 用の UI
  use 'glepnir/lspsaga.nvim' -- LSP 関連の足りない UI だったりコマンドだったりを追加してくれる

  -- Treesitter
  -- 言語ごとに色をつける
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'p00f/nvim-ts-rainbow'

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'nvim-telescope/telescope.nvim'
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use 'nvim-telescope/telescope-symbols.nvim'
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" }
  }

  -- **********
  -- git
  -- **********
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browser
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' } -- 高機能gitツール
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- diffを見れる。neogitと連携させている。

  -- gccでコメントアウト
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- ファイラー
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  -- dashboard
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- session
  use {
    "Shatur/neovim-session-manager",
    requires = { "nvim-telescope/telescope.nvim" }
  }

  -- keymap
  use { "folke/which-key.nvim" }
end)
