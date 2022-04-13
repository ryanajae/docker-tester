To run tests:

First, we see that we have endpoint configured to .com, not .org:
~/.travis/travis-build/bin/travis endpoint       
API endpoint: https://api.travis-ci.com/


1. cd ikasan
2. ~/.travis/travis-build/bin/travis compile 5624.1

1. cd sonarqube
2. ~/.travis/travis-build/bin/travis compile 39848.1
We get: repository not known to https://api.travis-ci.org/: SonarSource/sonarqube/ 
https://app.travis-ci.com/github/SonarSource/sonarqube
