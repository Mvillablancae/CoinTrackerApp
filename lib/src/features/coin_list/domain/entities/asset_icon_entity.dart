import 'package:equatable/equatable.dart';

class AssetIcon extends Equatable {
    final String assetId;
    final String url;

    const AssetIcon({
        required this.assetId,
        required this.url,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [assetId,url];

}
