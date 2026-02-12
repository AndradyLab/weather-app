import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/config/dependencies.dart';
import 'package:weather_app/ui/home/view_model/home_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);
    final homeViewModel = ref.watch(homeViewModelProvider);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          width: 320,
          height: 50,
          child: TextField(
            onSubmitted: (value) => {
              if(value.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Digite o nome de uma cidade válida!"),
                  )
                )
              },
              ref.read(homeViewModelProvider.notifier).getForecast(value),
              homeViewModel.when(
                loading: () => CircularProgressIndicator(),
                error: (error, stackTrace) =>{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.toString()),
                    )
                  )
                }, 
                data: (data) => Text(data.toString())
              )
            },
            decoration: InputDecoration(
              labelText: "Digite o nome da cidade",
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.outline)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.outline)),
            ),
          ),
        ),
        actions: [
          SizedBox(width: 20),
          IconButton(
            icon: Icon(
                theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
