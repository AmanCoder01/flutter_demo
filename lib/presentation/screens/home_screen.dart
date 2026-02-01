  import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  import '../bloc/home_bloc.dart';
  import '../bloc/home_event.dart';
  import '../bloc/home_state.dart';
  import '../../data/models/home_model.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        appBar: AppBar(
          title: const Text('Home'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context.read<HomeBloc>().add(RefreshHomeEvent());
              },
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            if (state is HomeLoaded) {
              final sections = state.home.homepageProducts ?? [];

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  return _HomeSection(section: sections[index]);
                },
              );
            }

            return const SizedBox();
          },
        ),
      );
    }
  }

  class _HomeSection extends StatelessWidget {
    final HomepageProduct section;

    const _HomeSection({required this.section});

    @override
    Widget build(BuildContext context) {
      final products = section.products ?? [];

      if (products.isEmpty) return const SizedBox();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
    }
  }

  class ProductCard extends StatelessWidget {
    final Product product;

    const ProductCard({super.key, required this.product});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 160,
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE (fixed height)
            ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          child: SizedBox(
            height: 140,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: product.bannerImage ?? '',
              fit: BoxFit.cover,
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              errorWidget: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
        ),


            // TEXT AREA (flexible)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      product.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Price
                    Text(
                      '₹ ${product.price ?? '--'}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Regular price (optional)
                    if (product.regularPrice != null)
                      Text(
                        '₹ ${product.regularPrice}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
