import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final List<Map<String, String>> member = [
    {
      'name': 'Jason Ho',
      'nrp': '5026221005',
      'department': 'Department of Information Systems',
    },
    {
      'name': 'Samuel B.A. Hutagalung',
      'nrp': '5026221067',
      'department': 'Department of Information Systems',
    },
    {
      'name': 'Yeremia Maydinata Narana',
      'nrp': '5026221068',
      'department': 'Department of Information Systems',
    },
    {
      'name': 'Marcello Ezra Andilolo Lubis',
      'nrp': '5026221097',
      'department': 'Department of Information Systems',
    },
    {
      'name': 'Naifa Mumtazah Rendiga',
      'nrp': '5026221114',
      'department': 'Department of Information Systems',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromRGBO(71, 129, 255, 50),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'myBookmark ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '(manage your Bookmark)',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'This app would help you to be your personal bookmark and track your progress wherever you are',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'team members:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: member.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromRGBO(216, 228, 255, 0.808),
                  child: ListTile(
                    leading: Text((index + 1).toString()), // Index as a number
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: member[index]['name']! + ' ', // Name in bold
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: member[index]['nrp']!, // NRP in normal weight
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      member[index]['department']!,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
