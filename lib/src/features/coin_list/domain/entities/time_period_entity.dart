import 'package:equatable/equatable.dart';

class TimePeriod extends Equatable {
    final String periodId;
    final int lengthSeconds;
    final int lengthMonths;
    final int unitCount;
    final String unitName;
    final String displayName;

    TimePeriod({
        required this.periodId,
        required this.lengthSeconds,
        required this.lengthMonths,
        required this.unitCount,
        required this.unitName,
        required this.displayName,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [periodId,
        lengthSeconds,
        lengthMonths,
        unitCount,
        unitName,
        displayName,];

}
