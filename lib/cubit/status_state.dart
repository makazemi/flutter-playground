import 'package:meta/meta.dart';


@immutable
abstract class StatusState {
  const StatusState();
}

class StatusInitial extends StatusState {
  const StatusInitial();
}

class StatusLoading extends StatusState {
  const StatusLoading();
}

class StatusLoaded extends StatusState {
  final String status;
  const StatusLoaded(this.status);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StatusLoaded && o.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}

class StatusError extends StatusState {
  final String message;
  const StatusError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StatusError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}