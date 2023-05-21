import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.3),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeItem(
                            image: 'assets/images/place.jpg',
                          ),
                          makeItem(
                            image: 'assets/images/place2.jpg',
                          ),
                          makeItem(
                            image: 'assets/images/place3.jpg',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          makePoint(top: 140.0, left: 40.0),
          makePoint(top: 190.0, left: 190.0),
          makePoint(top: 219.0, left: 60.0),
        ],
      ),
    );
  }

  Widget makePoint({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.3),
          shape: BoxShape.circle,
        ),
        child: Animator<double>(
          duration: const Duration(milliseconds: 1000),
          tween: Tween<double>(begin: 4.0, end: 6.0),
          cycles: 0,
          builder: (context, anim, child) => Center(
            child: Container(
              margin: EdgeInsets.all(anim.value),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: const EdgeInsets.only(
          right: 20,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    '2.1 mi',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Golden Gate Bridge',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
