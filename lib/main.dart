import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_project/presentation/cubit/counter_cubit.dart';
import 'package:flutter_final_project/presentation/repository/repositories.dart';
import 'package:flutter_final_project/presentation/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        Provider<Repositories>(
          create: (_) => Repositories(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            repositories: RepositoryProvider.of<Repositories>(context)!,
          ),
        ), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    
    BlocProvider.of<CounterCubit>(context).increment();
    BlocProvider.of<CounterCubit>(context).decrement();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeChange,
      appBar: AppBar(
        backgroundColor: themeProvider.themeChange,
        title: Text(
          widget.title,
          style: TextStyle(color: themeProvider.textChange),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: themeProvider.textChange),
            ),
           
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterSuccess) {
                  return Text(
                    '${state.increment}',style: TextStyle(color: themeProvider.textChange),
                  );
                } else {
                  return Text('Error');
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    FloatingActionButton(
      onPressed: () {
        BlocProvider.of<CounterCubit>(context).increment();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
    const SizedBox(height: 16),
    FloatingActionButton(
      onPressed: () {
        BlocProvider.of<CounterCubit>(context).decrement();
      },
      tooltip: 'Decrement',
      child: const Icon(Icons.remove),
    ),
     const SizedBox(height: 16),
    FloatingActionButton(
      onPressed: () {
       themeProvider.toggleTheme();
      },
      tooltip: '',
      child: themeProvider.iconChange,
    ),
    FloatingActionButton(
      onPressed: () {
         BlocProvider.of<CounterCubit>(context).getWeather();
       
      },
      tooltip: 'Weather',
      child: Icon(Icons.cloud),
    ),
  ],
),

    );
  }
}
