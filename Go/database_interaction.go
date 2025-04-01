package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/mattn/go-sqlite3" // SQLite driver
)

// User represents a database record
type User struct {
	ID    int
	Name  string
	Email string
}

func main() {
	// Step 1: Connect to database (or create if not exists)
	db, err := sql.Open("sqlite3", "users.db")
	if err != nil {
		log.Fatal("Error opening database:", err)
	}
	defer db.Close()

	// Step 2: Create users table if it doesn't exist
	createTable(db)

	// Step 3: Insert data into the table
	insertUser(db, "Alice", "alice@example.com")
	insertUser(db, "Bob", "bob@example.com")

	// Step 4: Retrieve all users
	fmt.Println("All users in the database:")
	users := getUsers(db)
	for _, user := range users {
		fmt.Printf("ID: %d | Name: %s | Email: %s\n", user.ID, user.Name, user.Email)
	}

	// Step 5: Update user data
	updateUser(db, 1, "Alice Johnson", "alice.j@example.com")

	// Step 6: Retrieve and print updated user
	user := getUserByID(db, 1)
	fmt.Println("\nUpdated User 1:")
	fmt.Printf("ID: %d | Name: %s | Email: %s\n", user.ID, user.Name, user.Email)

	// Step 7: Delete a user
	deleteUser(db, 2)

	// Step 8: Show remaining users
	fmt.Println("\nUsers after deletion:")
	users = getUsers(db)
	for _, user := range users {
		fmt.Printf("ID: %d | Name: %s | Email: %s\n", user.ID, user.Name, user.Email)
	}
}

// createTable ensures the users table exists
func createTable(db *sql.DB) {
	query := `
	CREATE TABLE IF NOT EXISTS users (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		name TEXT NOT NULL,
		email TEXT UNIQUE NOT NULL
	);`
	_, err := db.Exec(query)
	if err != nil {
		log.Fatal("Error creating table:", err)
	}
}

// insertUser adds a new user to the database
func insertUser(db *sql.DB, name, email string) {
	query := `INSERT INTO users (name, email) VALUES (?, ?)`
	_, err := db.Exec(query, name, email)
	if err != nil {
		log.Fatal("Error inserting user:", err)
	}
}

// getUsers retrieves all users from the database
func getUsers(db *sql.DB) []User {
	query := `SELECT id, name, email FROM users`
	rows, err := db.Query(query)
	if err != nil {
		log.Fatal("Error retrieving users:", err)
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Name, &user.Email)
		if err != nil {
			log.Fatal("Error scanning user:", err)
		}
		users = append(users, user)
	}
	return users
}

// getUserByID retrieves a single user by ID
func getUserByID(db *sql.DB, id int) User {
	query := `SELECT id, name, email FROM users WHERE id = ?`
	row := db.QueryRow(query, id)

	var user User
	err := row.Scan(&user.ID, &user.Name, &user.Email)
	if err != nil {
		log.Fatal("Error retrieving user:", err)
	}
	return user
}

// updateUser modifies an existing user record
func updateUser(db *sql.DB, id int, newName, newEmail string) {
	query := `UPDATE users SET name = ?, email = ? WHERE id = ?`
	_, err := db.Exec(query, newName, newEmail, id)
	if err != nil {
		log.Fatal("Error updating user:", err)
	}
}

// deleteUser removes a user from the database
func deleteUser(db *sql.DB, id int) {
	query := `DELETE FROM users WHERE id = ?`
	_, err := db.Exec(query, id)
	if err != nil {
		log.Fatal("Error deleting user:", err)
	}
}
