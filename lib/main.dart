import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sürdürülebilirlik Uygulaması',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Her Şey Gelecek Nesiller İçin'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[50]!, Colors.lightBlue[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Sürdürülebilirlik Neden Önemlidir?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 10),
              Text(
                'Sürdürülebilirlik, doğal kaynakların korunması, çevresel etkilerin azaltılması ve gelecek nesillerin yaşam kalitesinin sağlanması açısından son derece önemlidir. '
                    'Bu yaklaşım, çevre dostu uygulamaları teşvik ederek, ekosistemlerin dengesini korur ve insan sağlığını iyileştirir. '
                    'Ayrıca, sürdürülebilir yaşam tarzları, ekonomik büyümeyi desteklerken, toplumsal adalet ve eşitliği de teşvik eder.\n\n'
                    'Geri dönüşüm ve atık ayrıştırma, sürdürülebilirliğin temel taşlarındandır. Bu uygulamalar, enerji tasarrufu sağlar, doğal kaynakların daha verimli kullanılmasına yardımcı olur ve çevresel kirliliği azaltır. '
                    'Atıkların doğru bir şekilde ayrıştırılması, geri dönüşüm süreçlerini kolaylaştırarak, atıkların yeniden kullanılmasını sağlar. '
                    'Eğer bu süreçlere uyulmazsa, çevre kirliliği, doğal kaynakların tükenmesi ve iklim değişikliği gibi ciddi sorunlar ortaya çıkabilir.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  onPressed: () {
                    _showImportanceDialog(context);
                  },
                  child: Text('Ayrıştırmanın Önemi'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Atık Türleri:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10, // Butonlar arasındaki dikey boşluk
                  alignment: WrapAlignment.center,
                  children: [
                    _buildWasteButton(context, 'CAM ATIKLAR'),
                    _buildWasteButton(context, 'PLASTIK ATIKLAR'),
                    _buildWasteButton(context, 'METAL ATIKLAR'),
                    _buildWasteButton(context, 'KAĞIT ATIKLAR'),
                    _buildWasteButton(context, 'EVSEL ATIKLAR'),
                    _buildWasteButton(context, 'KİMYASAL ATIKLAR'),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue[100],
        height: 50,
        child: Center(
          child: Text(
            '© 2024 Sürdürülebilirlik Uygulaması',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }

  void _showImportanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ayrıştırmanın Önemi'),
          content: Text(
            'Atıkların doğru bir şekilde ayrıştırılması, '
                'doğal kaynakların korunmasına, enerji tasarrufuna ve '
                'çevre kirliliğinin azaltılmasına yardımcı olur. '
                'Doğru ayrıştırma, geri dönüşüm süreçlerini '
                'kolaylaştırır ve bu da atıkların tekrar kullanılmasını sağlar.',
          ),
          actions: [
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildWasteButton(BuildContext context, String wasteType) {
    return SizedBox(
      width: 150, // Sabit genişlik
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[200],
          padding: EdgeInsets.symmetric(vertical: 10), // Dikey padding
        ),
        onPressed: () {
          _showWasteInfo(context, wasteType);
        },
        child: Text(
          wasteType,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  void _showWasteInfo(BuildContext context, String wasteType) {
    String content = '';
    String consequences = '';

    switch (wasteType) {
      case 'CAM ATIKLAR':
        content = 'Cam atıklar, geri dönüştürülebilir malzemelerdir. '
            'Cam şişeleri ve kavanozlar, özel kutularda toplanmalıdır. '
            'Cam atıklar, diğer atıklarla karıştırılmamalıdır.';
        consequences = 'Eğer cam atıklar ayrıştırılmadan çöpe gönderilirse, '
            'cam parçaları diğer atıklarla birleşir ve geri dönüşüm süreci '
            'zorlaşır. Bu durum, çevre kirliliğine ve kaynak israfına yol açar.';
        break;
      case 'PLASTIK ATIKLAR':
        content = 'Plastik atıklar, türlerine göre ayrıştırılmalıdır. '
            'PET, HDPE gibi plastiklerin geri dönüşümü mümkündür.';
        consequences = 'Ayrıştırılmayan plastikler, doğada yıllarca kalabilir ve '
            'su kaynaklarını kirletir. Bu da ekosistemleri tehdit eder.';
        break;
      case 'METAL ATIKLAR':
        content = 'Metal atıklar, ferforje, alüminyum gibi türlerine göre ayrıştırılmalıdır.';
        consequences = 'Ayrıştırılmadığında, metal atıkların geri dönüşümü zorlaşır ve '
            'doğal kaynakların daha fazla tüketilmesine neden olur.';
        break;
      case 'KAĞIT ATIKLAR':
        content = 'Kağıt atıklar, geri dönüştürülebilir malzemelerdir ve özel kutularda toplanmalıdır.';
        consequences = 'Ayrıştırılmadığında, kağıt atıkların geri dönüşümü zorlaşır ve '
            'ormanların yok olmasına katkı sağlar.';
        break;
      case 'EVSEL ATIKLAR':
        content = 'Evsel atıklar, organik ve inorganik olarak ayrıştırılmalıdır.';
        consequences = 'Ayrıştırılmadığında, organik atıklar çürüyerek metan gazı üretir ve '
            'bu da iklim değişikliğine neden olur.';
        break;
      case 'KİMYASAL ATIKLAR':
        content = 'Kimyasal atıklar, özel olarak toplanmalı ve atık yönetim tesislerine gönderilmelidir.';
        consequences = 'Ayrıştırılmadığında, kimyasal atıklar su ve toprak kirliliğine yol açar.';
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$wasteType Nasıl Ayrıştırılmalıdır?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content),
              SizedBox(height: 10),
              Text('Eğer $wasteType ayrıştırılmadan çöpe gönderilirse:'),
              Text(consequences),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
