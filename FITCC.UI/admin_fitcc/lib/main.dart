import 'package:admin_fitcc/models/auth_request.dart';
import 'package:admin_fitcc/models/auth_response.dart';
import 'package:admin_fitcc/providers/login_provider.dart';
import 'package:admin_fitcc/screens/welcome/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Change this to LoginPage
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _errorMessageController = TextEditingController();

  Future<void> _login() async {
    var authService = LoginService();
    AuthResponse? response = await authService.loginAction(
        AuthRequest(_usernameController.text, _passwordController.text));
    if (response!.result) {
      // Successful login, navigate to home page
      Navigator.pushNamed(context, '/homePage');
    } else {
      // Login failure, show an error message
      setState(() {
        _errorMessageController.text = "Invalid username or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Login"),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fitcc_logo.png",
                    height: 100,
                    width: 100,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.email),
                    ),
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.password),
                    ),
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  },
  child: const Text("Login"),
),
                  if (_errorMessageController.text.isNotEmpty)
                    Text(
                      _errorMessageController.text,
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Remaining code remains the same...
