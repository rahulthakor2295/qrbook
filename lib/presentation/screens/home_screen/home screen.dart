import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_book/Cubit/image_slider/image_slider_cubit.dart';

import '../../../Data/repositry/repositry.dart';
class HomeScreen extends StatefulWidget {
  static String  route = 'routes';

  late Repository repository;

   HomeScreen({Key? key,required this.repository}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90.0),
      child: Center(
        child: Column(
          children: [
            Center(child: ElevatedButton(
              child: Text("press"),
              onPressed: (){
                Navigator.pushNamed(context, '/home_screen');

                // context.read<ImageSliderCubit>().repository?.sliderImage(2, 1.0, 4, 'android');
            },),),
            BlocConsumer<ImageSliderCubit, ImageSliderState>(
  listener: (context, state) {
if(state is ImageSliderSuccessState){
  final sliderResponse = state.sliderResponse.data;
  print(sliderResponse.toString());
}
  },
  builder: (context, state) {
        return Container();
  },
)
          ],
        ),
      ),
    );
  }
}
