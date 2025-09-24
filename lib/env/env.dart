import 'package:envied/envied.dart';

part 'env.g.dart';

const String env = String.fromEnvironment('ENV', defaultValue: 'development');

@Envied(
  path: env == 'production' ? '.env.production' : '.env.development',
  obfuscate: env == 'production',
)
abstract class Env {
  @EnviedField(varName: 'ENVIROMENT')
  static final String enviroment = _Env.enviroment;

  @EnviedField(varName: 'BASE_API_URL')
  static final String baseApiUrl = _Env.baseApiUrl;

  @EnviedField(varName: 'HR_API_URL')
  static final String hrApiUrl = _Env.hrApiUrl;
}
