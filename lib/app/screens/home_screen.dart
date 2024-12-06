import 'package:flutter/material.dart';
import 'package:kid_started_master/app/screens/animal_screen.dart';
import '../widgets/category_card.dart';
import 'alphabet_en_screen.dart';
import 'color_screen.dart';
import 'numeric_en_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      CategoryCard(
        title: 'ABC',
        primaryColor: Colors.purpleAccent[100]!,
        secondaryColor: Colors.purple,
        screen: const AlphabetEnScreen(
          title: 'ABC',
          primaryColor: Colors.purpleAccent,
          secondaryColor: Colors.purple,
        ),
      ),
      CategoryCard(
        title: '123',
        primaryColor: Colors.greenAccent[100]!,
        secondaryColor: Colors.green,
        screen: const NumericEnScreen(
          title: '123',
          primaryColor: Colors.greenAccent,
          secondaryColor: Colors.green,
        ),
      ),
      CategoryCard(
        title: 'Colors',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.orange,
        screen: const ColorScreen(
          title: 'Colors',
          primaryColor: Colors.orangeAccent,
          secondaryColor: Colors.orange,
        ),
      ),
      CategoryCard(
        title: 'Animals',
        primaryColor: Colors.purpleAccent[100]!,
        secondaryColor: Colors.purple,
        screen: const AnimalScreen(
          title: 'Animals',
          primaryColor: Colors.purpleAccent,
          secondaryColor: Colors.purple,
        ),
      ),
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: const DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 188.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("معلومات التطبيق"),
                          content: SizedBox(
                            height: 200, // ارتفاع الصندوق
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...[
                                    "/اعداد",
                                    //"محمد مصطفي محمد جلال"
                                    "أحمد ممدوح سالم الفقي",
                                    "حمدي وليد حمدي الغزالي",
                                    "زياد حازم فاروق علام",
                                    "مؤمن رأفت سيد أحمد عشيبة",
                                    "/اشراف",
                                    "د.اسلام قنديل",
                                  ].map((item) {
                                    final isArabicName =
                                        RegExp(r'[\u0600-\u06FF]').hasMatch(
                                            item); // التحقق من النص العربي
                                    if (item.startsWith('/')) {
                                      return Text(
                                        item.replaceFirst('/', ''),
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.red),
                                        textAlign:
                                            TextAlign.right, // اتجاه النص
                                      );
                                    }
                                    return Text(
                                      item,
                                      style: TextStyle(
                                        color: isArabicName
                                            ? Colors.blue
                                            : Colors.black, // لون النص
                                      ),
                                      textAlign: TextAlign.right, // اتجاه النص
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                categories
                    .map((category) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: category,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
