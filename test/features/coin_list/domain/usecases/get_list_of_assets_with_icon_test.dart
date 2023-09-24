import 'package:coin_tracker_app/src/core/errors/failure.dart';
import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CoinListRepository>()])
import 'get_list_of_assets_with_icon_test.mocks.dart';

void main() {
  late GetListOfAssetsWithIcon usecase;
  late MockCoinListRepository mockCoinListRepository;

  setUp(() {
    mockCoinListRepository = MockCoinListRepository();
    usecase = GetListOfAssetsWithIcon(mockCoinListRepository);
  });

  final List<Asset> assetList = [
    Asset(
        assetId: 'USD',
        name: 'USD',
        typeIsCrypto: 1,
        dataStart: DateTime(2023, 9, 24),
        dataEnd: DateTime(2023, 9, 24),
        dataQuoteStart: DateTime(2023, 9, 24),
        dataQuoteEnd: DateTime(2023, 9, 24),
        dataOrderbookStart: DateTime(2023, 9, 24),
        dataOrderbookEnd: DateTime(2023, 9, 24),
        dataTradeStart: DateTime(2023, 9, 24),
        dataTradeEnd: DateTime(2023, 9, 24),
        dataSymbolsCount: 1,
        volume1HrsUsd: 1.0,
        volume1DayUsd: 1.0,
        volume1MthUsd: 1.0,
        priceUsd: 1)
  ];
  final List<AssetIcon> assetIconList = [
    const AssetIcon(assetId: 'USD', url: 'www.test.com')
  ];

  final List<AssetWithIcon> assetWithIconList = [
    AssetWithIcon(asset: assetList[0], icon: assetIconList[0])
  ];

  test('Should get a list of assets with it\'s corresponding icon', () async {
    when(mockCoinListRepository.getListOfAssets())
        .thenAnswer((_) async => Right(assetList));

    when(mockCoinListRepository.getListOfAssetsIcons())
        .thenAnswer((_) async => Right(assetIconList));

    final result = await usecase(NoParams());

    bool isEqual = false;
    
    result.fold((l) => null, (r) {
      isEqual = listEquals(r, assetWithIconList);
    });

    expect(result, isNotNull);
    expect(isEqual, true);

    verify(mockCoinListRepository.getListOfAssets());
    verify(mockCoinListRepository.getListOfAssetsIcons());
    verifyNoMoreInteractions(mockCoinListRepository);
  });
}
