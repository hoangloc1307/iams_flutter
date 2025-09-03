import 'package:envied/envied.dart';

part 'env.g.dart';

const String env = String.fromEnvironment('ENV', defaultValue: 'development');

@Envied(
  path: env == 'production'
      ? '.env.production'
      : env == 'staging'
      ? '.env.staging'
      : '.env.development',
  obfuscate: true,
)
abstract class Env {
  @EnviedField(varName: 'ENVIROMENT')
  static final String enviroment = _Env.enviroment;
}
