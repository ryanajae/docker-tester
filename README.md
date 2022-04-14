# travis-test demonstrating travis compile error
To demonstrate the error encountered when `~/.travis/travis-build/bin/travis compile` is attempted to be ran, I have four example repos below. This is regarding [ticket 37078](https://support.travis-ci.com/hc/requests/37078). The command worked as expected as recently as September 2021.

First, we see that we have endpoint configured to .com, not .org:
`~/docker-tester/sonarqube$ ~/.travis/travis-build/bin/travis endpoint`      
Output:
`API endpoint: https://api.travis-ci.com/`

# First repo: SonarSource/sonarqube
1. `cd sonarqube`
2. `~/.travis/travis-build/bin/travis compile 39848.1`
Output:
```
undefined method `jobs' for nil:NilClass
for a full error report, run travis report
ryanjae@b515ef2b4984:~/docker-tester/sonarqube$ travis report
System
Ruby:                     Ruby 2.5.8-p224
Operating System:         Ubuntu 20.04
RubyGems:                 RubyGems 3.0.9

CLI
Version:                  1.11.0
Plugins:                  "travis-build"
Auto-Completion:          yes
Last Version Check:       2022-04-14 13:38:56 -0700

Session
API Endpoint:             https://api.travis-ci.com/
Logged In:                no
Verify SSL:               yes
Enterprise:               no

Endpoints
com:                      https://api.travis-ci.com/ (default, current)

Last Exception
An error occurred running `travis compile`:
    NoMethodError: undefined method `jobs' for nil:NilClass
        from /home/ryanjae/.travis/travis-build/init.rb:79:in `set_up_config'
        from /home/ryanjae/.travis/travis-build/init.rb:28:in `run'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/lib/travis/cli/command.rb:200:in `execute'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/lib/travis/cli.rb:64:in `run'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/bin/travis:18:in `<top (required)>'
        from /home/ryanjae/.travis/travis-build/bin/travis:27:in `load'
        from /home/ryanjae/.travis/travis-build/bin/travis:27:in `<main>'


For issues with the command line tool, please visit https://github.com/travis-ci/travis.rb/issues.
For Travis CI in general, go to https://github.com/travis-ci/travis-ci/issues or email support@travis-ci.com.
```

# Second repo: ikasanEIP/ikasan
1. `cd ikasan`
2.` ~/.travis/travis-build/bin/travis compile 5624.1`
Output:
```
Detected repository as ikasanEIP/ikasan, is this correct? |yes| y
undefined method `jobs' for nil:NilClass
for a full error report, run travis report
ryanjae@a5bc8f7cfbcb:~/docker-tester/ikasan$ travis report
System
Ruby:                     Ruby 2.5.8-p224
Operating System:         Ubuntu 20.04
RubyGems:                 RubyGems 3.0.9

CLI
Version:                  1.11.0
Plugins:                  "travis-build"
Auto-Completion:          yes
Last Version Check:       2022-04-13 13:00:06 -0700

Session
API Endpoint:             https://api.travis-ci.com/
Logged In:                no
Verify SSL:               yes
Enterprise:               no

Endpoints
com:                      https://api.travis-ci.com/ (default, current)

Last Exception
An error occurred running `travis compile`:
    NoMethodError: undefined method `jobs' for nil:NilClass
        from /home/ryanjae/.travis/travis-build/init.rb:79:in `set_up_config'
        from /home/ryanjae/.travis/travis-build/init.rb:28:in `run'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/lib/travis/cli/command.rb:200:in `execute'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/lib/travis/cli.rb:64:in `run'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/bin/travis:18:in `<top (required)>'
        from /home/ryanjae/.travis/travis-build/bin/travis:27:in `load'
        from /home/ryanjae/.travis/travis-build/bin/travis:27:in `<main>'


For issues with the command line tool, please visit https://github.com/travis-ci/travis.rb/issues.
For Travis CI in general, go to https://github.com/travis-ci/travis-ci/issues or email support@travis-ci.com.
```

# Third repo: square/moshi
1. `cd moshi'
2. `~/.travis/travis-build/bin/travis compile 1808.1`
Output:
```
Detected repository as square/moshi, is this correct? |yes| y
undefined method `jobs' for nil:NilClass
for a full error report, run travis report
ryanjae@c67b0163b43a:~/docker-tester/moshi$ travis report
System
Ruby:                     Ruby 2.5.8-p224
Operating System:         Ubuntu 20.04
RubyGems:                 RubyGems 3.0.9

CLI
Version:                  1.11.0
Plugins:                  "travis-build"
Auto-Completion:          yes
Last Version Check:       2022-04-13 13:33:24 -0700

Session
API Endpoint:             https://api.travis-ci.com/
Logged In:                no
Verify SSL:               yes
Enterprise:               no

Endpoints
com:                      https://api.travis-ci.com/ (default, current)

Last Exception
An error occurred running `travis compile`:
    NoMethodError: undefined method `jobs' for nil:NilClass
        from /home/ryanjae/.travis/travis-build/init.rb:79:in `set_up_config'
        from /home/ryanjae/.travis/travis-build/init.rb:28:in `run'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/lib/travis/cli/command.rb:200:in `execute'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/lib/travis/cli.rb:64:in `run'
        from /usr/share/rvm/gems/ruby-2.5.8/gems/travis-1.11.0/bin/travis:18:in `<top (required)>'
        from /home/ryanjae/.travis/travis-build/bin/travis:27:in `load'
        from /home/ryanjae/.travis/travis-build/bin/travis:27:in `<main>'


For issues with the command line tool, please visit https://github.com/travis-ci/travis.rb/issues.
For Travis CI in general, go to https://github.com/travis-ci/travis-ci/issues or email support@travis-ci.com.
```
Other job IDs (same result):
```
~/.travis/travis-build/bin/travis compile 1529.1
~/.travis/travis-build/bin/travis compile 2337.1
~/.travis/travis-build/bin/travis compile 1049.1
~/.travis/travis-build/bin/travis compile 660.1
~/.travis/travis-build/bin/travis compile 2336.1
```

# Fourth repo: apache/zookeeper
1. `cd zookeeper`
2. `~/.travis/travis-build/bin/travis compile 1118.1`
Output:

Other job IDs (same result):
```
 ~/.travis/travis-build/bin/travis compile 1684.2
 ~/.travis/travis-build/bin/travis compile 1494.2 
 ~/.travis/travis-build/bin/travis compile 3159.2
 ```
However, these two job IDs generate bash scripts successfully. Unclear what the differenceis:
```
 ~/.travis/travis-build/bin/travis compile 2363.1
 ~/.travis/travis-build/bin/travis compile 2675.3
```
