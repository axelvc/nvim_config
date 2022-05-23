return {
  env = {
    PRETTIERD_DEFAULT_CONFIG = os.getenv('MYVIMRC'):match '(.*/)' .. '.prettierrc.json',
  },
}
