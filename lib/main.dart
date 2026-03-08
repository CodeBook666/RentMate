import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() {
  runApp(const RentMateApp());
}

class RentMateApp extends StatelessWidget {
  const RentMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RentMate',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class AppColors {
  static const background = Color(0xFF0D1B2A);
  static const teal = Color(0xFF00BFA6);
  static const white = Colors.white;
  static const grey = Colors.grey;
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OutlineTealButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const OutlineTealButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.teal, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.teal),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.teal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// =====================================================
// WELCOME SCREENS
// =====================================================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home_work_rounded,
              size: 110,
              color: AppColors.teal,
            ),
            const SizedBox(height: 20),
            const Text(
              "RentMate",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Smart Boarding & Rental System",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: PrimaryButton(
                text: "Get Started",
                icon: Icons.arrow_forward,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// LOGIN SCREEN
// =====================================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 80, color: AppColors.teal),
            const SizedBox(height: 20),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField("Email", Icons.email),
            const SizedBox(height: 20),
            _buildTextField("Password", Icons.lock, isPassword: true),
            const SizedBox(height: 30),
            PrimaryButton(
              text: "Login",
              icon: Icons.login,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
            ),
            const SizedBox(height: 15),
            OutlineTealButton(
              text: "Create Account",
              icon: Icons.person_add,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.teal),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.teal),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.teal, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// =====================================================
// REGISTER SCREEN
// =====================================================
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        iconTheme: const IconThemeData(color: AppColors.teal),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Continue",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _buildRegField("Full Name", Icons.person),
            _buildRegField("Email", Icons.email),
            _buildRegField("Phone", Icons.phone),
            _buildRegField("Password", Icons.lock, isPassword: true),
            const SizedBox(height: 30),
            PrimaryButton(
              text: "Continue",
              icon: Icons.app_registration,
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SurveyScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegField(
    String label,
    IconData icon, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.teal),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.teal),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.teal, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// SURVEY SCREEN
// =====================================================
class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // Logic to hold the selected values
  final Map<String, String> _responses = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Personalize Your Stay",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Help us find the perfect match based on your lifestyle.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 25),

            // 1. Financial Question
            _buildDropdown("Monthly Budget Range", [
              "Below Rs. 15,000",
              "Rs. 15,000 - 30,000",
              "Rs. 30,000 - 50,000",
              "Above Rs. 50,000",
            ]),

            // 2. Location/Proximity Question
            _buildDropdown("Priority Proximity", [
              "Close to University",
              "Close to Workplace",
              "Near Public Transport",
              "Quiet Residential Area",
            ]),

            // 3. Occupancy Type
            _buildDropdown("Preferred Living Arrangement", [
              "Single Room (Private)",
              "Shared Room (Roommates)",
              "Full Apartment/Annex",
              "Studio",
            ]),

            // 4. Facilities (Important for IT students/Work from home)
            _buildDropdown("Must-have Facility", [
              "High-Speed Wi-Fi",
              "Air Conditioning (AC)",
              "24/7 Security/CCTV",
              "Parking Space",
            ]),

            // 5. Gender Preference (Very common for boarding in SL)
            _buildDropdown("Boarding Type", [
              "Mixed Gender",
              "Girls Only",
              "Boys Only",
            ]),

            const SizedBox(height: 30),

            PrimaryButton(
              text: "Find Properties",
              icon: Icons.search_rounded,
              onPressed: () {
                // Here you would eventually pass _responses to your recommendation logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.teal,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            dropdownColor: const Color(0xFF0D1B2A),
            iconEnabledColor: AppColors.teal,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.05),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.teal, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: options.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _responses[label] = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME SCREEN
// =====================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContentScreen(),
    const RoommateSurveyScreen(),
    const PaymentScreen(),
    const DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "RentMate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications, color: AppColors.teal),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.teal,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Roommate"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Payment"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class HomeContentScreen extends StatelessWidget {
  final List<Map<String, String>> properties = [
    {"image": "assets/img1.png", "title": "Property in Malabe"},
    {"image": "assets/img2.png", "title": "Room in Kandy"},
    {"image": "assets/img3.png", "title": "Room in Colombo"},
    {"image": "assets/img4.png", "title": "Apartment in Galle"},
  ];

  HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return PropertyCard(
          imagePath: properties[index]["image"]!,
          title: properties[index]["title"]!,
        );
      },
    );
  }
}

