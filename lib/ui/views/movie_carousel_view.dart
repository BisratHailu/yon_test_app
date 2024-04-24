import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yon_test/core/view_models/yon_test_model.dart';
import 'package:yon_test/ui/shared/base_view.dart';
import 'package:yon_test/ui/shared/reusable_raised_button.dart';
import 'package:yon_test/ui/shared/utils/color.dart';

import '../../core/models/movie.dart';
import '../widgets/reusable_active_indicator.dart';
import '../widgets/reusable_inactive_indicator.dart';

class MovieCarouselView extends StatefulWidget {
  final List<Movie> movie;

  const MovieCarouselView({super.key, required this.movie});

  @override
  State<MovieCarouselView> createState() => _MovieCarouselViewState();
}

class _MovieCarouselViewState extends State<MovieCarouselView> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: BaseView<YonTestModel>(
        builder: (context, yonTestModel, _) => PageView.builder(
      physics: const BouncingScrollPhysics(),
          onPageChanged: (index) => yonTestModel.setCurrentIndex = index,
          itemBuilder: (context, index) {
            return _buildBannerItem(
                yonTestModel, widget.movie[index].image ?? '');
          },
          itemCount: widget.movie.length,
          controller: pageController,
        ),
      ),
    );
  }

  Widget _buildButton() => const Padding(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
        child: ReusableRaisedButton(
          hasIcon: true,
          icon: Icons.play_arrow_rounded,
          iconSize: 22,
          label: 'Watch now',
          fontSize: 16,
        ),
      );

  Widget _buildBlurEffect(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.01),
            // Colors.black.withOpacity(0.05),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.25),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.75),
            Colors.black.withOpacity(0.9),
          ],
        ),
      ),
    );
  }


  Widget _buildIndicators(YonTestModel yonTestModel, int banners) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 20,
          width: double.infinity,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  yonTestModel.currentIndex == index
                      ? const ReusableActiveIndicator()
                      : const ReusableInactiveIndicator(),
              itemCount: banners,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(String image) => Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.maxFinite,
        // height: 500,
      );

  Widget _buildBannerItem(YonTestModel yonTestModel, String image) {
    return Stack(
      children: [
        _buildProductImage(image),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBlurEffect(context),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildButton(),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: _buildIndicators(yonTestModel, widget.movie.length)),
      ],
    );
  }
}
