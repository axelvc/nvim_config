return {
  settings = {
    json = {
      schemas = {
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = {
            'tsconfig.json',
            'tsconfig.*.json',
          },
          url = 'https://json.schemastore.org/tsconfig.json',
        },
        {
          description = 'Javascript compiler configuration file',
          fileMatch = {
            'jsconfig.json',
            'jsconfig.*.json',
          },
          url = 'https://json.schemastore.org/jsconfig.json',
        },
        {
          description = 'JSON schema for Web Application manifest files',
          fileMatch = {
            'manifest.json',
          },
          url = 'https://json.schemastore.org/web-manifest.json',
        },
        {
          description = 'Babel configuration',
          fileMatch = {
            '.babelrc.json',
            '.babelrc',
            'babel.config.json',
          },
          url = 'https://json.schemastore.org/babelrc.json',
        },
        {
          description = 'ESLint config',
          fileMatch = {
            '.eslintrc.json',
            '.eslintrc',
          },
          url = 'https://json.schemastore.org/eslintrc.json',
        },
        {
          description = 'Prettier config',
          fileMatch = {
            '.prettierrc',
            '.prettierrc.json',
            'prettier.config.json',
          },
          url = 'https://json.schemastore.org/prettierrc',
        },
        {
          description = 'Vercel Now config',
          fileMatch = { 'now.json' },
          url = 'https://json.schemastore.org/now',
        },
        {
          description = 'Stylelint config',
          fileMatch = {
            '.stylelintrc',
            '.stylelintrc.json',
            'stylelint.config.json',
          },
          url = 'https://json.schemastore.org/stylelintrc',
        },
        {
          description = 'NPM configuration file',
          fileMatch = {
            'package.json',
          },
          url = 'https://json.schemastore.org/package.json',
        },
        {
          description = 'JSON schema for Visual Studio component configuration files',
          fileMatch = {
            '*.vsconfig',
          },
          url = 'https://json.schemastore.org/vsconfig.json',
        },
      },
    },
  },
}
