# Start with wolfi
FROM cgr.dev/chainguard/wolfi-base

# Set GOPATH and add to PATH
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH

RUN apk add --no-cache go

# Install golangci-lint and baton
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest && \
    go install github.com/conductorone/baton/cmd/baton@latest

# Set default command
ENTRYPOINT ["/usr/bin/env", "sh"] 