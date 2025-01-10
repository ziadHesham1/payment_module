import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class AppImageWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;
  final String? placeHolderImage;

  const AppImageWidget({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeHolderImage,
    required this.url,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: imageWidget(),
      );
    } else {
      return imageWidget();
    }
  }

  Widget imageWidget() {
    if (url == null || url!.isEmpty) {
      // Handle empty URL
      return _buildPlaceholderImage();
    } else if (url!.endsWith('.svg')) {
      // Handle SVG image
      return _svgImage();
    } else {
      if (url!.startsWith('assets')) {
        return Image.asset(
          url!,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholderImage();
          },
        );
      } else if (url!.startsWith('http') || url!.startsWith('https')) {
        return _cachedNetworkImage();
      } else {
        // Handle invalid URL
        return _buildPlaceholderImage();
      }
    }
  }

  Widget _svgImage() {
    if (url!.startsWith('assets')) {
      // Handle local SVG asset
      return SvgPicture.asset(
        url!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (context) => _buildShimmerLoading(),
      );
    } else {
      // Handle network SVG
      return SvgPicture.network(
        url!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (context) => _buildShimmerLoading(),
      );
    }
  }

  Widget _cachedNetworkImage() {
    return CachedNetworkImage(
      imageUrl: url!,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return _buildShimmerLoading();
      },
      errorWidget: (context, url, error) => _buildPlaceholderImage(),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: width ?? 100,
      height: height ?? 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width ?? 100,
        height: height ?? 100,
        decoration: BoxDecoration(
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          color: Colors.grey,
        ),
      ),
    );
  }
}
