import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:piriing/model/user.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String Id = '';

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');

    if (userDataString != null) {
      final userData = UserData.fromJson(json.decode(userDataString));
      print(userData.nama);

      setState(() {
        Id = userData.idUser.toString();
      });
    }
  }

  TextEditingController idUserController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController tinggiBadanController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController umurController = TextEditingController();

  String clientId = "PKL2023";
  String clientSecret = "PKLSERU";
  String tokenUrl = "https://isipiringku.esolusindo.com/api/Token/token";
  String accessToken = "";

  Future<void> getToken() async {
    try {
      var response = await http.post(
        Uri.parse(tokenUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'client_credentials',
          'client_id': clientId,
          'client_secret': clientSecret,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> tokenData = jsonDecode(response.body);
        accessToken = tokenData['access_token'];
        print('Token Akses: $accessToken');
      } else {
        print('Gagal mendapatkan token: ${response.statusCode}');
      }
    } catch (e) {
      print('Gagal mendapatkan token: $e');
    }
  }

  void registerUser() async {
    final apiUrl =
        'https://isipiringku.esolusindo.com/api/UpdateProfil/UpdateProfil';

    final Map<String, dynamic> data = {
      'id_user': Id,
      'username': usernameController.text,
      'jabatan': jabatanController.text,
      'nama': namaController.text,
      'tgl_lahir': tanggalLahirController.text,
      'tinggi_badan': tinggiBadanController.text,
      'alamat': alamatController.text,
      'kecamatan': kecamatanController.text,
      'kabupaten': kabupatenController.text,
      'provinsi': provinsiController.text,
      'jekel': jenisKelaminController.text,
      'no_telp': noTelpController.text,
      'email': emailController.text,
      'umur': umurController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken', // Menggunakan token OAuth2
        },
      );

      if (response.statusCode == 200) {
        // Registrasi berhasil, lakukan sesuatu di sini
        print('Registrasi berhasil');
        print(response.body);
      } else {
        // Registrasi gagal, tampilkan pesan kesalahan atau lakukan sesuatu yang sesuai
        print('Registrasi gagal. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Terjadi kesalahan dalam proses registrasi
      print('Terjadi kesalahan: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    getToken();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: jabatanController,
                decoration: InputDecoration(labelText: 'Jabatan'),
              ),
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: tanggalLahirController,
                decoration: InputDecoration(labelText: 'Tanggal Lahir'),
              ),
              TextField(
                controller: tinggiBadanController,
                decoration: InputDecoration(labelText: 'Tinggi Badan'),
              ),
              TextField(
                controller: alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              TextField(
                controller: kecamatanController,
                decoration: InputDecoration(labelText: 'Kecamatan'),
              ),
              TextField(
                controller: kabupatenController,
                decoration: InputDecoration(labelText: 'Kabupaten'),
              ),
              TextField(
                controller: provinsiController,
                decoration: InputDecoration(labelText: 'Provinsi'),
              ),
              TextField(
                controller: jenisKelaminController,
                decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              TextField(
                controller: noTelpController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: umurController,
                decoration: InputDecoration(labelText: 'Umur'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  registerUser();
                  print(Id);
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
