const cors = require('cors');

const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

const app = express();
app.use(bodyParser.json());

// Create a connection to the MySQL database
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Ambica123@',
  database: 'airtribe'
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Database connection successful');
});

// APIs...

// Route to create a new instructor
app.post('/instructors', (req, res) => {
  const { name, email } = req.body;
  const sql = 'INSERT INTO instructors (name, email) VALUES (?, ?)';
  db.query(sql, [name, email], (err, result) => {
    if (err) {
      console.error('Error adding instructor:', err);
      res.status(500).send('Error adding instructor');
      return;
    }
    console.log('Instructor added successfully');
    res.status(201).send('Instructor added successfully');
  });
});

// Route to get all instructors
app.get('/instructors', (req, res) => {
  const sql = 'SELECT * FROM instructors';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching instructors:', err);
      res.status(500).send('Error fetching instructors');
      return;
    }
    res.json(results);
  });
});


app.post('/courses', (req, res) => {
  const { name, instructor_id, max_seats, start_date } = req.body;

   //const formattedStartDate = start_date ? new Date(start_date).toISOString().substring(0, 10) : null;
  const formattedStartDate = start_date ? start_date.substring(0, 10) : null;

  const sql = 'INSERT INTO courses (name, instructor_id, max_seats, start_date) VALUES (?, ?, ?, ?)';
  db.query(sql, [name, instructor_id, max_seats, formattedStartDate], (err, result) => {
      if (err) {
          console.error('Error creating course:', err);
          res.status(500).send('Error creating course');
          return;
      }
      console.log('Course created successfully');
      res.status(201).send('Course created successfully');
  });
});

app.use(cors());
const corsOptions = {
  origin: 'http://example.com', // Specify the allowed origin
  methods: ['POST', 'GET'],      // Specify the allowed HTTP methods
  allowedHeaders: ['Content-Type'] // Specify the allowed headers
};

app.use(cors(corsOptions));


  


  app.get('/courses', (req, res) => {
    const sql = 'SELECT * FROM courses';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error getting courses:', err);
            res.status(500).send('Error getting courses');
            return;
        }
        res.json(results);
    });
});


app.put('/courses/:id', (req, res) => {
  const courseId = req.params.id;
  const { name, max_seats, start_date } = req.body;


 // const formattedStartDate = start_date ? start_date.substring(0, 10) : null;
  const formattedStartDate = start_date ? new Date(start_date).toISOString().substring(0, 10) : null;



  const sql = 'UPDATE courses SET name = ?, max_seats = ?, start_date = ? WHERE id = ?';
  db.query(sql, [name, max_seats, formattedStartDate, courseId], (err, result) => {
      if (err) {
          console.error('Error updating course:', err);
          res.status(500).send('Error updating course');
          return;
      }
      if (result.affectedRows === 0) {
          res.status(404).send('Course not found');
          return;
      }
      console.log('Course updated successfully');
      res.send('Course updated successfully');
  });
});



// Course registration endpoint
app.post('/register', (req, res) => {
  const { name, email, phone, linkedin } = req.body;

  // Basic validation
  if (!name || !email || !phone || !linkedin) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  // Insert registration data into the database
  const sql = 'INSERT INTO course_registrations (name, email, phone, linkedin) VALUES (?, ?, ?, ?)';
  db.query(sql, [name, email, phone, linkedin], (err, result) => {
    if (err) {
      console.error('Error registering for course:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }
    console.log('Course registration successful');
    res.status(201).json({ message: 'Course registration successful' });
  });
});

// API Get all registrations endpoint
app.get('/registrations', (req, res) => {
  // Fetch all course registrations from the database
  const sql = 'SELECT * FROM course_registrations';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error getting registrations:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }
    res.json(results);
  });
});


  
  // API to get a single user by ID
  // app.get('/users/:id', (req, res) => {
  //   const userId = req.params.id;
  //   const sql = 'SELECT * FROM users WHERE id = ?';
  //   db.query(sql, [userId], (err, results) => {
  //     if (err) {
  //       console.error('Error getting user:', err);
  //       res.status(500).send('Error getting user');
  //       return;  
  //     }
  //     if (results.length === 0) {
  //       res.status(404).send('User not found');
  //       return;
  //     }
  //     res.json(results[0]);
  //   });
  // });

/////////////////////////////////////////////////////////////////////////////////////////

  app.put('/leads/:id/update', (req, res) => {
    const leadId = req.params.id;
    const { status } = req.body;
  
    // Update the lead status in the database
    const sql = 'UPDATE leads SET status = ? WHERE id = ?';
    db.query(sql, [status, leadId], (err, result) => {
      if (err) {
        console.error('Error updating lead status:', err);
        res.status(500).send('Error updating lead status');
        return;
      }
      if (result.affectedRows === 0) {
        res.status(404).send('Lead not found');
        return;
      }
      console.log('Lead status updated successfully');
      res.send('Lead status updated successfully');
    });
  });

