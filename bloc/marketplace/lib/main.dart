import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cubit/chart_cubit.dart';
import 'package:marketplace/cubit/product_cubit.dart';
import 'package:marketplace/detail_product.dart';
import 'package:marketplace/chart.dart';
import 'package:marketplace/home.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:marketplace/cubit/product_list_cubit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<ProductListCubit>(context);

    // if (value.products.isEmpty) {
    //   value.fetchData();
    // }
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (_) => ProductCubit(),
          ),
          BlocProvider<ProductListCubit>(
            create: (_) => ProductListCubit(),
          ),
          BlocProvider<ChartCubit>(
            create: (_) => ChartCubit(),
          ),
        ],
        child: const Route(title: 'Produk'),
      ),
    );
  }
}

class Route extends StatefulWidget {
  const Route({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Route> createState() => _RouteState();
}

class _RouteState extends State<Route> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    ChartCubitPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
