sqlcipher Cookbook
==================
Installs sqlcipher.

Attributes
----------

- `sqlcipher['repository']` - Git repository of sqlcipher
- `sqlcipher['version']` - SQLCipher version. ref: [sqlcipher/releases](https://github.com/sqlcipher/sqlcipher/releases)
- `sqlcipher['git_user']` - Git access user

Default value is [here](https://github.com/csouls/sqlcipher-cookbook/blob/master/attributes/default.rb)

Usage
-----

#### sqlcipher::default
Just include `sqlcipher` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sqlcipher]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Yusuke Tanaka ( @csouls )
