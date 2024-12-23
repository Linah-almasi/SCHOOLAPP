// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'password123') {
      // Navigate to HomePage on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to BROOKSIDE ACADEMY',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/icons/download.jpg', // Path to your school logo
              height: 30, // Adjust the height to fit in the AppBar
            ),
            const SizedBox(width: 10),
            const Text('BROOKSIDE ACADEMY'), // School name
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // School Logo and Welcome Message
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/download.jpg', // Path to your school logo
                      height: 120, // Adjust the height as needed
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome to BROOKSIDE ACADEMY',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // School Information Section
              const Text(
                'About BROOKSIDE ACADEMY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.teal),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Location: 456 Elm Street, Springfield',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.school, color: Colors.teal),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Type: Co-educational Secondary School',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, color: Colors.teal),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Founded: 1990',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.people, color: Colors.teal),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Founders: Dr. Sarah Brown & Mr. John Carter',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.teal),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Principal: Dr. Emily Stone',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Navigation Buttons Section
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ClassesPage()),
                        );
                      },
                      child: const Text('View Classes'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TeachersPage()),
                        );
                      },
                      child: const Text('View Teachers'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StudentsPage()),
                        );
                      },
                      child: const Text('View Students'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title: Text('Math 101', style: TextStyle(color: Colors.teal)),
              subtitle:
                  Text('Mr. John Doe', style: TextStyle(color: Colors.teal)),
              leading: Icon(Icons.calculate, color: Colors.teal),
            ),
          ),
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title: Text('Science 202', style: TextStyle(color: Colors.green)),
              subtitle:
                  Text('Ms. Jane Smith', style: TextStyle(color: Colors.green)),
              leading: Icon(Icons.science, color: Colors.green),
            ),
          ),
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title: Text('History 303', style: TextStyle(color: Colors.red)),
              subtitle:
                  Text('Mr. Alan Brown', style: TextStyle(color: Colors.red)),
              leading: Icon(Icons.history_edu, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title: Text('Mr. John Doe', style: TextStyle(color: Colors.blue)),
              subtitle:
                  Text('Math Department', style: TextStyle(color: Colors.blue)),
              leading: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title:
                  Text('Ms. Jane Smith', style: TextStyle(color: Colors.green)),
              subtitle: Text('Science Department',
                  style: TextStyle(color: Colors.green)),
              leading: Icon(Icons.person, color: Colors.green),
            ),
          ),
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title:
                  Text('Mr. Alan Brown', style: TextStyle(color: Colors.red)),
              subtitle: Text('History Department',
                  style: TextStyle(color: Colors.red)),
              leading: Icon(Icons.person, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title:
                  Text('Alice Johnson', style: TextStyle(color: Colors.blue)),
              subtitle: Text('Grade 10', style: TextStyle(color: Colors.blue)),
              leading: Icon(Icons.school, color: Colors.blue),
            ),
          ),
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title: Text('Bob Davis', style: TextStyle(color: Colors.green)),
              subtitle: Text('Grade 11', style: TextStyle(color: Colors.green)),
              leading: Icon(Icons.school, color: Colors.green),
            ),
          ),
          Card(
            color: Colors.teal[50],
            child: const ListTile(
              title:
                  Text('Charlie Wilson', style: TextStyle(color: Colors.red)),
              subtitle: Text('Grade 12', style: TextStyle(color: Colors.red)),
              leading: Icon(Icons.school, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
