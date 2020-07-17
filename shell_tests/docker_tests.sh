#!/usr/bin/env bats

@test '"help" (using short argument)' {
  run docker run -it 'stopwatch:dev' -h
  [ "${status}" -eq '0' ]
  [ "${output}" != '' ]

  return

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  docker run -it 'stopwatch:dev' -h >"${stdout}" 2>"${stderr}"
  [ "$(cat "${stdout}")" != '' ]
  [ "$(cat "${stderr}")" == '' ]
  rm -f "${stdout}" "${stderr}"
}

@test '"help" (using long argument)' {
  run docker run -it 'stopwatch:dev' --help
  [ "${status}" -eq '0' ]
  [ "${output}" != '' ]

  return

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  docker run -it 'stopwatch:dev' --help >"${stdout}" 2>"${stderr}"
  [ "$(cat "${stdout}")" != '' ]
  [ "$(cat "${stderr}")" == '' ]
  rm -f "${stdout}" "${stderr}"
}

@test 'failing (using invalid short argument)' {
  run docker run -it 'stopwatch:dev' -x
  [ "${status}" -ne '0' ]
  [ "${output}" != '' ]

  return

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  docker run -it 'stopwatch:dev' -x >"${stdout}" 2>"${stderr}" || true
  [ "$(cat "${stdout}")" == '' ]
  [ "$(cat "${stderr}")" != '' ]
  rm -f "${stdout}" "${stderr}"
}

@test 'failing (using invalid long argument)' {
  run docker run -it 'stopwatch:dev' --xyz
  [ "${status}" -ne '0' ]
  [ "${output}" != '' ]

  return

  stdout="$(mktemp)"
  stderr="$(mktemp)"
  docker run -it 'stopwatch:dev' --xyz >"${stdout}" 2>"${stderr}" || true
  [ "$(cat "${stdout}")" == '' ]
  [ "$(cat "${stderr}")" != '' ]
  rm -f "${stdout}" "${stderr}"
}
