import 'package:admin_fitcc/models/kriterij.dart';
import 'package:flutter/material.dart';
import 'package:admin_fitcc/models/kategorija.dart';
import 'package:admin_fitcc/providers/kategorija_provider.dart';

class KriterijAdd extends StatefulWidget {
    final Kriterij? kriterij;
  KriterijAdd({this.kriterij});

  @override
  _KriterijAddState createState() => _KriterijAddState();
}

class _KriterijAddState extends State<KriterijAdd> {
  TextEditingController nazivController = TextEditingController();
  TextEditingController vrijednostController = TextEditingController();
  String selectedKategorija = '1';

  List<Kategorija> kategorijeList = [];

  @override
  void initState() {
    super.initState();
    _fetchKategorijeList();
     if (widget.kriterij != null) {
      // _getpreselectedAgenda(widget.dogadjaj!.agendaId);
      selectedKategorija = widget.kriterij!.kategorijaId.toString();
      nazivController.text = widget.kriterij!.naziv;
      vrijednostController.text = widget.kriterij!.vrijednost;
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
              controller: nazivController,
              decoration: InputDecoration(labelText: 'Ime'),
            ),
            TextField(
              controller: vrijednostController,
              decoration: InputDecoration(labelText: 'Prezime'),
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
                  value: kategorija.kategorijaId.toString(),
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
