import gleam/erlang/process.{Pid}

pub opaque type PDF {
  PDF(pid: Pid)
}
