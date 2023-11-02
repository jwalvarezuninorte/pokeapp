import 'package:flutter/material.dart';
import 'package:pokeapp/utils/app_theme.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.padding,
        ),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(AppTheme.padding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radius),
            color: Colors.grey[200],
          ),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/pokeball.png',
            imageErrorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/pokeball.png',
              width: 120,
              height: 120,
            ),
            image: images[index],
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
          width: 20,
        ),
        itemCount: images.length,
      ),
    );
  }
}