///////////////////////////////////////////////////////////////////////////

  app.get('/leads/search', (req, res) => {
    const { name, email } = req.query;

    let sql = 'SELECT * FROM leads WHERE 1';
    const params = [];

    if (name) {
        sql += ' AND name LIKE ?';
        params.push(`%${name}%`);
    }

    if (email) {
        sql += ' AND email = ?';
        params.push(email);
    }

    db.query(sql, params, (err, results) => {
        if (err) {
            console.error('Error searching leads:', err);
            res.status(500).send('Error searching leads');
            return;
        }
        res.json(results);
    });
});






  
  // API to update a user by ID
  // app.put('/users/:id', (req, res) => {
  //   const userId = req.params.id;
  //   const { username, email } = req.body;
  //   const sql = 'UPDATE users SET username = ?, email = ? WHERE id = ?';
  //   db.query(sql, [username, email, userId], (err, result) => {
  //     if (err) {
  //       console.error('Error updating user:', err);
  //       res.status(500).send('Error updating user');
  //       return;
  //     }
  //     if (result.affectedRows === 0) {
  //       res.status(404).send('User not found');
  //       return;
  //     }
  //     console.log('User updated successfully');
  //     res.send('User updated successfully');
  //   });
  // });



  
  // API to delete a user by ID
  // app.delete('/users/:id', (req, res) => {
  //   const userId = req.params.id;
  //   const sql = 'DELETE FROM users WHERE id = ?';
  //   db.query(sql, [userId], (err, result) => {
  //     if (err) {
  //       console.error('Error deleting user:', err);
  //       res.status(500).send('Error deleting user');
  //       return;
  //     }
  //     if (result.affectedRows === 0) {
  //       res.status(404).send('User not found');
  //       return;
  //     }
  //     console.log('User deleted successfully');
  //     res.send('User deleted successfully');
  //   });
  // });


  app.get('/leads/search', (req, res) => {
    const { name, email } = req.query;
    let sql = 'SELECT * FROM leads WHERE 1';
    const params = [];
    if (name) {
        sql += ' AND name = ?';
        params.push(name);
    }
    if (email) {
        sql += ' AND email = ?';
        params.push(email);
    }
    db.query(sql, params, (err, results) => {
        if (err) {
            console.error('Error searching leads:', err);
            res.status(500).send('Error searching leads');
            return;
        }
        res.json(results);
    });
});

app.get('/leads', (req, res) => {
  const { name, email } = req.query;
  let sql = 'SELECT * FROM leads WHERE 1';
  const params = [];
  if (name) {
      sql += ' AND name = ?';
      params.push(name);
  }
  if (email) {
      sql += ' AND email = ?';
      params.push(email);
  }
  db.query(sql, params, (err, results) => {
      if (err) {
          console.error('Error searching leads:', err);
          res.status(500).send('Error searching leads');
          return;
      }
      res.json(results);
  });
});






// app.get('/comments', (req, res) => {
//   const { lead_id, comment } = req.body;
//   const sql = 'INSERT INTO comments (lead_id, comment) VALUES (?, ?)';
//   db.query(sql, [lead_id, comment], (err, result) => {
//       if (err) {
//           console.error('Error adding comment:', err);
//           res.status(500).send('Error adding comment');
//           return;
//       }
//       console.log('Comment added successfully');
//       res.status(201).send('Comment added successfully');
//   });
// });
app.get('/comments', (req, res) => {
  // Query to fetch comments from the database
  const sql = 'SELECT * FROM comments';
  
  // Execute the query
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching comments:', err);
      res.status(500).json({ error: 'Error fetching comments' });
      return;
    }

    // Send the fetched comments back in the response
    res.json(results);
  });
});


app.post('/comments', (req, res) => {
  const { lead_id, comment } = req.body;
  const sql = 'INSERT INTO comments (lead_id, comment) VALUES (?, ?)';
  db.query(sql, [lead_id, comment], (err, result) => {
    if (err) {
      console.error('Error adding comment:', err);
      res.status(500).send('Error adding comment');
      return;
    }
    
    const insertedId = result.insertId;

    // Fetch the inserted comment from the database
    const selectSql = 'SELECT * FROM comments WHERE id = ?';
    db.query(selectSql, [insertedId], (selectErr, selectResult) => {
      if (selectErr) {
        console.error('Error fetching comment:', selectErr);
        res.status(500).send('Error fetching comment');
        return;
      }
      
      // Send the fetched comment back in the response
      const insertedComment = selectResult[0];
      console.log('Comment added successfully:', insertedComment);
      res.status(201).json(insertedComment);
    });
  });
});




  
  // Start the server
  const PORT = process.env.PORT || 34060;


  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
  











