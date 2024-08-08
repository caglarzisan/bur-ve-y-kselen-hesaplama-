import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State for the first dropdown (day)
  String _selectedValue1 = '01';

  // State for the second dropdown (month)
  String _selectedValue2 = 'Ocak';

  // Mapping month names to their respective numbers
  final Map<String, int> monthMap = {
    'Ocak': 1,
    'Şubat': 2,
    'Mart': 3,
    'Nisan': 4,
    'Mayıs': 5,
    'Haziran': 6,
    'Temmuz': 7,
    'Ağustos': 8,
    'Eylül': 9,
    'Ekim': 10,
    'Kasım': 11,
    'Aralık': 12,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burç Hesapla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // First DropdownButton (day)
            DropdownButton<String>(
              value: _selectedValue1,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue1 = newValue!;
                });
              },
              items: List<String>.generate(
                      31, (index) => (index + 1).toString().padLeft(2, '0'))
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20), // Add some space between the dropdowns
            // Second DropdownButton (month)
            DropdownButton<String>(
              value: _selectedValue2,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue2 = newValue!;
                });
              },
              items:
                  monthMap.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _calculateZodiac(context),
              child: Text('Burcumu Hesapla'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Yükselen Hesaplama Sayfasına Git'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateZodiac(BuildContext context) {
    final int day = int.parse(_selectedValue1);
    final int month = monthMap[_selectedValue2]!;
    String zodiacSign = '';
    String zodiacInfo = '';

    // Simple zodiac calculation algorithm
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      zodiacSign = 'Koç';
      zodiacInfo = 'Koç burcu cesur ve kararlıdır.';
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      zodiacSign = 'Boğa';
      zodiacInfo = 'Boğa burcu sabırlı ve güvenilirdir.';
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      zodiacSign = 'İkizler';
      zodiacInfo = 'İkizler burcu meraklı ve sosyal biridir.';
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      zodiacSign = 'Yengeç';
      zodiacInfo = 'Yengeç burcu duygusal ve koruyucudur.';
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      zodiacSign = 'Aslan';
      zodiacInfo = 'Aslan burcu cesur ve liderdir.';
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      zodiacSign = 'Başak';
      zodiacInfo = 'Başak burcu detaycı ve pratik biridir.';
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      zodiacSign = 'Terazi';
      zodiacInfo = 'Terazi burcu adil ve dengelidir.';
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      zodiacSign = 'Akrep';
      zodiacInfo = 'Akrep burcu tutkulu ve gizemlidir.';
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      zodiacSign = 'Yay';
      zodiacInfo = 'Yay burcu maceracı ve iyimserdir.';
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      zodiacSign = 'Oğlak';
      zodiacInfo = 'Oğlak burcu disiplinli ve hedef odaklıdır.';
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      zodiacSign = 'Kova';
      zodiacInfo = 'Kova burcu yenilikçi ve bağımsızdır.';
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      zodiacSign = 'Balık';
      zodiacInfo = 'Balık burcu empatik ve hayalperesttir.';
    } else {
      zodiacSign = 'Bilinmeyen';
      zodiacInfo = 'Lütfen geçerli bir tarih giriniz.';
    }

    showAlert(context, "Burç Sonucu", "Burcunuz: $zodiacSign\n$zodiacInfo");
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // State for the first dropdown (day)
  String _selectedValue1 = '05-07';

  // State for the second dropdown (month)
  String _selectedValue2 = 'Koç';

  // Mapping month names to their respective numbers
  final Map<String, int> zodiacMap = {
    'Koç': 1,
    'Boğa': 2,
    'İkizler': 3,
    'Yengeç': 4,
    'Aslan': 5,
    'Başak': 6,
    'Terazi': 7,
    'Akrep': 8,
    'Yay': 9,
    'Oğlak': 10,
    'Kova': 11,
    'Balık': 12,
  };

  final Map<String, int> hourMap = {
    '05-07': 1,
    '07-09': 2,
    '09-11': 3,
    '11-13': 4,
    '13-15': 5,
    '15-17': 6,
    '17-19': 7,
    '19-21': 8,
    '21-23': 9,
    '23-01': 10,
    '01-03': 11,
    '03-05': 12,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yükselen Hesapla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // First DropdownButton (day)
            DropdownButton<String>(
              value: _selectedValue1,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue1 = newValue!;
                });
              },
              items: hourMap.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20), // Add some space between the dropdowns
            // Second DropdownButton (month)
            DropdownButton<String>(
              value: _selectedValue2,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue2 = newValue!;
                });
              },
              items:
                  zodiacMap.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _calculateRisingsign(context),
              child: Text('yükselenimi Hesapla'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateRisingsign(BuildContext context) {
    final int day = hourMap[_selectedValue1]!;
    final int month = zodiacMap[_selectedValue2]!;
    String risingSign = '';
    String risingInfo = '';

    // Simple zodiac calculation algorithm
    if ((month == 1 && day == 1) ||
        (month == 2 && day == 12) ||
        (month == 3 && day == 11) ||
        (month == 4 && day == 10) ||
        (month == 5 && day == 9) ||
        (month == 6 && day == 8) ||
        (month == 7 && day == 7) ||
        (month == 8 && day == 6) ||
        (month == 9 && day == 5) ||
        (month == 10 && day == 4) ||
        (month == 11 && day == 3) ||
        (month == 12 && day == 2)) {
      risingSign = 'Koç';
      risingInfo = 'Koç burcu cesur ve kararlıdır.';
    } else if ((month == 1 && day == 2) ||
        (month == 2 && day == 1) ||
        (month == 3 && day == 12) ||
        (month == 4 && day == 11) ||
        (month == 5 && day == 10) ||
        (month == 6 && day == 9) ||
        (month == 7 && day == 8) ||
        (month == 8 && day == 7) ||
        (month == 9 && day == 6) ||
        (month == 10 && day == 5) ||
        (month == 11 && day == 4) ||
        (month == 12 && day == 3)) {
      risingSign = 'Boğa';
      risingInfo = 'Boğa burcu sabırlı ve güvenilirdir.';
    } else if ((month == 1 && day == 3) ||
        (month == 2 && day == 2) ||
        (month == 3 && day == 1) ||
        (month == 4 && day == 12) ||
        (month == 5 && day == 11) ||
        (month == 6 && day == 10) ||
        (month == 7 && day == 9) ||
        (month == 8 && day == 8) ||
        (month == 9 && day == 7) ||
        (month == 10 && day == 6) ||
        (month == 11 && day == 5) ||
        (month == 12 && day == 4)) {
      risingSign = 'İkizler';
      risingInfo = 'İkizler burcu meraklı ve sosyal biridir.';
    } else if ((month == 1 && day == 4) ||
        (month == 2 && day == 3) ||
        (month == 3 && day == 2) ||
        (month == 4 && day == 1) ||
        (month == 5 && day == 12) ||
        (month == 6 && day == 11) ||
        (month == 7 && day == 10) ||
        (month == 8 && day == 9) ||
        (month == 9 && day == 8) ||
        (month == 10 && day == 7) ||
        (month == 11 && day == 6) ||
        (month == 12 && day == 5)) {
      risingSign = 'Yengeç';
      risingInfo = 'Yengeç burcu duygusal ve koruyucudur.';
    } else if ((month == 1 && day == 5) ||
        (month == 2 && day == 4) ||
        (month == 3 && day == 3) ||
        (month == 4 && day == 2) ||
        (month == 5 && day == 1) ||
        (month == 6 && day == 12) ||
        (month == 7 && day == 11) ||
        (month == 8 && day == 10) ||
        (month == 9 && day == 9) ||
        (month == 10 && day == 8) ||
        (month == 11 && day == 7) ||
        (month == 12 && day == 6)) {
      risingSign = 'Aslan';
      risingInfo = 'Aslan burcu cesur ve liderdir.';
    } else if ((month == 1 && day == 6) ||
        (month == 2 && day == 5) ||
        (month == 3 && day == 4) ||
        (month == 4 && day == 3) ||
        (month == 5 && day == 2) ||
        (month == 6 && day == 1) ||
        (month == 7 && day == 12) ||
        (month == 8 && day == 11) ||
        (month == 9 && day == 10) ||
        (month == 10 && day == 9) ||
        (month == 11 && day == 8) ||
        (month == 12 && day == 7)) {
      risingSign = 'Başak';
      risingInfo = 'Başak burcu detaycı ve pratik biridir.';
    } else if ((month == 1 && day == 7) ||
        (month == 2 && day == 6) ||
        (month == 3 && day == 5) ||
        (month == 4 && day == 4) ||
        (month == 5 && day == 2) ||
        (month == 6 && day == 2) ||
        (month == 7 && day == 1) ||
        (month == 8 && day == 12) ||
        (month == 9 && day == 11) ||
        (month == 10 && day == 10) ||
        (month == 11 && day == 9) ||
        (month == 12 && day == 8)) {
      risingSign = 'Terazi';
      risingInfo = 'Terazi burcu adil ve dengelidir.';
    } else if ((month == 1 && day == 8) ||
        (month == 2 && day == 7) ||
        (month == 3 && day == 6) ||
        (month == 4 && day == 5) ||
        (month == 5 && day == 4) ||
        (month == 6 && day == 3) ||
        (month == 7 && day == 2) ||
        (month == 8 && day == 1) ||
        (month == 9 && day == 12) ||
        (month == 10 && day == 11) ||
        (month == 11 && day == 10) ||
        (month == 12 && day == 9)) {
      risingSign = 'Akrep';
      risingInfo = 'Akrep burcu tutkulu ve gizemlidir.';
    } else if ((month == 1 && day == 9) ||
        (month == 2 && day == 8) ||
        (month == 3 && day == 7) ||
        (month == 4 && day == 6) ||
        (month == 5 && day == 5) ||
        (month == 6 && day == 4) ||
        (month == 7 && day == 3) ||
        (month == 8 && day == 2) ||
        (month == 9 && day == 1) ||
        (month == 10 && day == 12) ||
        (month == 11 && day == 11) ||
        (month == 12 && day == 10)) {
      risingSign = 'Yay';
      risingInfo = 'Yay burcu maceracı ve iyimserdir.';
    } else if ((month == 1 && day == 10) ||
        (month == 2 && day == 9) ||
        (month == 3 && day == 8) ||
        (month == 4 && day == 7) ||
        (month == 5 && day == 6) ||
        (month == 6 && day == 5) ||
        (month == 7 && day == 4) ||
        (month == 8 && day == 3) ||
        (month == 9 && day == 2) ||
        (month == 10 && day == 1) ||
        (month == 11 && day == 12) ||
        (month == 12 && day == 11)) {
      risingSign = 'Oğlak';
      risingInfo = 'Oğlak burcu disiplinli ve hedef odaklıdır.';
    } else if ((month == 1 && day == 11) ||
        (month == 2 && day == 10) ||
        (month == 3 && day == 9) ||
        (month == 4 && day == 8) ||
        (month == 5 && day == 7) ||
        (month == 6 && day == 6) ||
        (month == 7 && day == 5) ||
        (month == 8 && day == 4) ||
        (month == 9 && day == 3) ||
        (month == 10 && day == 2) ||
        (month == 11 && day == 1) ||
        (month == 12 && day == 12)) {
      risingSign = 'Kova';
      risingInfo = 'Kova burcu yenilikçi ve bağımsızdır.';
    } else if ((month == 1 && day == 12) ||
        (month == 2 && day == 11) ||
        (month == 3 && day == 10) ||
        (month == 4 && day == 9) ||
        (month == 5 && day == 8) ||
        (month == 6 && day == 7) ||
        (month == 7 && day == 6) ||
        (month == 8 && day == 5) ||
        (month == 9 && day == 4) ||
        (month == 10 && day == 3) ||
        (month == 11 && day == 2) ||
        (month == 12 && day == 1)) {
      risingSign = 'Balık';
      risingInfo = 'Balık burcu empatik ve hayalperesttir.';
    } else {
      risingSign = 'Bilinmeyen';
      risingInfo = 'Lütfen geçerli bir tarih giriniz.';
    }

    showAlert(context, "Burç Sonucu", "Yükseleniniz: $risingSign\n$risingInfo");
  }
}

void showAlert(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
