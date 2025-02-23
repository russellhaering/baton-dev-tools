# Build stage
FROM golang:bookworm as builder
ARG TARGETARCH

# Install tools for target architecture
RUN GOOS=linux GOARCH=$TARGETARCH go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest && \
    GOOS=linux GOARCH=$TARGETARCH go install github.com/conductorone/baton/cmd/baton@latest

# Final stage
FROM golang:bookworm
COPY --from=builder /go/bin/* /go/bin/

CMD ["bash"] 