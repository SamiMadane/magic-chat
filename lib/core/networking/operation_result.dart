import 'package:freezed_annotation/freezed_annotation.dart';
part 'operation_result.freezed.dart';

@freezed
abstract class OperationResult<T> with _$OperationResult<T> {
  const factory OperationResult.success(T data) = Success<T>;
  const factory OperationResult.failure(String error) = Failure<T>;
}
 