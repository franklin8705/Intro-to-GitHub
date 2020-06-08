#!/bin/bash

# These are helper functions to set up or configure few things, when or if required. 
# For e.g., to configure a trainer bot username and email in local exercise repo to distinguish commits, and so on. 

# Intended to be extended for other purposes.


set -e

config-local-username() {
    # In the exercise repo, set local git user name and email to distinguish commits between user and setup script.

    EXERCISE_REPO_NAME='exercise'

    REPO=$(git rev-parse --show-toplevel) # Grab the git repo name
    REPO_NAME=$(basename ${REPO})

    if [[ ! -z ${REPO_NAME} && ${REPO_NAME} == 'exercise' ]]; then
        git config --local user.name "OCP US git trainer bot"
        git config --local user.email "OCP US ocp-us@example.com"
        echo "Successfully configured local username and email"
    fi
}


clear-local-user() {
# In the exercise repo, unset local git user name and email to distinguish commits between user and setup script.

    EXERCISE_REPO_NAME='exercise'

    REPO=$(git rev-parse --show-toplevel) # Grab the git repo name
    REPO_NAME=$(basename ${REPO})

    if [[ ! -z ${REPO_NAME} && ${REPO_NAME} == 'exercise' ]]; then
        git config --local --unset user.name
        git config --local --unset user.email
        echo "Successfully unset local username and email"
    fi

}

pre-setup () {
    kata="$(basename $(pwd))"  
    make-exercise-repo
    config-local-username
}

post-setup () {
    clear-local-user
}

set +e
