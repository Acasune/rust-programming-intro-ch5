FROM rust:1.49 AS builder

WORKDIR /todo-rust

COPY Cargo.toml Cargo.toml

RUN mkdir src
RUN echo "fn main(){}" > src/main.rs
RUN cargo build  --release

COPY ./src ./src
COPY ./templates ./templates
RUN rm -f target/release/deps/todo*
RUN cargo build  --release

FROM debian:10.4

COPY --from=builder /todo-rust/target/release/todo-rust /usr/local/bin/todo-rust

CMD ["todo-rust"]
