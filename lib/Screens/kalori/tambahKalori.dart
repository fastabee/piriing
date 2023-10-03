import 'package:flutter/material.dart';
import 'package:piriing/Screens/kalori/grafikKalori.dart';

class TambahKalori extends StatefulWidget {
  const TambahKalori({super.key});

  @override
  State<TambahKalori> createState() => _TambahKaloriState();
}

class _TambahKaloriState extends State<TambahKalori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: const BoxDecoration(
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
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.orange,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'TAMBAH KALORI',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '23-09-2023',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Makan Apa Hari Ini?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                                Icons.search), // Menambahkan ikon kaca pembesar
                            hintText:
                                "Cari makanan", // Menambahkan hint "Cari makanan"
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GrafikKalori(),
                                  ));
                            },
                            child: Text('Gass')),
                      )
                    ],
                  ),
                ],
              ),
            )),
          ),
        ]),
      ),
    );
  }
}
