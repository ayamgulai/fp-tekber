import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 250, 253, 100),
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
                  Text("Lorem Ipsum",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
                  Text("kuliahdsi@gmail.com",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(200, 230, 255, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.person_2_rounded,
                            size: 24, color: Colors.black),
                        Text("Edit Profile",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'logout',
                        elevation: 0,
                        backgroundColor: Colors.white,
                        label: const Text("Log Out",
                            style: TextStyle(color: Colors.red)),
                        icon:
                            const Icon(Icons.login_outlined, color: Colors.red),
                      ),
                    ],
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

extension on TextTheme {
  get headline6 => null;
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
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
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://assets-a1.kompasiana.com/items/album/2017/05/17/monkey-591c28d0129773a859f96ce3.jpg?t=o&v=410')),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
