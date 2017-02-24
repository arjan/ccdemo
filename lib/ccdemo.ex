defmodule Ccdemo do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Ccdemo.Template, [])
    ]

    opts = [strategy: :one_for_one, name: Ccdemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
