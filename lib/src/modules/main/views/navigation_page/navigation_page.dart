import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
   int _indexSelected = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('home');
        break;
      case 1:
        Modular.to.navigate('favorites');
        break;
      case 2:
        Modular.to.navigate('search');
        break;
      case 3:
        Modular.to.navigate('profile');
        break;
    }

    setState(() => _indexSelected = index);
  }

  @override
  void initState() {
    _onItemTapped(_indexSelected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Hotel pra hoje'),
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _indexSelected,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Favoritos', icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: 'Buscar', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
