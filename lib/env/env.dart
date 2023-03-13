import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'PEXELS_API_KEY')
  static const pexelsApiKey = _Env.pexelsApiKey;
}
