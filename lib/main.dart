import 'package:flutter/material.dart';

void main() {
  runApp(RentMateApp());
}

class RentMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RentMate",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true; // toggle for show/hide password

  void login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "admin@gmail.com" && password == "123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Email or Password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.home_work,
                size: 90,
                color: Colors.teal,
              ),

              SizedBox(height: 10),

              Text(
                "RentMate",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 40),

              // EMAIL
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // PASSWORD with SHOW/HIDE
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // LOGIN BUTTON
              ElevatedButton(
                onPressed: () => login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              SizedBox(height: 15),

              TextButton(
                onPressed: () {},
                child: Text(
                  "Register Account",
                  style: TextStyle(color: Colors.teal),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {

  final List<Map<String, String>> popularHomes = [
    {
      "title": "Condo in Colombo",
      "price": "Rs21,796 for 2 months",
      "rating": "4.82",
      "image": "img1.png"
    },
    {
      "title": "Villa in Kandy",
      "price": "Rs24,976 for 2 nights",
      "rating": "4.91",
      "image": "img2.png"
    },
  ];

  final List<Map<String, String>> nextMonthHomes = [
    {
      "title": "Apartment in Battaramulla",
      "price": "Rs30,500 for 3 months",
      "rating": "4.85",
      "image": "img3.png"
    },
    {
      "title": "Apartment in Kalutara",
      "price": "Rs28,400 for 2 nights",
      "rating": "4.90",
      "image": "img4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: "Start your search",
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Color(0xFF1B263B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 16),

              // CATEGORY ICONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _categoryIcon(Icons.home, "Homes"),
                  _categoryIcon(Icons.explore, "Experiences", isNew: true),
                  _categoryIcon(Icons.room_service, "Services", isNew: true),
                ],
              ),

              SizedBox(height: 16),

              // POPULAR HOMES
              _sectionTitle("Popular homes in Kuala Lumpur"),
              SizedBox(height: 8),
              _horizontalList(popularHomes),

              SizedBox(height: 16),

              // NEXT MONTH HOMES
              _sectionTitle("Available next month in Dubai"),
              SizedBox(height: 8),
              _horizontalList(nextMonthHomes),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1B263B),
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Log in"),
        ],
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label, {bool isNew = false}) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Color(0xFF1B263B),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            if (isNew)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(12)),
                  child: Text("NEW", style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              )
          ],
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        Icon(Icons.arrow_forward, color: Colors.white),
      ],
    );
  }

  Widget _horizontalList(List<Map<String, String>> homes) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homes.length,
        itemBuilder: (context, index) {
          var home = homes[index];
          return Container(
            width: 160,
            margin: EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    home["image"]!,
                    height: 200,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("Guest favorite",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(home["title"]!,
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("${home["price"]!} • ★${home["rating"]!}",
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}