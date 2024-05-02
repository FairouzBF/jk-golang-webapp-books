# Use a golang base image
FROM golang:latest
# Set current working directory inside the container
WORKDIR /app
# Copy go mod and sum files
COPY go.mod go.sum ./
# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download
# Copy the source code from the current directory to the Working Directory inside the container
COPY . .
# Build the Go app
RUN go build -o jk-golang-webapp-books .
# Expose port 8080
EXPOSE 8081
# Run the executable
CMD ["./jk-golang-webapp-books"]
