// Firebase configuration
const firebaseConfig = {
apiKey: "YOUR_API_KEY",
authDomain: "YOUR_DOMAIN",
databaseURL: "YOUR_DATABASE_URL",
projectId: "YOUR_PROJECT_ID",
storageBucket: "YOUR_BUCKET",
messagingSenderId: "YOUR_ID",
appId: "YOUR_APP_ID"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

// Database reference
const db = firebase.database().ref("messages");

// Send message
function sendMessage(){

let username = document.getElementById("username").value;
let message = document.getElementById("message").value;

if(username=="" || message=="") return;

db.push({
user: username,
text: message,
time: Date.now()
});

document.getElementById("message").value="";
}

// Receive messages in real time
db.on("child_added", function(snapshot){

let data = snapshot.val();

let msgDiv = document.createElement("div");

msgDiv.className="message";

msgDiv.innerHTML =
"<b>"+data.user+":</b> "+data.text;

document.getElementById("chatBox").appendChild(msgDiv);

});
