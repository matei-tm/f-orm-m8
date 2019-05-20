#!/usr/bin/env bash

# remember some failed commands and report on exit
error=false

show_help() {
    printf "usage: $0 [--help] [--report] [<path to package>]

Tool for running all unit and widget tests with code coverage.
(run from root of repo)

where:
    <path to package>
        run tests for package at path only
        (otherwise runs all tests)
    --report
        run a coverage report
        (requires lcov installed)
    --help
        print this message

requires code_coverage package
(install with 'pub global activate coverage')
"
    exit 1
}

# run unit tests
run_tests () {
  cd $1;
  if [ -f "pubspec.yaml" ] && [ -d "test" ]; then
    echo "running tests in $1"
    escapedPath="$(echo $1 | sed 's/\//\\\//g')"

    # pure dart
    echo "run dart tests"
    pub get
    pub run test_coverage
    if [ -f "coverage/lcov.info" ]; then
    # combine line coverage info from package tests to a common file
    echo file found
    sed "s/^SF:.*lib/SF:$escapedPath\/lib/g" coverage/lcov.info >> $2/lcov.info
    rm coverage/lcov.info
    fi
    rm -f coverage.json
  fi
  cd - > /dev/null
}

run_report() {
    if [ -f "lcov.info" ] && ! [ "$TRAVIS" ]; then
        genhtml lcov.info -o coverage --no-function-coverage -s -p `pwd`
        open coverage/index.html
    fi
}

if ! [ -d .git ]; then printf "\nError: not in root of repo"; show_help; fi

case $1 in
    --help)
        show_help
        ;;
    --report)
        if ! [ -z ${2+x} ]; then
            printf "\nError: no extra parameters required: $2"
            show_help
        fi
        run_report
        ;;
    *)
        currentDir=`pwd`
        # if no parameter passed
        if [ -z $1 ]; then
            rm -f lcov.info
            dirs=(`find . -maxdepth 2 -type d`)
            for dir in "${dirs[@]}"; do
                run_tests $dir $currentDir
            done
        else
            if [[ -d "$1" ]]; then
                run_tests $1 $currentDir
            else
                printf "\nError: not a directory: $1"
                show_help
            fi
        fi
        ;;
esac

#Fail the build if there was an error
if [ "$error" = true ] ;
then
    exit -1
fi