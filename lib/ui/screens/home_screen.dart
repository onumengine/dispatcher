import 'package:dispatcher/features/main/presentation/view_models/home_view_model.dart';
import 'package:dispatcher/ui/organisms/cart_component.dart';
import 'package:dispatcher/ui/organisms/favorites_component.dart';
import 'package:dispatcher/ui/organisms/feed_component.dart';
import 'package:dispatcher/ui/organisms/profile_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final tabs = <Widget>[
    FeedComponent(),
    FavoritesComponent(),
    CartComponent(),
    ProfileComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return tabs[viewModel.tabIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '',
          ),
        ],
        onTap: (index) {
          Provider.of<HomeViewModel>(context, listen: false).switchToTab(index);
        },
      ),
    );
  }
}
