maintainer       "Nicholas Whitt"
maintainer_email "nick.whitt@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures development tools"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.0"

depends "apache2"
depends "mysql"
depends "php"
depends "apt"
depends "git"

supports "ubuntu", ">= 12.04"

recipe "mailcatcher", "Sendmail/SMTP replacement for email interception"
recipe "phpmyadmin", "Web-based MySQL administration"
recipe "phpunit", "PHP unit testing framework"
recipe "webgrind", "Xdebug profiling web frontend in PHP5"
recipe "xdebug", "PHP debugging extension"