FROM hexpm/elixir:1.13.2-erlang-23.3.4.2-alpine-3.13.3 AS build

# Dependências
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
    git \
    build-base \
    nodejs-current \
    nodejs-npm \ 
    python3 && \ 
    mix local.rebar --force && \
    mix local.hex --force

# MIX_ENV é usado para baixar as dependências do ambiente
ENV MIX_ENV=prod
WORKDIR /app

# Instala as dependências do elixir
COPY mix.exs /app/mix.exs
COPY mix.lock /app/mix.lock
RUN mix do deps.get --only $MIX_ENV, deps.compile

# Copia pastas para o /app
# Configurações do elixir
COPY config /app/config
# Migrations
COPY priv /app/priv
# Arquivos backend
COPY lib /app/lib

# Compila e lança release
RUN mix do compile, release

FROM alpine:3.13.2 as app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

# Alterar o link da build para o nome atual do programa
COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/cleber ./

ENV HOME=/app

# Executa o comando de migrate do app (alterar o nome)
CMD bin/cleber eval "Cleber.Release.migrate" && bin/cleber start
# CMD bin/cleber start
