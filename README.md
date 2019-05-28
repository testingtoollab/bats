# Bash Automated Testing System - Docker Image

## How to reference the libraries in you test scripts

When creating a test script file, you must load the references as the following example:

```sh
#!/usr/bin/env bats
load '/bats-support/load.bash'
load '/bats-assert/load.bash'

@test "Check BATS version" {
    run bats --help
    assert_line --partial 'Bats 1.1.0'
}
```

## How to run the tests

Once all your test files and test scripts were created, you can execute them using `docker run` command.

It's important to mount the current local folder inside the container. In the following example, the current local folder will be mounted as `/test` in the target.

In order to execute all the tests scripts `*.bats`, you should reference the path of the scripts in the container (`/tests/`).

Example:

```sh
$ docker run -v "$(pwd):/tests" -it testingtoollab/bats:1.0.1 /tests/
```

## Current library versions

| Library | Version |
|---|---|
| bats-core | 1.1.0 |
| bats-support | 0.3.0 |
| bats-assert | 0.3.0 |
| bats-file | 0.2.0 |

## References

The following references are forks from the original repositories.

1. [bats-core](https://github.com/testingtoollab/bats-core)
2. [bats-support](https://github.com/testingtoollab/bats-support)
3. [bats-assert](https://github.com/testingtoollab/bats-assert)
4. [bats-file](https://github.com/testingtoollab/bats-file)
