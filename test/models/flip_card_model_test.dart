import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/models/user_finantial_status_model.dart';

void main() {
  test('UserFinantialStatus model has correct values', () {
    // The model should be able to receive the following data:
    final user = UserFinantialStatus(score: 'HEALTHY');

    expect(user.score, 'HEALTHY');
  });

  test('UserFinantialStatus model returns to string correctly', () {
    // The model should be able to receive the following data:
    final user = UserFinantialStatus(score: 'HEALTHY');

    expect(user.toString(), 'UserFinantialStatus{ score: HEALTHY,}');
  });
}
