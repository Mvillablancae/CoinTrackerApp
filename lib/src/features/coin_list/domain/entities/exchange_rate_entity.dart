import 'package:equatable/equatable.dart';

class ExchangeRate extends Equatable {
  String timePeriodStart;
  String timePeriodEnd;
  String timeOpen;
  String timeClose;
  double rateOpen;
  double rateHigh;
  double rateLow;
  double rateClose;

  ExchangeRate(
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
