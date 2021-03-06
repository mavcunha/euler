#!/usr/bin/env zsh

readonly ROOT_DIR="$(cd $(dirname ${(%):-%N} ) > /dev/null && pwd)"

export  PROJECT_EULER_DIR="$(cd ${ROOT_DIR}/.. && pwd)/src"

typeset TEST_OUT=""
typeset TEST_TITLE=""
typeset -i FAILS=0

function begin {
    TEST_TITLE="${1:?Missing test name}:"
    TEST_OUT=""
    FAILS=0
}

function endtest {
  if [[ ${FAILS} -eq 0 ]]; then
    print -P "${TEST_TITLE}${TEST_OUT}%F{green}OK%f"
  else
    print -P "${TEST_TITLE}${TEST_OUT}%F{red}NOK%f"
  fi
}

function ok {
    TEST_OUT="${TEST_OUT}."
    print -n "${TEST_TITLE}${TEST_OUT}\r"
}

function nok {
    TEST_OUT="${TEST_OUT}!"
    ((FAILS++))
    print -n "${TEST_TITLE}${TEST_OUT}\r"
}

print "Starting tests"

# List and capture the langs configured
typeset -a langs=("${(@f)$(euler --list | tail -n +4 | awk '{print $1}')}")

begin "languages"
  # at least one language needs to be configured
  [[ ${#langs[@]} -gt 0 ]] && ok || nok
endtest

begin "summary"
  # assuming the summary will have same number
  # of lines that languages has
  [[ $(($(euler --summary | wc -l ) - 2 )) -eq ${#langs[@]} ]] && ok || nok
endtest

begin "help"
  euler --help | grep -q "Shows this message."  && ok || nok
  euler -h     | grep -q "Shows this message."  && ok || nok
endtest

begin "version"
  euler --version | grep -Eq '^euler(.*)$' && ok || nok
endtest

begin "params"
  euler 2>&1 | grep -qE "^run_or_show:.*Language required.*" && ok || nok
endtest

begin "hello"
  for l in ${langs[@]}; do
    local v=$(euler -e hello -l ${l} | grep -v ${l})
    [[ ${v} == "Hello World!" ]] && ok || nok
  done
endtest

begin "source"
  for l in ${langs[@]}; do
    local v=$(euler -e hello -l ${l} --show | grep -v ${l})
    [[ "${v}" =~ ".*Hello World\!.*" ]] && ok || nok
  done
endtest

begin "createdir"
  # test dir should not exist
  [[ ! -d "${PROJECT_EULER_DIR}/euler-tests" ]] || nok
  # we create the test directory
  mkdir -p "${PROJECT_EULER_DIR}/euler-tests" || nok

  euler -e euler-tests --create &> /dev/null

  # check that all subdirs were created
  for l in ${langs[@]}; do
    [[ -d "${PROJECT_EULER_DIR}/euler-tests/${l}" ]] && ok || nok
    rmdir "${PROJECT_EULER_DIR}/euler-tests/${l}" || nok
  done

  # clean up the test dir
  rmdir "${PROJECT_EULER_DIR}/euler-tests" || nok
endtest

begin "time"
  for l in ${langs[@]}; do
    local v=$(euler -e hello -l ${l} --time 2>&1 | tail -n +2)
    [[ "${v}" =~ ".*user.*system.*cpu.*total$" ]] && ok || nok
  done
endtest
