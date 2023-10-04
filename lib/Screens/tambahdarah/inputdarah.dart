import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piriing/Screens/dashboard/dashboar.dart';

void main() {
  runApp(MaterialApp(
    home: InputDarah(),
  ));
}

class InputDarah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 250, 154, 0),
                  Color.fromARGB(255, 246, 80, 20),
                  Color.fromARGB(255, 235, 38, 16),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.orange,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Text(
                            'TAMBAH DARAH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/calendar.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Tambah Darah Hari Ini',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // Tambahkan komponen UI lainnya di sini
                          SizedBox(
                            height:
                                20, // Tambahkan jarak antara teks dan Container
                          ),
                          Container(
                            width: 400, // Lebar container
                            padding:
                                EdgeInsets.all(16.0), // Padding pada Container
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Warna latar belakang Container
                              borderRadius: BorderRadius.circular(
                                  10.0), // Radius sudut sebesar 10
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Warna shadow abu-abu
                                  spreadRadius:
                                      5, // Seberapa jauh shadow menyebar
                                  blurRadius: 7, // Tingkat keburaman shadow
                                  offset: Offset(0, 3), // Posisi shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tanggal: $currentDate',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Nn. Christina',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Text(
                                  'Apakah anda sudah minum tablet tambah darah?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 70),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Aksi saat tombol "Sudah" ditekan
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                      child: Text('Sudah'),
                                    ),
                                    SizedBox(width: 30),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Aksi saat tombol "Belum" ditekan
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                      child: Text('Belum'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
