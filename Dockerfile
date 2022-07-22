FROM golang:1.18 AS build

RUN git config --global url."git@github.com:".insteadOf https://github.com/

# COPY ./internal /webrtc/internal
# COPY ./go.mod /webrtc
# COPY ./go.sum /webrtc
# COPY ./pkg /webrtc/pkg
# COPY ./examples/rtp-to-webrtc /webrtc/examples/rtp-to-webrtc
COPY . /webrtc

WORKDIR /webrtc

RUN go build -o /app/build/rtp-to-webrtc examples/rtp-to-webrtc/main.go

ENTRYPOINT ["/app/build/rtp-to-webrtc"]

EXPOSE 5004