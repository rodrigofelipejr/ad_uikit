import 'package:ad_uikit/src/components/atoms/shimmer/shimmer_component.dart';
import 'package:ad_uikit/src/components/atoms/shimmer/shimmer_style.dart';
import 'package:ad_uikit/src/components/atoms/shimmer/shimmer_styles.dart';
import 'package:ad_uikit/src/components/atoms/shimmer/widgets/shimmer_widget.dart';
import 'package:ad_uikit/src/core/bases/base_style.dart';
import 'package:ad_uikit/src/core/enums/behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_utils.dart';

void main() {
  Widget makeSut({
    ADStyle<ADShimmerStyle, ADShimmerSharedStyle> styles = ADShimmerStyles.standard,
    Size size = const Size(100, 20),
    ADBehavior behavior = ADBehavior.regular,
  }) {
    return ADShimmerComponent(styles: styles, size: size, behavior: behavior);
  }

  group('ADShimmerComponent', () {
    testWidgets('should render correctly with standard styles', (tester) async {
      // Arrange
      // Act
      await TestUtils.makeTestableWidget(tester, child: makeSut());

      // Assert
      final shimmerFinder = find.byType(Shimmer);
      expect(shimmerFinder, findsOneWidget);

      final containerFinder = find.descendant(of: shimmerFinder, matching: find.byType(Container));
      expect(containerFinder, findsOneWidget);

      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration;

      expect(container.constraints?.maxWidth, 100);
      expect(container.constraints?.maxHeight, 20);
      expect(decoration.shape, BoxShape.rectangle);
      expect(decoration.borderRadius, BorderRadius.zero);
    });

    testWidgets('should render correctly with standardRounded styles', (tester) async {
      // Arrange
      // Act
      await TestUtils.makeTestableWidget(tester, child: makeSut(styles: ADShimmerStyles.standardRounded));

      // Assert
      final containerFinder = find.byType(Container);
      final decoration = tester.widget<Container>(containerFinder).decoration as BoxDecoration;

      expect(decoration.borderRadius, isNotNull);
      expect(decoration.shape, BoxShape.rectangle);
    });

    testWidgets('should render correctly with standardCircular styles', (tester) async {
      // Arrange
      // Act
      await TestUtils.makeTestableWidget(
        tester,
        child: makeSut(styles: ADShimmerStyles.standardCircular, size: Size(50, 50)),
      );

      // Assert
      final containerFinder = find.byType(Container);
      final decoration = tester.widget<Container>(containerFinder).decoration as BoxDecoration;

      expect(decoration.shape, BoxShape.circle);
      expect(decoration.borderRadius, isNull);
    });

    testWidgets('should apply colors correctly from style', (tester) async {
      // Arrange
      // Act
      await TestUtils.makeTestableWidget(tester, child: makeSut(styles: ADShimmerStyles.standard));

      // Assert
      final shimmer = tester.widget<Shimmer>(find.byType(Shimmer));
      expect(shimmer.gradient, isA<LinearGradient>());

      final gradient = shimmer.gradient as LinearGradient;
      final style = ADShimmerStyles.standard.regular;

      expect(gradient.colors[0], style.baseColor);
      expect(gradient.colors[2], style.highlightColor);
    });

    testWidgets('should resolve style based on behavior', (tester) async {
      // Arrange
      final styleLoading = ADStyle<ADShimmerStyle, ADShimmerSharedStyle>(
        shared: const ADShimmerSharedStyle(),
        regular: ADShimmerStyles.standard.regular,
        loading: const ADShimmerStyle(
          baseColor: Colors.red,
          highlightColor: Colors.white,
          shapeColor: Colors.grey,
          borderRadius: BorderRadius.zero,
          isCircular: false,
        ),
      );

      // Act
      await TestUtils.makeTestableWidget(
        tester,
        child: makeSut(styles: styleLoading, behavior: ADBehavior.loading),
      );

      // Assert
      final shimmer = tester.widget<Shimmer>(find.byType(Shimmer));
      final gradient = shimmer.gradient as LinearGradient;

      expect(gradient.colors[0], Colors.red);
    });

    testWidgets('ZShimmer.standard should render correctly', (tester) async {
      // Arrange
      // Act
      await TestUtils.makeTestableWidget(tester, child: makeSut(styles: ADShimmerStyles.standard));

      // Assert
      final shimmerFinder = find.byType(Shimmer);
      expect(shimmerFinder, findsOneWidget);

      final containerFinder = find.descendant(of: shimmerFinder, matching: find.byType(Container));
      expect(containerFinder, findsOneWidget);
    });
  });
}
