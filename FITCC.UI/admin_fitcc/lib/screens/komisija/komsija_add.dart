import 'package:admin_fitcc/models/komisija.dart';
import 'package:flutter/material.dart';
import 'package:admin_fitcc/models/uloge_komisije.dart';
import 'package:admin_fitcc/models/kategorija.dart';
import 'package:admin_fitcc/providers/uloge_komisije_provider.dart';
import 'package:admin_fitcc/providers/kategorija_provider.dart';

class KomisijaAdd extends StatefulWidget {
  final Komisija? komisija;
  KomisijaAdd({this.komisija});
  @override
  _KomisijaAddState createState() => _KomisijaAddState();
}

class _KomisijaAddState extends State<KomisijaAdd> {
  TextEditingController imeController = TextEditingController();
  TextEditingController prezimeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String selectedUlogeKomisije = '';
  String selectedKategorija = '';

  List<UlogeKomisije> ulogeKomisijeList = [];
  List<Kategorija> kategorijeList = [];

  @override
  void initState() {
    super.initState();
    _fetchUlogeKomisijeList();
    _fetchKategorijeList();
  }

  Future<void> _fetchUlogeKomisijeList() async {
    try {
      List<UlogeKomisije> fetchedUlogeKomisijeList =
          await UlogeKomisijeProvider().fetchUlogeKomisijeList();
      setState(() {
        ulogeKomisijeList = fetchedUlogeKomisijeList;
      });
    } catch (e) {
      // Handle the error
      print('Error fetching UlogeKomisije data: $e');
    }
  }

  Future<void> _fetchKategorijeList() async {
    try {
      List<Kategorija> fetchedKategorijeList =
          await KategorijaProvider().getKategorije();
      setState(() {
        kategorijeList = fetchedKategorijeList;
      });
    } catch (e) {
      // Handle the error
      print('Error fetching Kategorije data: $e');
    }
  }

  Future<void> _insertKomisija() async {
    try {
      // Implement the logic to insert the Komisija with the entered data
      // You can access the entered values using imeController.text, prezimeController.text, etc.
      // Make an API call to insert the Komisija
      // For example:
      // await KomisijaProvider().insertKomisija(Komisija(
      //   ime: imeController.text,
      //   prezime: prezimeController.text,
      //   email: emailController.text,
      //   ulogeKomisije: selectedUlogeKomisije,
      //   kategorija: selectedKategorija,
      // ));
      // You may need to adjust this code based on your API and data model
    } catch (e) {
      // Handle the error
      print('Error inserting Komisija data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Komisija'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: imeController,
              decoration: InputDecoration(labelText: 'Ime'),
            ),
            TextField(
              controller: prezimeController,
              decoration: InputDecoration(labelText: 'Prezime'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            DropdownButtonFormField<String>(
              value: selectedUlogeKomisije,
              onChanged: (value) {
                setState(() {
                  selectedUlogeKomisije = value!;
                });
              },
              items: ulogeKomisijeList.map((uloga) {
                return DropdownMenuItem<String>(
                  value: uloga.naziv,
                  child: Text(uloga.naziv),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Uloge Komisije'),
            ),
            DropdownButtonFormField<String>(
              value: selectedKategorija,
              onChanged: (value) {
                setState(() {
                  selectedKategorija = value!;
                });
              },
              items: kategorijeList.map((kategorija) {
                return DropdownMenuItem<String>(
                  value: kategorija.naziv,
                  child: Text(kategorija.naziv.toString()),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Kategorija'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _insertKomisija();
              },
              child: Text('Dodaj Komisiju'),
            ),
          ],
        ),
      ),
    );
  }
}
