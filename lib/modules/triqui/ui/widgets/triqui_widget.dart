import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../utils/utils.dart';

class BuilTresEnRaya extends ConsumerWidget {
  const BuilTresEnRaya({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final optionList = TriquiState.of(context).controllerTriqui.modelList.optionList
    return SizedBox(
      height: Responsive.distancePercentFromHeight(context, 37.3049),
      width: Responsive.distancePercentFromWidth(context, 74.2718),
      child: Expanded(
        flex: 3,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                ref.watch(triquiProvider);
                final optionList = ref.read(triquiProvider.notifier).optionList;
                return GestureDetector(
                  onTap: () {
                    ref.read(triquiProvider.notifier).changeValue(index);
                    ref.watch(triquiProvider.notifier).checkWinner();
                    if (ref.read(triquiProvider.notifier).winner != '') {
                      displayAlert(
                          context, ref.read(triquiProvider.notifier).winner);
                    } else if (ref
                            .read(triquiProvider.notifier)
                            .modelList
                            .filledBoxes ==
                        9) {
                      displayAlert(context, 'Nadie Gano');
                    }
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: _getBorder(context, index)),
                    child: Center(
                      child: Text(
                        optionList[index],
                        style: TextStyle(
                          color: optionList[index] == 'x'
                              ? Colors.lightBlueAccent
                              : Colors.white,
                          fontSize: 100,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void displayAlert(BuildContext context, String winner) {
  showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            width: 200.00,
            //Responsive.distancePercentFromWidth(context, 83.4951),
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Column(
                    children: [
                      Text('GANADOR',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor)),
                      Text('JUGADOR: $winner',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      });
}

Border _getBorder(BuildContext context, int index) {
  Border border = Border.all();
  final BorderSide borderSide =
      BorderSide(width: 6, color: Theme.of(context).primaryColor);
  switch (index) {
    case 0:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 1:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 2:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide.none,
            bottom: borderSide);
      }
      break;
    case 3:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 4:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 5:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide.none,
            bottom: borderSide);
      }
      break;
    case 6:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: BorderSide.none);
      }
      break;
    case 7:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: BorderSide.none);
      }
      break;
    case 8:
      {
        border = const Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide.none,
            bottom: BorderSide.none);
      }
      break;
  }
  return border;
}
