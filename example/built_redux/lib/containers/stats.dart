library stats;

import 'package:built_redux_sample/models/models.dart';
import 'package:built_redux_sample/actions/actions.dart';
import 'package:built_redux_sample/selectors/selectors.dart';
import 'package:built_redux_sample/widgets/stats_counter.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'stats.g.dart';

abstract class StatsProps implements Built<StatsProps, StatsPropsBuilder> {
  int get numCompleted;

  int get numActive;

  StatsProps._();

  factory StatsProps([updates(StatsPropsBuilder b)]) = _$StatsProps;
}

class Stats
    extends StoreConnector<AppState, AppStateBuilder, AppActions, StatsProps> {
  Stats({Key key}) : super(key: key);

  @override
  StatsProps connect(AppState state) {
    return new StatsProps((b) => b
      ..numCompleted = numCompletedSelector(todosSelector(state))
      ..numActive = numActiveSelector(todosSelector(state)));
  }

  @override
  Widget build(BuildContext context, StatsProps props, AppActions actions) {
    return new StatsCounter(
      numActive: props.numActive,
      numCompleted: props.numCompleted,
    );
  }
}