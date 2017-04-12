#!/usr/bin/env bash

mkdir -p tmp

function alterway_php() {
    git clone -q https://github.com/alterway/docker-php.git tmp/alterway

    rm  -rf tmp/alterway/.git \
        tmp/alterway/.gitlab-ci.yml \
        tmp/alterway/doc-php-apache.md \
        tmp/alterway/doc-php-cli.md \
        tmp/alterway/doc-php-fpm.md \
        tmp/alterway/LICENSE \
        tmp/alterway/README.md

    cp -a tmp/alterway/. images/php
    rm -rf tmp/alterway

    git add images/php

    find images/php -name "Dockerfile" -exec sed -i "s/Alterway <iac@alterway.fr>/Mike Pretzlaw <mail@mike-pretzlaw.de>/g" {} \;
}

echo "Update PHP"
alterway_php

rm -rf tmp
