package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// Struct to demonstrate JSON responses
type Person struct {
	Name    string `json:"name"`
	Age     int    `json:"age"`
	Address string `json:"address"`
}

// Main function demonstrating basic web development with Go
func main() {
	// Example 1: Simple HTTP Server using net/http
	go startHTTPServer() // Start HTTP server on a separate goroutine to avoid blocking the main thread

	// Example 2: Using Gin framework for faster development
	startGinServer()
}

// Example 1: Simple HTTP Server using net/http
// Writing a basic HTTP server using the net/http package in Go
func startHTTPServer() {
	http.HandleFunc("/", homeHandler) // Home route
	http.HandleFunc("/about", aboutHandler) // About route

	// Start the server on port 8080
	fmt.Println("Starting simple HTTP server on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("Error starting HTTP server:", err)
	}
}

// homeHandler handles the "/" route
func homeHandler(w http.ResponseWriter, r *http.Request) {
	// Set header content type to HTML
	w.Header().Set("Content-Type", "text/html")
	w.WriteHeader(http.StatusOK)

	// Sending a simple HTML response
	fmt.Fprintf(w, "<h1>Welcome to the Go HTTP server!</h1><p>This is a simple web server.</p>")
}

// aboutHandler handles the "/about" route
func aboutHandler(w http.ResponseWriter, r *http.Request) {
	// Set header content type to HTML
	w.Header().Set("Content-Type", "text/html")
	w.WriteHeader(http.StatusOK)

	// Sending a simple HTML response
	fmt.Fprintf(w, "<h1>About This Server</h1><p>This is a simple HTTP server written in Go.</p>")
}

// Example 2: Using Gin Framework for Faster Development
// Gin is a fast HTTP web framework written in Go
func startGinServer() {
	// Initialize Gin router
	r := gin.Default()

	// Middleware to log request details
	r.Use(gin.Logger())

	// Example of GET route
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Welcome to the Gin server!",
		})
	})

	// Example of POST route handling JSON requests
	r.POST("/person", func(c *gin.Context) {
		var person Person

		// Bind incoming JSON request to the Person struct
		if err := c.ShouldBindJSON(&person); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{
				"error": err.Error(),
			})
			return
		}

		// Respond with a success message and the received data
		c.JSON(http.StatusOK, gin.H{
			"message": "Person received successfully",
			"person": person,
		})
	})

	// Example of Route with Path Parameter
	r.GET("/hello/:name", func(c *gin.Context) {
		name := c.Param("name")
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello " + name + "!",
		})
	})

	// Example of Route with Query Parameters
	r.GET("/greet", func(c *gin.Context) {
		name := c.DefaultQuery("name", "Guest") // "Guest" is the default value
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello " + name,
		})
	})

	// Example of Error Handling Middleware
	r.Use(errorHandlingMiddleware())

	// Start the Gin server on port 8081
	fmt.Println("Starting Gin server on port 8081...")
	if err := r.Run(":8081"); err != nil {
		log.Fatal("Error starting Gin server:", err)
	}
}

// Error handling middleware to catch any errors during request processing
func errorHandlingMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Next() // Continue to the handler
		if len(c.Errors) > 0 {
			// If there were errors, log them and send an internal server error
			fmt.Println("Error occurred:", c.Errors.String())
			c.JSON(http.StatusInternalServerError, gin.H{
				"error": "Internal Server Error",
			})
		}
	}
}

// JSON Response Example
func jsonResponse(w http.ResponseWriter, data interface{}) {
	// Set header content type to application/json
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

	// Encode data to JSON and write to response
	if err := json.NewEncoder(w).Encode(data); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

// Example of how to handle routing and middlewares
func useMiddlewareExample() {
	// Basic route with middleware that logs the request time
	http.HandleFunc("/middleware", middlewareHandler)
	http.ListenAndServe(":8082", nil)
}

// Middleware example: logging request processing time
func middlewareHandler(w http.ResponseWriter, r *http.Request) {
	start := time.Now()

	// Call the original handler
	fmt.Fprintf(w, "This is a request with middleware")

	// Log the duration of request processing
	duration := time.Since(start)
	fmt.Printf("Request processed in %s\n", duration)
}

