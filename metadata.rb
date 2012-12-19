maintainer       "Nicholas Whitt"
maintainer_email "nick.whitt@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures development tools"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apt"
depends "apache2"
depends "php"
depends "mysql"

supports "ubuntu", ">= 12.04"

recipe "xdebug", "PHP debugging extension"
recipe "mailcatcher", "Sendmail/SMTP replacement for email interception"
