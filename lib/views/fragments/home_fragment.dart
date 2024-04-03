part of 'fragment.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chili-Grow',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notification_add_sharp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person_pin),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(175, 245, 237, 1)
              // image: DecorationImage(image: AssetImage('image'))
              ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(0, 133, 117, 1)
              // image: DecorationImage(image: AssetImage('image'))
              ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 31,
            ),
            Text(
              'semua fitur',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(0, 133, 117, 1)
                      // image: DecorationImage(image: AssetImage('image'))
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(0, 133, 117, 1)
                      // image: DecorationImage(image: AssetImage('image'))
                      ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Container(
                  width: 140,
                  height: 260,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(0, 133, 117, 1)
                      // image: DecorationImage(image: AssetImage('image'))
                      ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
