import 'package:appwrite/appwrite.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final client = Client()
      .setEndpoint('http://192.168.18.7:8080/v1')
      .setProject('648597e8a399b887f2a6');

  UserCubit() : super(UserInitial());

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(UserSignUpLoading());

    try {
      final account = Account(client);

      await account.create(
        userId: ID.unique(),
        name: name,
        email: email,
        password: password,
      );

      emit(UserSignUpSucess());
    } on AppwriteException catch (e) {
      emit(UserSignUpError(e.message.toString()));
    } catch (e) {
      emit(const UserSignUpError("Opps! something went wrong"));
    }
  }

  void loginWithEmail(String email, String password) async {
    emit(UserLoginLoading());
    try {
      final account = Account(client);

      await account.createEmailSession(email: email, password: password);

      emit(UserLoginSucess());
    } on AppwriteException catch (e) {
      emit(UserLoginError(e.message.toString()));
    } catch (e) {
      emit(const UserLoginError("Opps! something went wrong"));
    }
  }

  void loginWithSocial({required String provider}) async {
    emit(UserLoginLoading());
    try {
      final account = Account(client);
      account.createOAuth2Session(provider: provider);
      await Account(client).createOAuth2Session(
        provider: provider,
      );
      emit(UserLoginSucess());
    } on AppwriteException catch (e) {
      emit(UserLoginError(e.message.toString()));
    } catch (e) {
      emit(const UserLoginError("Opps! something went wrong"));
    }
  }

  void getOtpForPasswordReset(String email) async {
    emit(UserOtpSendLoading());
    final account = Account(client);
    try {
      await account.createRecovery(email: email, url: 'http://192.168.18.7');
      emit(UserOtpSendSucess());
    } on AppwriteException catch (e) {
      emit(UserOtpSendError(e.message.toString()));
    } catch (e) {
      emit(const UserOtpSendError("Opps! something went wrong"));
    }
  }

  void logout() {}
}
