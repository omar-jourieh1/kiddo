import 'package:kiddo/core/assets/assets.dart';

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> onborading_data = [
  OnBoard(
      image: Assets.readJson,
      title: 'أقرا',
      description: 'الكثير من الكتب المهمة \n حول مواضيعك المفضلة'),
  OnBoard(
      image: Assets.explorerJson,
      title: 'اكتشف',
      description: 'مكتبة كبيرة من المقالات ومقاطع الفيديو المختلفة'),
  OnBoard(
      image: Assets.welcomeJson,
      title: 'انمو',
      description: 'بالكثير من القصص الممتعة والشيقة'),
  // OnBoard(image: '', title: 'title', description: 'description'),
];
