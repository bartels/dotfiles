module.exports = {
  env: {
    browser: true,
    commonjs: true,
    node: true,
    es6: true
  },
  parserOptions: {
    ecmaVersion: 2019,
    sourceType: "module",
    jsx: true
  },
  extends: "eslint:recommended",
  rules: {
    "linebreak-style": ["error", "unix"],
    "quotes": "off",
    "semi": "off",
    "camelcase": "off",
    "comma-dangle": "off",
    "no-console": "off",
    "space-before-function-paren": "off",
    "eqeqeq": "error",
    "curly": ["error", "multi-line"],
    "space-before-blocks": "error",
    "no-undef": "error",
    "no-loop-func": "error",
    "no-shadow": "error",
    "no-trailing-spaces": "error",
    "no-unused-vars": [2, {"vars": "all", "args": "none"}],
    "no-use-before-define": ["error", { "functions": false, "classes": true, "variables": true }]
  }
}
