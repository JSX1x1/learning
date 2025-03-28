import socket
import threading

# Server function
def start_server():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(("127.0.0.1", 5555))  # Binding server to localhost on port 5555
    server_socket.listen(5)  # Listen for incoming connections (max 5)
    print("Server listening on port 5555...")
    
    while True:
        client_socket, client_address = server_socket.accept()  # Accept connection
        print(f"Connection from {client_address}")
        client_handler = threading.Thread(target=handle_client, args=(client_socket,))
        client_handler.start()

# Client handler function
def handle_client(client_socket):
    client_socket.send(b"Welcome to the server!")
    
    while True:
        message = client_socket.recv(1024)  # Receive up to 1024 bytes
        if not message:
            break
        print(f"Received message: {message.decode()}")
        client_socket.send(b"Message received.")  # Send acknowledgment message
    
    client_socket.close()

# Client function
def start_client():
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect(("127.0.0.1", 5555))  # Connect to the server on localhost and port 5555
    
    print(client_socket.recv(1024).decode())  # Receive initial message from server
    
    while True:
        message = input("Enter message to send to server: ")
        client_socket.send(message.encode())  # Send message to server
        response = client_socket.recv(1024)  # Receive response from server
        print(f"Server response: {response.decode()}")
        
        if message.lower() == "exit":
            print("Closing connection.")
            break

    client_socket.close()

if __name__ == "__main__":
    option = input("Start server or client? (s/c): ").strip().lower()
    
    if option == "s":
        start_server()
    elif option == "c":
        start_client()
    else:
        print("Invalid option. Exiting.")
