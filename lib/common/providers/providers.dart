import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:teste_01/common/services/connection_service.dart';

List<SingleChildWidget> getProviders() => [
      ChangeNotifierProvider(create: ((context) => ConnectionService())),
    ];
