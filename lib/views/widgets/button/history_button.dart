part of '../widget.dart';

class HistoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Tambahkan aksi yang ingin dilakukan saat tombol ditekan
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        backgroundColor: Color(0xFF30E5D0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Riwayat Pemupukan', // Teks di sebelah kiri
            style: TextStyle(fontSize: 16.0),
          ),
          Icon(Icons.history), // Ikon riwayat di pojok kanan
        ],
      ),
    );
  }
}
