class Slide {
  final String imageUrl;
  final String title;

  Slide({
    required this.imageUrl,
    required this.title,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/ba.png',
    title: 'Welcome to QR Scanner',
  ),
  Slide(
      imageUrl: 'assets/bar.png',
      title: 'You can scan any barcode of your choice'),
  Slide(
    imageUrl: 'assets/b.png',
    title: 'For better Experience, you will need to give access to your Camera',
  ),
];
