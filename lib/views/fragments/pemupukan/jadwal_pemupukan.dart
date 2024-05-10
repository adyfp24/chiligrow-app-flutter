part of '../fragment.dart';

class JadwalPemupukan extends StatelessWidget {
  final int selangHari;
  final String selangJam;
  const JadwalPemupukan({
    Key? key,
    required this.selangHari,
    required this.selangJam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          HistoryButton(),
          SizedBox(
            height: 10,
          ),
          Text('selang hari : ${selangHari}'),
          SizedBox(
            height: 10,
          ),
          Text('setiap jam : ${selangJam}'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
