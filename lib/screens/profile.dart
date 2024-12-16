import 'package:flutter/material.dart';
import '../data/user_repository.dart'; // Import UserRepository
import 'formEditProfile.dart';
import 'loginPage.dart'; // Import LoginPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _repository = UserRepository(
      baseUrl:
          'https://example.com/api'); // URL backend (ubah sesuai kebutuhan)

  // Data default untuk nama dan email
  String _name = "Lorem Ipsum";
  String _email = "kuliahdsi@gmail.com";
  bool _isLoading = true; // Untuk menampilkan indikator loading

  @override
  void initState() {
    super.initState();
    _loadProfile(); // Memuat data profil dari backend
  }

  Future<void> _loadProfile() async {
    try {
      final profile =
          await _repository.fetchProfile(); // Ambil data profil dari backend
      setState(() {
        _name = profile['name']!;
        _email = profile['email']!;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memuat data profil.')),
      );
    }
  }

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

      // Simpan data yang diperbarui ke backend
      try {
        await _repository.updateProfile(
            updatedProfile['name']!, updatedProfile['email']!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil berhasil diperbarui.')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal memperbarui profil.')),
        );
      }
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Indikator loading
          : Column(
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
                            backgroundColor:
                                const Color.fromRGBO(200, 230, 255, 100),
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
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (route) => false,
                            );
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
