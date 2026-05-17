import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/api/api_consumer.dart';
import 'package:hungry_app/core/api/dio_consumer.dart';
import 'package:hungry_app/core/api/endpoint.dart';
import 'package:hungry_app/core/error/exption.dart';
import 'package:hungry_app/models/signup_model.dart';
import 'package:hungry_app/repository/auth_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final ApiConsumer api = DioConsumer(dio: Dio());

  UserAuthCubit() : super(UserAuthInitial());

  XFile? image;

  void uploadImage(XFile? pickedImage) {
    if (pickedImage != null) {
      image = pickedImage;
      emit(UploadImageState());
    }
  }

  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignupLoadingState());

    final response = await AuthRepo(api: DioConsumer(dio: Dio())).signup(
      name: name,
      email: email,
      phone: phone,
      password: password,
      image: image!,
    );
    response.fold(
      (l) => emit(SignupFailureState(error: l)),
      (r) => emit(SignupSuccessState(userModel: r)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    final response = await AuthRepo(
      api: DioConsumer(dio: Dio()),
    ).login(email: email, password: password);
    response.fold(
      (l) => emit(LoginFailureState(error: l)),
      (r) => emit(LoginSuccessState(userModel: r)),
    );
  }

  @override
  void onChange(Change<UserAuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
