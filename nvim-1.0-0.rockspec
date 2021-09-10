package = "nvim"
version = "1.0-0"
source = {
   url = "git+ssh://git@github.com/pjezusek/neovim-configuration.git"
}
dependencies = {
   "busted >= 2.0.0-1",
   "penlight >= 1.11.0-1",
}

build = {
  type = "builtin",
}
