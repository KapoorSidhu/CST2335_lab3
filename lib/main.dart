import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Week3LabPage()));

class Week3LabPage extends StatelessWidget {
  const Week3LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lab 3 Layout')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftAlignedText('Not Sure about exactly which recipe your looking for? Do a search dive into our most popular categories'),
          _buildCenteredText('By Meat'),
          _buildImageRow([
            {'label': 'Beef', 'file': 'pexels-photo-112781.png'},
            {'label': 'Chicken', 'file': 'food-dinner-lunch-chicken.png'},
            {'label': 'Pork', 'file': 'pexels-photo-1251208.png'},
            {'label': 'Seafood', 'file': 'pexels-photo-725992.png'},
          ], centerText: true),

          _buildCenteredText('By Course'),
          _buildImageRow([
            {'label': 'Main dishes', 'file': 'pexels-photo-3791089.png'},
            {'label': 'Salad', 'file': 'pexels-photo-257816.png'},
            {'label': 'Side Dishes', 'file': 'pexels-photo-2942319.png'},
            {'label': 'Crockpot', 'file': 'cheese-noodles-court-eat-delicious-39521.png'},
          ], bottomText: true),

          _buildCenteredText('By Dessert'),
          _buildImageRow([
            {'label': 'Ice Cream', 'file': 'ice-cream.png'},
            {'label': 'Brownies', 'file': 'brownies.png'},
            {'label': 'Pies', 'file': 'pies.png'},
            {'label': 'Cookies', 'file': 'cookies.png'},
          ], bottomText: true),

          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCenteredText(String label) {
    return Center(child: Text(label, style: TextStyle(fontSize: 20)));
  }

  Widget _buildLeftAlignedText(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(label, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _buildImageRow(List<Map<String, String>> items, {bool centerText = false, bool bottomText = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.map((item) =>
          _buildStackedCircle(item['label']!, item['file']!, centerText, bottomText)
      ).toList(),
    );
  }

  Widget _buildStackedCircle(String label, String filename, bool centerText, bool bottomText) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/$filename'),
            radius: 50,
          ),
          if (centerText)
            Center(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black45,
                ),
              ),
            ),
          if (bottomText)
            Positioned(
              bottom: 35,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black45,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
