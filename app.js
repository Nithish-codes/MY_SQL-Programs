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
const db = firebase.database().ref("tasks");

// Add task
function addTask(){

let task = document.getElementById("taskInput").value;
let user = document.getElementById("userInput").value;
let priority = document.getElementById("priority").value;

if(task === "") return;

db.push({
task: task,
user: user,
priority: priority,
status: "pending"
});

document.getElementById("taskInput").value="";
document.getElementById("userInput").value="";
}

// Listen for new tasks
db.on("child_added", function(snapshot){

let data = snapshot.val();
let id = snapshot.key;

let taskDiv = document.createElement("div");
taskDiv.className="task";
taskDiv.id=id;

taskDiv.innerHTML =
"<b>"+data.task+"</b><br>"+
"User: "+data.user+"<br>"+
"Priority: "+data.priority+"<br>"+
"Status: "+data.status+"<br>"+
"<button onclick='completeTask(\""+id+"\")'>Complete</button>"+
"<button onclick='deleteTask(\""+id+"\")'>Delete</button>";

document.getElementById("taskList").appendChild(taskDiv);

});

// Complete task
function completeTask(id){

firebase.database().ref("tasks/"+id).update({
status:"completed"
});

}

// Delete task
function deleteTask(id){

firebase.database().ref("tasks/"+id).remove();

document.getElementById(id).remove();

}

// Update UI when task changes
db.on("child_changed", function(snapshot){

let data = snapshot.val();
let id = snapshot.key;

let taskDiv = document.getElementById(id);

taskDiv.classList.add("completed");

taskDiv.innerHTML =
"<b>"+data.task+"</b><br>"+
"User: "+data.user+"<br>"+
"Priority: "+data.priority+"<br>"+
"Status: "+data.status;

});

// Search function
function searchTask(){

let input = document.getElementById("searchBox").value.toLowerCase();

let tasks = document.getElementsByClassName("task");

for(let i=0;i<tasks.length;i++){

let txt = tasks[i].innerText.toLowerCase();

if(txt.includes(input))
tasks[i].style.display="block";
else
tasks[i].style.display="none";

}

}
