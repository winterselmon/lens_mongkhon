import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mongkhon_lens/bloc/mental_bloc.dart';
import 'package:mongkhon_lens/general_function.dart';

class MentalPage extends StatefulWidget {
  const MentalPage({super.key});

  static const routeName = '/mental';

  @override
  State<MentalPage> createState() => _MentalPageState();
}

class _MentalPageState extends State<MentalPage> {
  late double height;
  late double width;
  List _mentalList = [];
  List _selectMentalList = [];
  late BuildContext _mentalBlocContext;
  MentalState _mentalCurrentState = MentalInitial();
  int _mentalIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 100; i++) {
      _mentalList.add(i.toString().padLeft(2, '0'));
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    _mentalBlocContext = context;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: MultiBlocProvider(
          providers: [
            _blocProvider(context),
          ],
          child: MultiBlocListener(
            listeners: [
              _blocListener(),
            ],
            child: BlocBuilder<MentalBloc, MentalState>(
              builder: (context, state) {
                _mentalBlocContext = context;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: height,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _mentalList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 4,
                                  mainAxisExtent: 50),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // _dispatchSetMentalIndex(
                                //     _mentalBlocContext, index);

                                if (_selectMentalList
                                    .contains(_mentalList[index])) {
                                  _selectMentalList
                                      .remove(_mentalList[index]);
                                } else {
                                  _selectMentalList
                                      .add(_mentalList[index]);
                                }

                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: _selectMentalList.isNotEmpty &&
                                          _selectMentalList
                                              .contains(_mentalList[index])
                                      ? Colors.red
                                      : Colors.white,
                                ),
                                child: Text(
                                  _mentalList[index].toString(),
                                  style: TextStyle(
                                    color: _selectMentalList.isNotEmpty &&
                                            _selectMentalList
                                                .contains(_mentalList[index])
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  BlocListener<MentalBloc, MentalState> _blocListener() {
    return BlocListener<MentalBloc, MentalState>(
      listener: (BuildContext context, MentalState state) {
        _mentalCurrentState = state;
        _mentalBlocContext = context;

        if (state is MentalIndexState) {
          _mentalIndex = state.mentalIndex;

          debugPrint(_mentalIndex.toString());
          debugPrint(_selectMentalList.toString());
          debugPrint(_mentalList[_mentalIndex].toString());

          if (_selectMentalList.contains(_mentalList[_mentalIndex])) {
            _selectMentalList.remove(_mentalList[_mentalIndex]);
          } else {
            _selectMentalList.add(_mentalList[_mentalIndex]);
          }
        }
      },
    );
  }

  BlocProvider<MentalBloc> _blocProvider(BuildContext context) {
    return BlocProvider(
      create: (_) => MentalBloc()
        ..add(
          const MentalEventInit(),
        ),
    );
  }
}

void _dispatchSetMentalIndex(BuildContext context, int index) {
  GeneralFunction.dispatchMentalBloc(
    context,
    SetMentalIndex(
      mentalIndex: index,
    ),
  );
}
