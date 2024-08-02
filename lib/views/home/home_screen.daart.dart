import 'package:bloc_mvvm_2/Services/storage/local_storage.dart';
import 'package:bloc_mvvm_2/Utils/enum.dart';
import 'package:bloc_mvvm_2/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_mvvm_2/config/Internet%20Exception/Internet_Exception.dart';
import 'package:bloc_mvvm_2/config/Routes/Routes_name.dart';
import 'package:bloc_mvvm_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MoviesBloc moviesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    moviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('HomeScreen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            LocalStorage localStorage = LocalStorage();
            localStorage.clearValue('token').then((value){
                  localStorage.clearValue('isLogin');
                  Navigator.pushNamed(context, RoutesName.loginScreen);
            });
          }, icon:const  Icon(Icons.logout))
        ],
      ),
      body:BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc,MoviesState>(builder: (BuildContext context,state){
          switch(state.moviesList.status){
            case Status.loading:
               return const Center(child: CircularProgressIndicator(),);
            case Status.error:
              if(state.moviesList.message == 'No Internet'){
                return InternetException(onPress: (){moviesBloc.add(MoviesFetched());});
              }
              return Center(child: Text(state.moviesList.message.toString()),);
            case Status.completed:
              if(state.moviesList.data == null){
                return const  Text('No Data Found');
              }
               final movieList = state.moviesList.data!;
               return ListView.builder(
                   itemBuilder: (context,index){
                     final tvShow = movieList.tvShow[index];
                     return Card(
                       child: ListTile(
                         title: Text(tvShow.name.toString()),
                         subtitle: Text(tvShow.network.toString()),
                         trailing: Text(tvShow.status.toString()),
                       ),
                     );
                   }

               );
            case null :
              return SizedBox();
          }
        },
        )

      )


    );
  }
}
