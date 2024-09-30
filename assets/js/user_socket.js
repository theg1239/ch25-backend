// assets/js/user_socket.js
import { Socket } from "phoenix";

let token = localStorage.getItem("firebaseToken"); // Retrieve the token from storage

let socket = new Socket("/socket", { params: { token } });

// Connect the socket
socket.connect();

// Export the socket for use in components
export default socket;
