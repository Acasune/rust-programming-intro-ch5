FROM rust:1.49

WORKDIR /todo-rust

COPY Cargo.toml Cargo.toml
COPY ./src ./src
COPY ./templates ./templates

RUN cargo build  --release
RUN cargo install --path .

CMD ["todo-rust"]
