#!/usr/bin/env bats

@test '"help" (using short argument)' {
  run stopwatch -h
  [ "${status}" -eq '0' ]
  [ "${output}" != '' ]

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  stopwatch -h >"${stdout}" 2>"${stderr}"
  [ "$(cat "${stdout}")" != '' ]
  [ "$(cat "${stderr}")" == '' ]
  rm -f "${stdout}" "${stderr}"
}

@test '"help" (using long argument)' {
  run stopwatch --help
  [ "${status}" -eq '0' ]
  [ "${output}" != '' ]

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  stopwatch --help >"${stdout}" 2>"${stderr}"
  [ "$(cat "${stdout}")" != '' ]
  [ "$(cat "${stderr}")" == '' ]
  rm -f "${stdout}" "${stderr}"
}

@test 'failing (using invalid short argument)' {
  run stopwatch -x
  [ "${status}" -ne '0' ]
  [ "${output}" != '' ]

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  stopwatch -x >"${stdout}" 2>"${stderr}" || true
  [ "$(cat "${stdout}")" == '' ]
  [ "$(cat "${stderr}")" != '' ]
  rm -f "${stdout}" "${stderr}"
}

@test 'failing (using invalid long argument)' {
  run stopwatch --xyz
  [ "${status}" -ne '0' ]
  [ "${output}" != '' ]

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  stopwatch --xyz >"${stdout}" 2>"${stderr}" || true
  [ "$(cat "${stdout}")" == '' ]
  [ "$(cat "${stderr}")" != '' ]
  rm -f "${stdout}" "${stderr}"
}
