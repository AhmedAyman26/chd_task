import 'package:chd_task_ahmed_ayman/core/utils/app_injector.dart';
import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/home/presentation/pages/home_cubit.dart';
import 'package:chd_task_ahmed_ayman/features/home/presentation/pages/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const HomePageBody(),
      create: (context) => HomeCubit(injector()),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
          if (state.getProductsState == RequestStatus.success) {
            return Column(
              children: [
                const Text('Products'),
                Expanded(
                    child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text('Id:'),
                              SizedBox(height: 5),
                              Text('${state.homeProducts[index].id}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Name:'),
                              SizedBox(height: 5),

                              Text('${state.homeProducts[index].name}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Description:'),
                              SizedBox(height: 5),
                              Text('${state.homeProducts[index].description}'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: state.homeProducts.length,
                ))
              ],
            );
          }
          if (state.getProductsState == RequestStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                const Text('There is a problem, please try again'),
                ElevatedButton(onPressed: () {}, child: const Text('Try again'))
              ],
            );
          }
        }),
      ),
    );
  }
}
