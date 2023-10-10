import 'package:assessment/cubit/home_cubit.dart';
import 'package:assessment/cubit/product_detail_cubit.dart';
import 'package:assessment/screens/product_detail.dart';
import 'package:assessment/widget/infinite_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff42c8de),
        title: Text("Product List"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if(state is HomeInitial){
           return Text("Loading...");
          }else if(state is ProductsLoading){
            return Center(child: CircularProgressIndicator());
          }else if (state is ProductsLoaded){
            return InfiniteList(
              onRequest: (int nextIndex) {
                const pageSize = 5;
                final result = nextIndex >= state.products.length
                    ? <Widget>[]
                    : List<Widget>.generate(pageSize, (i) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(spreadRadius: 3,blurRadius: 2,color: Color(
                                0xffededed))
                          ]
                        ),
                        child: InkWell(
                          onTap: (){
                            print("clicked");
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>BlocProvider(
                                  create: (context) => ProductDetailCubit()..loadProductDetail(state.products[nextIndex+i].id),
                                  child: ProductDetail()
                              ))
                            );
                          },
                          child: ListTile(
                            leading: SizedBox(width: width*0.1,child: Image.network(state.products[nextIndex+i].image,fit: BoxFit.fitWidth,)),
                            title: Text(state.products[nextIndex+i].title, maxLines: 2,),
                            subtitle: Text(state.products[nextIndex+i].description, maxLines: 2,overflow: TextOverflow.ellipsis,),
                            trailing: Text("₹ " + state.products[nextIndex+i].price.toString(),textAlign: TextAlign.justify,),
                          ),
                        ),
                      );
                    }
                    // child: Text("${state.products[nextIndex+i].id} "+state.products[nextIndex+i].title))
                );
                return Future<List<Widget>>.delayed(
                  const Duration(milliseconds: 500),
                  () => result,
                );
              },
              itemBuilder: (context, item, index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                color: Colors.white,
                child: item,
              ),
            );
          }else {
            return Center(child: Text(" something went wrong "));
          }
        },
      ),
    );
  }
}

Future<List<String>> requestItems(int nextIndex) {
  const pageSize = 10;
  final result = nextIndex > 100
      ? <String>[]
      : List<String>.generate(pageSize, (i) => "Item: ${nextIndex + i + 1}");
  return Future<List<String>>.delayed(
    const Duration(milliseconds: 500),
        () => result,
  );
}
