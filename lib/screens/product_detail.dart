import 'package:assessment/cubit/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff42c8de),
        title: Text("Product Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
             if(state is ProductDetailLoaded){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                       height: 200,
                       width: 200,
                       child: Image.network(state.singleProduct.image)),
                   SizedBox( height: 15,),
                   Text(state.singleProduct.title,style: Theme.of(context).textTheme.headlineMedium,),
                   SizedBox( height: 15,),
                   Text(state.singleProduct.description,style: Theme.of(context).textTheme.bodyLarge,),
                   SizedBox( height: 15,),
                   Text("Price : ₹ ${state.singleProduct.price.toString()}",style: Theme.of(context).textTheme.labelLarge,),
                   SizedBox( height: 15,),
                   Text("Category : ${state.singleProduct.category.toString().toUpperCase()}"),
                   SizedBox( height: 15,),
                   Text("Rating : ${state.singleProduct.rating.rate}/5")

                 ],
               );
             }else{
               return Center(child: CircularProgressIndicator());
             }
          },
        ),
      ),
    );
  }
}
