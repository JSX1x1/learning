package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"net"
	"net/http"
	"os"
	"time"

	"golang.org/x/net/websocket"
)

// ========== SECTION 1: TCP SERVER & CLIENT ==========

// startTCPServer starts a simple TCP server that listens on port 9000
func startTCPServer() {
	listener, err := net.Listen("tcp", ":9000")
	if err != nil {
		log.Fatal("Error starting TCP server:", err)
	}
	defer listener.Close()

	fmt.Println("TCP Server started on port 9000")

	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Println("Connection error:", err)
			continue
		}
		go handleTCPConnection(conn) // Handle client in a new goroutine
	}
}

// handleTCPConnection processes incoming TCP client messages
func handleTCPConnection(conn net.Conn) {
	defer conn.Close()
	reader := bufio.NewReader(conn)

	for {
		message, err := reader.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				fmt.Println("Client disconnected")
			} else {
				log.Println("Error reading message:", err)
			}
			return
		}

		fmt.Print("Received from client:", message)
		conn.Write([]byte("Message received: " + message)) // Echo message back
	}
}

// startTCPClient connects to the TCP server and sends messages
func startTCPClient() {
	conn, err := net.Dial("tcp", "127.0.0.1:9000")
	if err != nil {
		log.Fatal("Error connecting to TCP server:", err)
	}
	defer conn.Close()

	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Print("Enter message: ")
		msg, _ := reader.ReadString('\n')
		conn.Write([]byte(msg))
	}
}

// ========== SECTION 2: UDP SERVER & CLIENT ==========

// startUDPServer starts a simple UDP server on port 9001
func startUDPServer() {
	addr, err := net.ResolveUDPAddr("udp", ":9001")
	if err != nil {
		log.Fatal(err)
	}

	conn, err := net.ListenUDP("udp", addr)
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	fmt.Println("UDP Server listening on port 9001")

	buffer := make([]byte, 1024)
	for {
		n, clientAddr, err := conn.ReadFromUDP(buffer)
		if err != nil {
			log.Println("Error receiving data:", err)
			continue
		}

		message := string(buffer[:n])
		fmt.Printf("Received from %s: %s\n", clientAddr, message)

		conn.WriteToUDP([]byte("Message received\n"), clientAddr) // Send acknowledgment
	}
}

// startUDPClient sends a UDP message to the server
func startUDPClient() {
	serverAddr, err := net.ResolveUDPAddr("udp", "127.0.0.1:9001")
	if err != nil {
		log.Fatal(err)
	}

	conn, err := net.DialUDP("udp", nil, serverAddr)
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	message := "Hello, UDP Server!"
	_, err = conn.Write([]byte(message))
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Message sent to UDP server")
}

// ========== SECTION 3: HTTP REQUESTS ==========

// fetchWebsite makes an HTTP GET request to a given URL
func fetchWebsite(url string) {
	resp, err := http.Get(url)
	if err != nil {
		log.Fatal("HTTP request failed:", err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Website Response:\n", string(body))
}

// ========== SECTION 4: WEBSOCKET SERVER & CLIENT ==========

// startWebSocketServer starts a WebSocket server on port 8080
func startWebSocketServer() {
	http.Handle("/ws", websocket.Handler(handleWebSocket))
	fmt.Println("WebSocket Server started on ws://localhost:8080/ws")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

// handleWebSocket manages WebSocket connections
func handleWebSocket(ws *websocket.Conn) {
	defer ws.Close()

	for {
		var message string
		err := websocket.Message.Receive(ws, &message)
		if err != nil {
			fmt.Println("WebSocket disconnected")
			break
		}

		fmt.Println("Received from WebSocket Client:", message)
		websocket.Message.Send(ws, "Echo: "+message)
	}
}

// ========== SECTION 5: DNS LOOKUP ==========

// performDNSLookup fetches IP addresses for a given domain
func performDNSLookup(domain string) {
	ips, err := net.LookupIP(domain)
	if err != nil {
		log.Fatal("DNS Lookup failed:", err)
	}
	for _, ip := range ips {
		fmt.Println("Resolved IP:", ip)
	}
}

// ========== SECTION 6: ICMP PING (BASIC) ==========

// performPing sends an ICMP ping request
func performPing(host string) {
	addr, err := net.ResolveIPAddr("ip", host)
	if err != nil {
		log.Fatal("Error resolving address:", err)
	}

	start := time.Now()
	conn, err := net.Dial("ip4:icmp", addr.String())
	if err != nil {
		log.Fatal("Ping failed:", err)
	}
	defer conn.Close()

	fmt.Println("Ping to", addr, "took", time.Since(start))
}

// ========== MAIN FUNCTION ==========

func main() {
	go startTCPServer() // Start TCP Server in a goroutine
	go startUDPServer() // Start UDP Server in a goroutine

	time.Sleep(2 * time.Second) // Allow servers to start before clients run

	// Run clients
	go startTCPClient()
	go startUDPClient()

	// Perform HTTP request
	go fetchWebsite("https://example.com")

	// Run WebSocket server
	go startWebSocketServer()

	// Perform DNS lookup
	go performDNSLookup("google.com")

	// Perform Ping
	go performPing("8.8.8.8")

	select {} // Prevent main function from exiting
}
