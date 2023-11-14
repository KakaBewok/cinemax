import 'package:cinemax/main_screen.dart';
import 'package:cinemax/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _signupUsernameController =
      TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final TextEditingController _signupConfirmPasswordController =
      TextEditingController();

  final TextEditingController _loginUsernameController =
      TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: const [ThemeModeToggle()],
          title: const Text(
            'Cinemax',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Signup'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLoginTab(),
            _buildSignupTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Go to mainpage",
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _loginUsernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _loginPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _handleLogin();
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create an account",
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _signupUsernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _signupPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _signupConfirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _handleSignup();
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    String username = _loginUsernameController.text;
    String password = _loginPasswordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog('All field must be filled in!');
    } else {
      _showSuccessDialog('Login Success!');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }

  void _handleSignup() {
    String username = _signupUsernameController.text;
    String password = _signupPasswordController.text;
    String confirmPassword = _signupConfirmPasswordController.text;

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('All field must be filled in!');
    } else if (password != confirmPassword) {
      _showErrorDialog('Password and Confirm Password must match!');
    } else {
      _showSuccessDialog('Success!');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
