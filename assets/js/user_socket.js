import { Socket } from "phoenix";

let token = localStorage.getItem("firebaseToken"); 

let socket = new Socket("/socket", { params: { token } });

socket.connect();

export default socket;
