### **Back-end-Project**


This document provides instructions for setting up and running the backend server for the Airtribe application, as well as details on the database design and APIs implemented.

## **Installation**

Visual Studio Code Extensions

Make sure you have the following extensions installed in Visual Studio Code:

Code Runner
JavaScript (ES6) code snippets
Node.js

Ensure that Node.js is installed on your system. You can download it from nodejs.org. 
or 
you can install in vs code 


Navigate to the project directory and install the required dependencies:

bash
Copy code
cd airtribe-backend
npm install
Database Design

### **Framework**

The framework used for this backend server is Express.js. Express.js is a popular web application framework for Node.js, providing a robust set of features to build web and mobile applications.

Here's how Express.js is utilized in this code:

Importing Express: The Express framework is imported using the require() function:

javascript
Copy code
const express = require('express');
Creating an Express Application: An instance of the Express application is created:

javascript
Copy code
const app = express();
Middleware Usage: Various middleware are utilized in the application, such as body-parser for parsing JSON request bodies and cors for enabling Cross-Origin Resource Sharing:

javascript
Copy code
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(bodyParser.json());
app.use(cors());
Defining Routes: Routes are defined for handling different HTTP requests. For example:

javascript
Copy code
app.post('/instructors', (req, res) => {
  // Handle POST request to create a new instructor
});

app.get('/instructors', (req, res) => {
  // Handle GET request to fetch all instructors
});
Starting the Server: Finally, the Express application is configured to listen on a specific port:

javascript
Copy code
const PORT = process.env.PORT || 34060; // Default port is 34060
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
By utilizing Express.js, the code simplifies the process of handling HTTP requests, defining routes, and managing the server's lifecycle.





### **The database schema for the Airtribe application is as follows:**

Database Tables
## *Instructors*
id INT (Primary Key)
name VARCHAR(255) NOT NULL
email VARCHAR(255) NOT NULL (Unique)

## *Courses*
id INT (Primary Key)
instructor_id INT (Foreign Key referencing Instructors.id)
name VARCHAR(255) NOT NULL
max_seats INT
start_date DATE

## *Leads*
id INT (Primary Key)
course_id INT (Foreign Key referencing Courses.id)
name VARCHAR(255) NOT NULL
email VARCHAR(255) NOT NULL
phone VARCHAR(20)
linkedin_profile VARCHAR(255)
status VARCHAR(20) DEFAULT 'Pending'

## *Comments*
id INT (Primary Key)
lead_id INT (Foreign Key referencing Leads.id)
comment TEXT

Run the following command to start the backend server:

Copy code
node server.js
The server will start running on port 34060 by default.

### **APIs**

Airtribe Backend APIs
This document outlines the APIs available in the Airtribe backend server.

## *Instructors*

Create Instructor:
Endpoint: POST /instructors
Description: Creates a new instructor.
Request Body: { name, email }

Get All Instructors:
Endpoint: GET /instructors
Description: Retrieves all instructors.

## *Courses*

Create Course:
Endpoint: POST /courses
Description: Creates a new course.
Request Body: { name, instructor_id, max_seats, start_date }

Get All Courses:
Endpoint: GET /courses
Description: Retrieves all courses.

Update Course Details:
Endpoint: PUT /courses/:id
Description: Updates details of a specific course.
Request Body: { name, max_seats, start_date }

## *Leads*

Update Lead Status:
Endpoint: PUT /leads/:id/update
Description: Updates the status of a lead.
Request Body: { status }

Search Leads:
Endpoint: GET /leads/search
Description: Searches leads by name or email.
Query Parameters: { name, email }

## *Comments*

Add Comment:
Endpoint: POST /comments
Description: Adds a comment to a lead.
Request Body: { lead_id, comment }

Get All Comments:
Endpoint: GET /comments
Description: Retrieves all comments.

Course Registration
Register for a Course:
Endpoint: POST /register
Description: Registers a user for a course.
Request Body: { name, email, phone, linkedin }

Get All Registrations:
Endpoint: GET /registrations
Description: Retrieves all course registrations

### **Test data can be manually inserted into the database or generated using Postman requests.**

### Conclusion
Follow the provided instructions to set up and run the Airtribe backend server. If you encounter any issues or have questions, feel free to reach out to ambica34@gmail.com.

### *Happy Coding!*
