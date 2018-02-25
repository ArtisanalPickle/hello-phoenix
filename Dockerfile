# install elixir / hex
FROM elixir:1.6.1
RUN mix local.hex --force

WORKDIR /app
ADD . /app

# install phoenix & deps
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix deps.get

EXPOSE 4000
CMD mix phoenix.server
