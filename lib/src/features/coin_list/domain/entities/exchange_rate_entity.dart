import 'package:equatable/equatable.dart';

class ExchangeRate extends Equatable {
  final String timePeriodStart;
  final String timePeriodEnd;
  final String timeOpen;
  final String timeClose;
  final double rateOpen;
  final double rateHigh;
  final double rateLow;
  final double rateClose;

  const ExchangeRate(
      {required this.timePeriodStart,
      required this.timePeriodEnd,
      required this.timeOpen,
      required this.timeClose,
      required this.rateOpen,
      required this.rateHigh,
      required this.rateLow,
      required this.rateClose});

  @override
  // TODO: implement props
  List<Object?> get props => [
        timePeriodStart,
        timePeriodEnd,
        timeOpen,
        timeClose,
        rateOpen,
        rateHigh,
        rateLow,
        rateClose
      ];
}
