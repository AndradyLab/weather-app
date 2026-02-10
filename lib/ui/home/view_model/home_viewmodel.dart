import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/data/repositories/forecast/forecast_repository.dart';
import 'package:weather_app/data/repositories/forecast/forecast_repository_remote.dart';
import 'package:weather_app/data/services/api/model/current_weather/current_weather_api_model.dart';
import 'package:weather_app/utils/result.dart';

part 'home_view_model.g.dart';

// 1. Definimos o estado como CurrentWeatherApiModel? (Nullable)
// Por que? Porque quando a tela abre, não tem cidade selecionada ainda.
@riverpod
class HomeViewModel extends _$HomeViewModel {
  
  @override
  FutureOr<CurrentWeatherApiModel?> build() {
    // Estado inicial: null (Nenhum dado para mostrar)
    return null; 
  }

  Future<void> getForecast(String city) async {
    // 1. Feedback Imediato: Coloca a UI em estado de carregamento
    // Mantemos o estado anterior (value) se quiser evitar "piscar" a tela, 
    // mas aqui vamos forçar o loading limpo.
    state = const AsyncValue.loading();

    // 2. Obtém o Repositório (Injeção de Dependência via Riverpod)
    // Note o uso de 'ref.read' dentro de métodos de ação (boas práticas)
    final repository = ref.read(forecastRepositoryLocalProvider);

    // 3. Chamada ao Repositório
    // O Result garante que isso NUNCA vai dar crash (throw exception)
    final result = await repository.getForecast(city);

    // 4. A Tradução (The Mapping Strategy)
    // Convertemos o 'Result' do Backend para o 'AsyncValue' do Frontend
    result.when(
      ok: (weatherData) {
        // Sucesso: Atualizamos o estado com os dados
        state = AsyncValue.data(weatherData);
      },
      error: (exception) {
        // Erro: Atualizamos o estado com o erro
        // O Riverpod vai capturar isso e permitir mostrar na UI via .when(error:)
        state = AsyncValue.error(exception, StackTrace.current);
      },
    );
  }
}