import 'package:ar_portal/utils/app_colors.dart';
import 'package:ar_portal/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aliceBlue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 300,
              color: AppColors.cherryPie,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "ADD NEW",
                    style: AppStyles.textSize22(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              height: 300,
              color: AppColors.cherryPie,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.update,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "UPDATE",
                    style: AppStyles.textSize22(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              height: 300,
              color: AppColors.cherryPie,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "VIEW LIST",
                    style: AppStyles.textSize22(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