// =====================================================
// PROPERTY CARD
// =====================================================
class PropertyCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const PropertyCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0D1B2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                color: Colors.grey[900],
                child: const Center(
                  /* child: Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 50,
                  ),*/
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Rs. 15000/month",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                PrimaryButton(
                  text: "View Details",
                  icon: Icons.visibility,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PropertyDetailsScreen(
                          title: title,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// PROPERTY DETAILS SCREEN (Updated Theme)
// =====================================================
class PropertyDetailsScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const PropertyDetailsScreen({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Applied the requested dark blue background color
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.teal, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "RentMate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Property Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.grey[900],
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Info Tiles (Property Name & Address)
            _infoTile(title),
            _infoTile("Udawatte Road, Battaramulla"),

            // Price Bar with White Text and Teal Border
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColors.teal, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: const [
                  Text(
                    "LKR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Changed divider color to white for visibility on dark background
                  SizedBox(
                    height: 25,
                    child: VerticalDivider(color: Colors.white, thickness: 1),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "90,000",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),

            // Facilities Section
            _boxSection(
              "Facilities Included",
              Row(
                children: const [
                  Icon(Icons.check_circle, color: AppColors.teal, size: 18),
                  SizedBox(width: 5),
                  Text("AC", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 20),
                  Icon(Icons.check_circle, color: AppColors.teal, size: 18),
                  SizedBox(width: 5),
                  Text(
                    "Attached Bathroom",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Ratings & Reviews Section
            _boxSection(
              "Ratings & Reviews",
              Column(
                children: [
                  _reviewItem(
                    "User 1",
                    "Great place to stay! Definitely recommend.",
                    4,
                  ),
                  const Divider(color: Colors.white24), // Subtle white divider
                  _reviewItem(
                    "User 2",
                    "Very clean and cozy place to spend time.",
                    5,
                  ),
                ],
              ),
            ),

            // Action Buttons
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "Request",
                    icon: Icons.send,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlineTealButton(
                    text: "Cancel",
                    icon: Icons.close,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.teal, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _boxSection(String title, Widget content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.teal, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  Widget _reviewItem(String user, String comment, int stars) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.account_circle, size: 30, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star,
                      size: 14,
                      color: i < stars ? Colors.amber : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// DASHBOARD SCREEN
// =====================================================
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        _dashTile(
          context,
          "Rent Reminder",
          Icons.alarm,
          const ReminderScreen(),
        ),
        _dashTile(
          context,
          "Maintenance Request",
          Icons.build,
          const MaintenanceRequestScreen(),
        ),
        _dashTile(
          context,
          "Contract Details",
          Icons.description,
          const ContractPreviewScreen(),
        ),
        _dashTile(
          context,
          "Location Tracking",
          Icons.location_on,
          const PublicTransportationScreen(),
        ),
        _dashTile(
          context,
          "Add Property",
          Icons.add_business,
          const AddPropertyScreen(),
        ),
        _dashTile(
          context,
          "Verify Account",
          Icons.verified,
          const OwnerVerificationScreen(),
        ),
      ],
    );
  }

  Widget _dashTile(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D1B2A),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.teal),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.teal, size: 40),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center, // Added for better alignment
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoommateScreen extends StatelessWidget {
  const RoommateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Roommate Matching Screen",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// =====================================================
// PAYMENT SCREEN
// =====================================================
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Controllers to capture the typed text
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _selectedMethod = "Visa Card"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                "Payment Methods",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMethodOption("Visa Card"),
                  _buildMethodOption("Master Card"),
                  _buildMethodOption("Google Pay"),
                ],
              ),
              const SizedBox(height: 30),

              // Input Fields
              _buildPaymentTextField("Enter Cardholder Name", _nameController),
              _buildPaymentTextField(
                "Enter Payment Amount",
                _amountController,
                isNumber: true,
              ),
              _buildPaymentTextField("Enter Sender Name", _senderController),
              _buildPaymentTextField(
                "Enter Sender Account Number",
                _accountController,
                isNumber: true,
              ),
              _buildPaymentTextField(
                "Enter Card Expiry Date",
                _expiryController,
              ),
              _buildPaymentTextField(
                "Enter Card Security Code",
                _cvvController,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              // Submit Button
              PrimaryButton(
                text: "Submit",
                icon: Icons.check_circle_outline,
                onPressed: () {
                  // Logic to handle the data
                  print("Processing payment for: ${_nameController.text}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Payment Details Submitted Successfully!"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMethodOption(String title) {
    bool isSelected = _selectedMethod == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = title),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            size: 18,
            color: AppColors.background,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTextField(
    String hint,
    TextEditingController controller, {
    bool isNumber = false,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.background,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: AppColors.teal, width: 2),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// MAINTENANCE REQUEST SCREEN
// =====================================================
class MaintenanceRequestScreen extends StatefulWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  State<MaintenanceRequestScreen> createState() =>
      _MaintenanceRequestScreenState();
}

class _MaintenanceRequestScreenState extends State<MaintenanceRequestScreen> {
  String _issueType = "Water Problem";
  final TextEditingController _otherIssueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<PlatformFile> _selectedFiles = [];

  Future<void> _pickImages() async {
    if (_selectedFiles.length >= 10) {
      _showLimitDialog();
      return;
    }

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
        withData: true, // Necessary to display the preview using Image.memory
      );

      if (result != null) {
        final remainingSlots = 10 - _selectedFiles.length;
        setState(() {
          _selectedFiles.addAll(result.files.take(remainingSlots));
        });

        if (result.files.length > remainingSlots) {
          _showLimitDialog();
        }
      }
    } catch (e) {
      debugPrint("Error picking files: $e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  void _showLimitDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          _selectedFiles.length >= 10
              ? "You have reached the maximum of 10 images."
              : "Some images were not added. A maximum of 10 images allowed.",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        elevation: 0,
        title: const Text(
          "RentMate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 11, 209, 236),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Maintenance Request",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Issue Selection
            _buildContainer(
              title: "Select the issue type",
              child: Column(
                children:
                    [
                      "Water Problem",
                      "Electricity",
                      "Network Issue",
                      "Other",
                    ].map((issue) {
                      return RadioListTile(
                        activeColor: const Color(0xFF26A69A),
                        contentPadding: EdgeInsets.zero,
                        title: issue == "Other"
                            ? TextField(
                                controller: _otherIssueController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: "Specify here...",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  isDense: true,
                                ),
                              )
                            : Text(
                                issue,
                                style: const TextStyle(color: Colors.white),
                              ),
                        value: issue,
                        groupValue: _issueType,
                        onChanged: (val) =>
                            setState(() => _issueType = val.toString()),
                      );
                    }).toList(),
              ),
            ),

            const SizedBox(height: 15),

            // Description Box
            _buildContainer(
              title: "Description",
              child: TextField(
                controller: _descriptionController,
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type details here...",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Upload Box
            _buildContainer(
              title: "Upload images (Max 10)",
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImages,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _selectedFiles.isEmpty
                                ? "Click to browse images"
                                : "${_selectedFiles.length} images selected",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image Preview Gallery
                  if (_selectedFiles.isNotEmpty)
                    Container(
                      height: 110,
                      margin: const EdgeInsets.only(top: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedFiles.length,
                        itemBuilder: (context, index) {
                          final file = _selectedFiles[index];
                          return Stack(
                            children: [
                              Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                  right: 12,
                                  top: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFF26A69A),
                                  ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: file.bytes != null
                                    ? Image.memory(
                                        file.bytes!,
                                        fit: BoxFit.cover,
                                      )
                                    : const Center(
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.white24,
                                        ),
                                      ),
                              ),
                              // Working Cross Button
                              Positioned(
                                top: 0,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () => _removeImage(index),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.redAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                print("Submitting Maintenance for: $_issueType");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF26A69A),
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Request",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF26A69A)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

// =====================================================
// REMINDER SCREEN
// =====================================================
class ReminderScreenState extends State<ReminderScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  bool _remindEveryMonth = false;
  bool _snooze = false;
  bool _vibration = false;

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        title: const Text(
          "RentMate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 12, 244, 252),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Text(
              "Reminder Settings",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            _buildTextInputField("Enter Reminder Date", _dateController),
            _buildTextInputField("Enter Reminder Time", _timeController),

            const SizedBox(height: 10),

            _buildToggleOption(
              "Remind Every Month",
              value: _remindEveryMonth,
              onChanged: (newValue) =>
                  setState(() => _remindEveryMonth = newValue),
            ),
            _buildToggleOption(
              "Snooze",
              subtitle: "5 minutes, 3 times",
              value: _snooze,
              onChanged: (newValue) => setState(() => _snooze = newValue),
            ),
            _buildToggleOption(
              "Vibration",
              subtitle: "Basic call",
              value: _vibration,
              onChanged: (newValue) => setState(() => _vibration = newValue),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "Cancel",
                    icon: Icons.close,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PrimaryButton(
                    text: "Save",
                    icon: Icons.check_circle,
                    onPressed: () {
                      print("Date: ${_dateController.text}");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInputField(
    String hintText,
    TextEditingController controller,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        border: Border.all(color: AppColors.teal, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildToggleOption(
    String title, {
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        border: Border.all(color: AppColors.teal, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.teal,
          ),
        ],
      ),
    );
  }
}

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => ReminderScreenState();
}

// =====================================================
// ROOMMATE MATCHING SCREEN
// =====================================================
class RoommateMatchingScreen extends StatelessWidget {
  const RoommateMatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.teal),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          },
        ),
        title: const Text(
          "RentMate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Roommate Matching",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileCard(
                  name: "Kevin Tharinda",
                  details: [
                    "22 years old",
                    "an extrovert",
                    "loves to play guitar",
                  ],
                  icon: Icons.person,
                ),
                _buildProfileCard(
                  name: "Ishen Perera",
                  details: ["27 years old", "an introvert", "have two dogs"],
                  icon: Icons.account_circle,
                ),
                _buildProfileCard(
                  name: "Manushi Jayasundara",
                  details: [
                    "21 years old",
                    "an introvert",
                    "loves reading books",
                    "allergic to cats",
                  ],
                  icon: Icons.face_retouching_natural,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard({
    required String name,
    required List<String> details,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF26A69A), width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 60, color: Colors.grey[700]),
              ),
              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    ...details.map(
                      (detail) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 8,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              detail,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton("Accept"),
              _buildActionButton("Reject"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF26A69A), // Teal button color
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =====================================================
// CONTRACT PREVIEW SCREEN
// =====================================================
class ContractPreviewScreen extends StatelessWidget {
  const ContractPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "RentMate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Contract Preview",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            _buildContractBox(
              child: Row(
                children: [
                  const Icon(Icons.assignment, color: Colors.white, size: 50),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Residential Lease Agreement",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "Generated on Feb 21, 2026",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B263B),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Pending Your Signature",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            _buildContractBox(
              title: "Property Details",
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/img1.png',
                      width: 100,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100,
                        height: 70,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rental Apartment in Kelaniya",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Suburb of Colombo",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        Text(
                          "Western Province, Sri Lanka",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            _buildContractBox(
              title: "Property Involved",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPersonInfo(
                    "Landlord",
                    "Udana Wickramasuriya",
                    Icons.face_retouching_natural,
                  ),
                  const SizedBox(
                    height: 60,
                    child: VerticalDivider(color: Colors.white24, thickness: 1),
                  ),
                  _buildPersonInfo("Tenant", "Ashen Kumarage", Icons.person),
                ],
              ),
            ),

            _buildContractBox(
              title: "Financial Terms",
              child: Column(
                children: [
                  _buildFinancialRow("Monthly Rent Amount", "LKR 60,000.00"),
                  _buildFinancialRow("Due Date", "1st of every month"),
                  _buildFinancialRow("Security Deposit", "LKR 3,500.00"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContractBox({String? title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 12),
          ],
          child,
        ],
      ),
    );
  }

  Widget _buildPersonInfo(String role, String name, IconData icon) {
    return Column(
      children: [
        Text(role, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 8),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white24,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// OWNER VERIFICATION SCREEN
// =====================================================
class OwnerVerificationScreen extends StatefulWidget {
  const OwnerVerificationScreen({super.key});

  @override
  State<OwnerVerificationScreen> createState() =>
      _OwnerVerificationScreenState();
}

class _OwnerVerificationScreenState extends State<OwnerVerificationScreen> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  // 1. Updated: List to store up to 2 verification images
  final List<PlatformFile> _verificationImages = [];

  // 2. Updated: Logic to pick up to 2 images
  Future<void> _pickImage() async {
    if (_verificationImages.length >= 2) {
      _showLimitSnackBar();
      return;
    }

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
        withData: true, // Required to show the image on the screen
      );

      if (result != null) {
        final remainingSlots = 2 - _verificationImages.length;
        setState(() {
          // Only add what fits in the 2-slot limit
          _verificationImages.addAll(result.files.take(remainingSlots));
        });

        if (result.files.length > remainingSlots) {
          _showLimitSnackBar();
        }
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _verificationImages.removeAt(index);
    });
  }

  void _showLimitSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Maximum 2 verification images allowed (Front & Back)"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "RentMate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            const Text(
              "Owner Verification",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            _buildVerificationField("Enter Full Name", Icons.person_outline),

            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 8),
                child: Text(
                  "Enter Date Of Birth",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    "Day",
                    List.generate(
                      31,
                      (i) => (i + 1).toString().padLeft(2, '0'),
                    ),
                    selectedDay,
                    (val) => setState(() => selectedDay = val),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDropdown(
                    "Month",
                    [
                      'Jan',
                      'Feb',
                      'Mar',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec',
                    ],
                    selectedMonth,
                    (val) => setState(() => selectedMonth = val),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDropdown(
                    "Year",
                    List.generate(60, (i) => (1965 + i).toString()),
                    selectedYear,
                    (val) => setState(() => selectedYear = val),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            _buildVerificationField(
              "Enter Email Address",
              Icons.email_outlined,
            ),
            _buildVerificationField(
              "Enter Telephone Number",
              Icons.phone_outlined,
            ),
            _buildVerificationField(
              "Enter Home Address",
              Icons.location_on_outlined,
            ),

            // 3. UPDATED: Multi-Image Upload Box
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  border: Border.all(color: const Color(0xFF26A69A), width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Icon(
                      _verificationImages.length < 2
                          ? Icons.upload_outlined
                          : Icons.check_circle,
                      color: _verificationImages.length < 2
                          ? Colors.white70
                          : Colors.teal,
                      size: 35,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _verificationImages.isEmpty
                          ? "Upload NIC or Passport (Front & Back)"
                          : "${_verificationImages.length} of 2 images attached",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 4. NEW: Visible Preview Gallery for Verification Docs
            if (_verificationImages.isNotEmpty)
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _verificationImages.length,
                  itemBuilder: (context, index) {
                    final file = _verificationImages[index];
                    return Stack(
                      children: [
                        Container(
                          width: 140,
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.teal.withOpacity(0.5),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: file.bytes != null
                              ? Image.memory(file.bytes!, fit: BoxFit.cover)
                              : const Icon(
                                  Icons.description,
                                  color: Colors.white24,
                                ),
                        ),
                        // THE CROSS BUTTON
                        Positioned(
                          top: 0,
                          right: 5,
                          child: GestureDetector(
                            onTap: () => _removeImage(index),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

            const SizedBox(height: 10),
            const Text(
              "Upload a proper image of your NIC or Passport to verify the account",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),

            const SizedBox(height: 30),

            // Verify Button
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_verificationImages.length < 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please upload both Front and Back images",
                        ),
                      ),
                    );
                  } else {
                    print(
                      "Submitting for verification with ${_verificationImages.length} images",
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF26A69A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable Field Builders (Same as your original code)
  Widget _buildVerificationField(String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.teal),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Color(0xFF26A69A), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.teal, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String hint,
    List<String> items,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF26A69A), width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          value: value,
          dropdownColor: const Color(0xFF0D1B2A),
          style: const TextStyle(color: Colors.white),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
          isExpanded: true,
          onChanged: onChanged,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
        ),
      ),
    );
  }
}

// =====================================================
// ADD PROPERTY SCREEN
// =====================================================
class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? _selectedRoomType;
  final List<String> _roomTypes = ["Single Room", "Shared Room"];
  final List<String> _facilitiesList = [
    "Wi-Fi",
    "Meals",
    "AC",
    "Attached Bathroom",
  ];
  final Set<String> _selectedFacilities = {};

  final List<PlatformFile> _selectedFiles = [];

  Future<void> _pickImages() async {
    if (_selectedFiles.length >= 10) {
      _showLimitSnackBar();
      return;
    }

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
        withData: true, // Crucial for showing previews on Web/PC
      );

      if (result != null) {
        final remainingSlots = 10 - _selectedFiles.length;
        setState(() {
          _selectedFiles.addAll(result.files.take(remainingSlots));
        });

        if (result.files.length > remainingSlots) {
          _showLimitSnackBar();
        }
      }
    } catch (e) {
      debugPrint("Error picking files: $e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  void _showLimitSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Maximum 10 images allowed"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration inputDecoration = BoxDecoration(
      color: const Color.fromARGB(0, 10, 227, 227),
      border: Border.all(color: Colors.teal, width: 2),
      borderRadius: BorderRadius.circular(20),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 38, 63),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "RentMate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Property Title"),
            _buildTextField(_titleController, "Enter Title", inputDecoration),

            _buildLabel("Location"),
            _buildTextField(
              _locationController,
              "Enter Location",
              inputDecoration,
            ),

            _buildLabel("Price per Month"),
            _buildPriceField(inputDecoration),

            _buildLabel("Upload Images (Max 10)"),

            // 3. Updated: Interactive Upload Box
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: inputDecoration,
                child: Column(
                  children: [
                    const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _selectedFiles.isEmpty
                          ? "Select Property Images"
                          : "${_selectedFiles.length} of 10 selected",
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            // 4. NEW: Visible Image Preview Gallery
            if (_selectedFiles.isNotEmpty)
              Container(
                height: 120,
                margin: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedFiles.length,
                  itemBuilder: (context, index) {
                    final file = _selectedFiles[index];
                    return Stack(
                      children: [
                        Container(
                          width: 100,
                          margin: const EdgeInsets.only(right: 12, top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.teal.withOpacity(0.5),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: file.bytes != null
                              ? Image.memory(file.bytes!, fit: BoxFit.cover)
                              : const Center(
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.white24,
                                  ),
                                ),
                        ),
                        // 5. THE CROSS BUTTON
                        Positioned(
                          top: 0,
                          right: 5,
                          child: GestureDetector(
                            onTap: () => _removeImage(index),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    "Cancel",
                    Colors.teal,
                    () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildActionButton("Submit", Colors.teal, () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    BoxDecoration deco,
  ) => Container(
    decoration: deco,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    ),
  );

  Widget _buildPriceField(BoxDecoration deco) => Container(
    decoration: deco,
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("LKR", style: TextStyle(color: Colors.white)),
        ),
        Expanded(
          child: TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "0.00",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildActionButton(
    String label,
    Color color,
    VoidCallback onPressed,
  ) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    child: Text(
      label,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

// =====================================================
// PUBLIC TRANSPORT LOCATION SCREEN
// =====================================================
class PublicTransportationScreen extends StatefulWidget {
  const PublicTransportationScreen({super.key});

  @override
  State<PublicTransportationScreen> createState() =>
      _PublicTransportationScreenState();
}

class _PublicTransportationScreenState
    extends State<PublicTransportationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _searchController = TextEditingController();

  // Default center (e.g., Colombo area)
  static const LatLng _initialCenter = LatLng(6.9271, 79.8612);

  static const CameraPosition _initialPosition = CameraPosition(
    target: _initialCenter,
    zoom: 14.0,
  );

  // Markers for transit locations
  final Map<MarkerId, Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMarkers(_initialCenter);
  }

  // Logic to place markers near a specific location
  void _initializeMarkers(LatLng center) {
    setState(() {
      _markers[const MarkerId('bus_stop')] = Marker(
        markerId: const MarkerId('bus_stop'),
        position: LatLng(center.latitude + 0.0015, center.longitude + 0.0018),
        infoWindow: const InfoWindow(title: 'Nearest Bus Stand'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );

      _markers[const MarkerId('train_station')] = Marker(
        markerId: const MarkerId('train_station'),
        position: LatLng(center.latitude + 0.0045, center.longitude - 0.0022),
        infoWindow: const InfoWindow(title: 'Nearest Train Station'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      );
    });
  }

  // Logic to move the map when searching
  Future<void> _searchLocation(String locationName) async {
    if (locationName.isEmpty) return;

    // Simulate finding a new location (In production, use Geocoding API)
    final LatLng newLocation = LatLng(6.9150, 79.8700);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: newLocation, zoom: 15.0),
      ),
    );

    // Update markers to be "near" the new search result
    _initializeMarkers(newLocation);
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration tealOutline = BoxDecoration(
      color: Colors.white.withOpacity(0.03),
      border: Border.all(color: AppColors.teal, width: 2),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF00C853),
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "RentMate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Distance to Public Transport",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            // SEARCH BAR
            _buildFieldLabel("Enter Town Name or Location"),
            Container(
              decoration: tealOutline,
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textInputAction: TextInputAction.search,
                onSubmitted: _searchLocation,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "e.g., Borella, Battaramulla",
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: AppColors.teal),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white54),
                    onPressed: () => _searchController.clear(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // BUS TILE
            _buildTransportTile(
              deco: tealOutline,
              icon: Icons.directions_bus_filled,
              title: "Nearest Bus Stop",
              walkTime: "2 min walk",
              distance: "150 meters away",
              destination: "Main Bus Stand",
              markerId: 'bus_stop',
            ),

            const SizedBox(height: 20),

            // TRAIN TILE
            _buildTransportTile(
              deco: tealOutline,
              icon: Icons.train,
              title: "Nearest Train Station",
              walkTime: "8 min walk",
              distance: "700 meters away",
              destination: "Central Train Station",
              markerId: 'train_station',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 8),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildTransportTile({
    required BoxDecoration deco,
    required IconData icon,
    required String title,
    required String walkTime,
    required String distance,
    required String destination,
    required String markerId,
  }) {
    // Get the marker position for this specific tile
    final LatLng mapPosition =
        _markers[MarkerId(markerId)]?.position ?? _initialCenter;

    return Container(
      decoration: deco,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey, size: 28),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            walkTime,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(distance, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),

          // Address/Destination Label
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white70, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "To $destination",
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // ACTUAL LIVE GOOGLE MAP
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: mapPosition,
                  zoom: 15.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  if (!_controller.isCompleted) {
                    _controller.complete(controller);
                  }
                },
                markers: {
                  if (_markers.containsKey(MarkerId(markerId)))
                    _markers[MarkerId(markerId)]!,
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// ROOMMATE SURVEY SCREEN
// =====================================================
class RoommateSurveyScreen extends StatefulWidget {
  const RoommateSurveyScreen({super.key});

  @override
  State<RoommateSurveyScreen> createState() => _RoommateSurveyScreenState();
}

class _RoommateSurveyScreenState extends State<RoommateSurveyScreen> {
  final Map<String, String> _roommatePrefs = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Roommate Matching",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tell us about your lifestyle to find your perfect match.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 25),

            // 1. Social Personality
            _buildSurveyDropdown("Social Energy", [
              "Introvert (Keep to myself)",
              "Extrovert (Love socializing)",
              "Ambivert (Balanced)",
            ]),

            // 2. Dietary Habits
            _buildSurveyDropdown("Dietary Preference", [
              "Vegetarian",
              "Non-Vegetarian",
              "Vegan",
            ]),

            // 3. Smoking Habits
            _buildSurveyDropdown("Smoking Habit", [
              "Non-Smoker",
              "Occasional Smoker",
              "Regular Smoker",
            ]),

            // 4. Sleep Cycle (Crucial for roommates)
            _buildSurveyDropdown("Sleep Schedule", [
              "Early Bird (Morning person)",
              "Night Owl (Late sleeper)",
              "Flexible",
            ]),

            // 5. Cleanliness Standard
            _buildSurveyDropdown("Cleanliness Level", [
              "Neat Freak (Everything must be tidy)",
              "Casual (Clean but relaxed)",
              "Messy but organized",
            ]),

            // 6. Guests/Visitors
            _buildSurveyDropdown("Guest Policy Preference", [
              "No Guests Allowed",
              "Occasional Daytime Guests",
              "Frequent Guests/Sleepovers",
            ]),

            // 7. Academic/Study Focus
            _buildSurveyDropdown("Primary Activity", [
              "Heavy Studying (Need silence)",
              "WFH / Online Classes",
              "Active Lifestyle (Hardly at home)",
            ]),

            const SizedBox(height: 30),

            PrimaryButton(
              text: "Find Matches",
              icon: Icons.people_outline,
              onPressed: () {
                // Logic to process roommate matching
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RoommateMatchingScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSurveyDropdown(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.teal,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            dropdownColor: const Color(
              0xFF1D2D3D,
            ), // Slightly lighter for the dropdown menu
            iconEnabledColor: AppColors.teal,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.05),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.teal, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: options.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _roommatePrefs[label] = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
