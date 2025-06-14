// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nilam/core/ioc/ioc.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
