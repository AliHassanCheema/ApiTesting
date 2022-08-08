import 'package:demo_app/test_api_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TestApi extends ViewModelBuilderWidget<ApiViewModel> {
  const TestApi({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ApiViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: Column(
        children: [
          const Text('resonse data print here'),
          Text('has Error :  ${viewModel.hasErrorVar}'),
          Text('Downloads 1st app :  ${viewModel.downloads1}'),
          Text('Downloads 2nd app :  ${viewModel.downloads2}'),
          Center(
              child: TextButton(
            onPressed: () {
              viewModel.senData();
            },
            child: const Text(
              'send data',
              style: TextStyle(color: Colors.green),
            ),
          )),
        ],
      ),
    );
  }

  @override
  ApiViewModel viewModelBuilder(BuildContext context) {
    return ApiViewModel();
  }
}
