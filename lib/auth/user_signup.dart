import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/auth/auth_service.dart';
import 'package:expense_tracker/auth/user_login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  Future<void> registerUser(BuildContext context) async {
    final authService = AuthService();
    final errorMessage =
        await authService.signUp(emailController.text, passwordController.text);

    if (errorMessage == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Registered successfully! Check your email.'),
      ));

      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserLogin()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 9, 9),
        elevation: 0,
        leading: IconButton(
          icon: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color.fromARGB(75, 222, 98, 98),
                Color.fromARGB(255, 251, 165, 111)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            // Navigation logic removed
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(75, 222, 98, 98),
                      Color.fromARGB(255, 251, 165, 111)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcIn,
                child: const Icon(
                  Icons.currency_rupee_sharp,
                  weight: 100,
                  size: 40,
                )),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(241, 8, 9, 9),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User\nSign Up.',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 251, 207, 77),
                          Color.fromARGB(0, 255, 94, 97)
                        ],
                      ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'A confirmation email will be sent to your inbox after you sign up, Make sure to confirm it to login.',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.firaCode(
                      color: const Color.fromARGB(255, 52, 208, 255),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 202, 26, 26),
                        fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: const Color(0xFFE8FFDB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 109, 109, 109)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 109, 109, 109), width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 202, 26, 26),
                        fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: const Color(0xFFE8FFDB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 109, 109, 109), width: 2),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => registerUser(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(217, 255, 170, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
