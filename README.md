# COME BACK TO ME

## Description

The script creates a database dump, encrypts it, records changes to files and sends it to the git-repository.
This version for wordpress.

## Installation

```
$ cd YOUR_WORDPRESS_DIR
$ wget https://raw.githubusercontent.com/soko1/comebacktome/master/comebacktome.sh
$ wget https://raw.githubusercontent.com/soko1/comebacktome/master/comebacktome_config.example -O comebacktome_config 
$ wget https://raw.githubusercontent.com/soko1/comebacktome/master/.gitignore
$ chmod +x comebacktome.sh 
$ chmod 600 comebacktome_config
$ vim comebacktome_config
$ ./comebacktome.sh
```
