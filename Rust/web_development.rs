// web_development.rs

use warp::Filter;
use serde::{Serialize, Deserialize};
use tokio;

#[tokio::main]
async fn main() {
    // --------------------------
    // Basic "Hello World" Route
    // --------------------------
    // This route listens on `/hello` and returns a simple HTML response.
    let hello = warp::path!("hello")
        .map(|| warp::reply::html("Hello, World!"));

    // ------------------------------
    // Dynamic User Route (GET Request)
    // ------------------------------
    // This route listens on `/user/{name}` and returns a JSON response.
    // For example: `GET http://127.0.0.1:3030/user/Alice` will return `{"name":"Alice"}`.
    let user = warp::path!("user" / String)
        .map(|name: String| {
            let user = User { name }; // Create a User struct with the provided name
            warp::reply::json(&user) // Return the user as JSON
        });

    // ------------------------
    // POST Route to Create User
    // ------------------------
    // This route listens on `/create_user` and expects a JSON payload in the body.
    // It returns the user object as a JSON response.
    let create_user = warp::path!("create_user")
        .and(warp::post()) // Specify that this route only accepts POST requests
        .and(warp::body::json()) // Extract the JSON body from the request
        .map(|user: User| {
            // Here, you would typically save the user to a database or perform other actions.
            println!("Received new user: {:?}", user); // Print the user to the console
            warp::reply::json(&user) // Return the created user as a JSON response
        });

    // --------------------------
    // Combine All Routes Together
    // --------------------------
    // We use `.or()` to combine multiple routes into one handler.
    let routes = hello.or(user).or(create_user);

    // -----------------------------
    // Start the Web Server
    // -----------------------------
    // This will start the web server and listen on 127.0.0.1:3030.
    warp::serve(routes)
        .run(([127, 0, 0, 1], 3030)) // Run the server at localhost:3030
        .await;
}

// ----------------------------------------
// User Struct for Dynamic Data Handling
// ----------------------------------------
#[derive(Serialize, Deserialize, Debug)] // Enable serialization and deserialization
struct User {
    name: String,
}

// ----------------------------------------
// Extra Routes and Examples
// ----------------------------------------

/// A simple route that returns a static JSON object with hardcoded values
async fn static_json() -> impl warp::Reply {
    let response = json!({
        "status": "success",
        "message": "This is a static JSON response"
    });
    warp::reply::json(&response)
}

/// A route that echoes the provided text in the URL as a query parameter
async fn echo_text(query: String) -> impl warp::Reply {
    let response = format!("You said: {}", query);
    warp::reply::html(response)
}

#[tokio::main]
async fn extended_example() {
    // Static JSON route
    let json_route = warp::path!("static_json")
        .map(static_json);

    // Echo text route that extracts query parameter from the URL
    let echo_route = warp::path!("echo")
        .and(warp::query::<HashMap<String, String>>())  // Extract query parameters
        .map(|query: HashMap<String, String>| {
            let text = query.get("text").unwrap_or(&String::from("No text provided"));
            format!("You said: {}", text)
        });

    // Combine the extended routes into one
    let extended_routes = json_route.or(echo_route);

    // Run the extended server
    warp::serve(extended_routes)
        .run(([127, 0, 0, 1], 3031)) // Start server at localhost:3031
        .await;
}

