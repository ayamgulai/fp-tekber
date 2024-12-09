import 'package:flutter/material.dart';
import 'formEditProfile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data default untuk nama dan email
  String _name = "Lorem Ipsum";
  String _email = "kuliahdsi@gmail.com";

  // Method untuk navigasi ke halaman edit profile
  Future<void> _editProfile(BuildContext context) async {
    final updatedProfile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormEditProfilePage(
          name: _name,
          email: _email,
        ),
      ),
    );

    // Cek apakah ada data baru setelah edit
    if (updatedProfile != null && updatedProfile is Map<String, String>) {
      setState(() {
        _name = updatedProfile['name']!;
        _email = updatedProfile['email']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 250, 253, 100),
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          const Expanded(flex: 1, child: _TopPortion()),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    _name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    _email,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => _editProfile(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(200, 230, 255, 100),
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.person_2_rounded,
                          size: 24,
                          color: Colors.black,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Logout functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(
                        color: Colors.red,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text("Keluar Akun"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://assets-a1.kompasiana.com/items/album/2017/05/17/monkey-591c28d0129773a859f96ce3.jpg?t=o&v=410'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
