import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'detail_page.dart'; // Import halaman detail

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String profileName = 'Daffa Danindra';
  String profileText = '1152200028';
  String profileImagePath = 'assets/images/fotosaya.jpg';

  // List of campuses
  final List<Map<String, String>> _campuses = [
    {
      'title': 'Institut Teknologi Indonesia',
      'description': 'Institut Teknologi Indonesia (ITI) merupakan perguruan tinggi swasta yang berlokasi di Kecamatan Setu, Kota Tangerang Selatan. Awal berdirinya perguruan tinggi ini dibentuk oleh Persatuan Insinyur Indonesia (PII) melalui Yayasan Pengembangan Teknologi Indonesia (YPTI) untuk memenuhi kebutuhan tenaga insinyur teknik di Indonesia pada 1 Oktober 1984. Yayasan Pengembangan Teknologi Indonesia (YPTI) ini dipimpin oleh Prof. Dr. Ing. B.J. Habibie yang juga menjabat sebagai Ketua Pembina YPTI hingga pada tahun 2019.',
      'imagePath': 'assets/images/ITI.jpg',
    },
    {
      'title': 'Universitas Pamulang',
      'description': 'Universitas Pamulang disingkat UNPAM adalah salah satu perguruan tinggi swasta terbesar di Banten. Universitas Pamulang merupakan perguruan tinggi yang dikelola oleh Yayasan Sasmita Jaya yang didirikan oleh Dr. (H.C) H. Darsono.',
      'imagePath': 'assets/images/UNPAM.jpg',
    },
    {
      'title': 'Harvard University',
      'description': 'Universitas Harvard adalah universitas swasta di Cambridge, Massachusetts, Amerika Serikat dan anggota Ivy League. Universitas ini merupakan salah satu universitas terbaik dunia.',
      'imagePath': 'assets/images/HARVARD.jpg',
    },
    {
      'title': 'National University Of Singapore',
      'description': 'Universitas Nasional Singapura terletak di Kent Ridge, barat daya Singapura. Universitas ini memiliki kampus seluas 1,5 km² dan merupakan universitas terbesar di Singapura berdasarkan jumlah mahasiswa dan program yang ditawarkan. Didirikan pada tahun 1905 sebagai Sekolah Kedokteran Pemerintah Negara Federasi Melayu dan Pemukiman Selat, NUS adalah institusi pendidikan tinggi tertua di Singapura. Menurut sebagian besar peringkat, ini dianggap sebagai salah satu universitas terbaik di Asia-Pasifik dan di dunia. NUS adalah universitas riset yang komprehensif, menawarkan program gelar dalam berbagai disiplin ilmu baik di tingkat sarjana maupun pascasarjana, termasuk dalam sains, kedokteran dan kedokteran gigi, desain dan lingkungan, hukum, seni dan ilmu sosial, teknik, bisnis, komputasi, dan musik.',
      'imagePath': 'assets/images/NUS.jpg',
    },
  ];

  // Search-related variables
  late List<Map<String, String>> _filteredCampuses;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredCampuses = _campuses;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCampuses(String query) {
    final filtered = _campuses.where((campus) {
      final titleLower = campus['title']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredCampuses = filtered;
    });
  }

  List<Widget> _buildExploreOptions(BuildContext context) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Explore',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Cari Kampus...',
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onChanged: (query) => _filterCampuses(query),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: _filteredCampuses.map((campus) {
                return Column(
                  children: [
                    _buildExploreButton(
                      context,
                      campus['title']!,
                      campus['description']!,
                      campus['imagePath']!,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
      _buildProfilePage(),
      _buildSettingsPage(),
    ];
  }

  Widget _buildExploreButton(BuildContext context, String title, String description, String imagePath) {
    return SizedBox(
      width: double.infinity, // Fullscreen button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                title: title,
                description: description,
                imagePath: imagePath,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250, // Increase image height
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePage() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Changed from .center to .start
          children: [
            const SizedBox(height: 20), // Adjust this value to control the top margin
            const Text(
              'Profile',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              profileImagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              profileName,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              profileText,
              style: const TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity, // Fullscreen button
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Change the button color here
                    foregroundColor: Colors.white, // Change the text color here
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          onSave: (name, text) {
                            setState(() {
                              profileName = name;
                              profileText = text;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity, // Fullscreen button
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Change the button color here
                    foregroundColor: Colors.white, // Change the text color here
                  ),
                  onPressed: () {
                    _showExitDialog();
                  },
                  child: const Text(
                    'Keluar Dari Aplikasi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah anda ingin keluar aplikasi?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batalkan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Exit the app
                Navigator.of(context).pop(true);
              },
              child: const Text("Keluar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = _buildExploreOptions(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1; // Navigate to profile page
                });
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profileImagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: widgetOptions[_selectedIndex],
      ),
      drawer: CustomDrawer(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

// ignore: must_be_immutable
class EditProfilePage extends StatefulWidget {
  final Function(String, String) onSave;

  EditProfilePage({super.key, required this.onSave});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  String selectedImagePath = 'assets/images/fotosaya.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Ubah Nama' ),
            ),
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Ubah NIM'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity, // Fullscreen button
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Change the button color here
                  foregroundColor: Colors.white, // Change the text color here
                ),
                onPressed: () {
                  widget.onSave(
                    nameController.text,
                    textController.text,
                  );
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
