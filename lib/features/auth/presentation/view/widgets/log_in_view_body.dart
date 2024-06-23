import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tasks_app/core/colors.dart';
import 'package:tasks_app/core/utils/app_router.dart';
import 'package:tasks_app/core/utils/styles.dart';
import 'package:tasks_app/core/widgets/custom_button.dart';
import 'package:tasks_app/core/widgets/custom_text_form_field.dart';
import 'package:tasks_app/features/auth/presentation/view%20model/auth_cubit/auth_cubit.dart';
import 'package:tasks_app/features/auth/presentation/view%20model/auth_cubit/auth_states.dart';

class LogInViewBody extends StatelessWidget {
  LogInViewBody({super.key});
  late String userName, password;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? errorMessage = BlocProvider.of<AuthCubit>(context).errorMessage;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            isLoading = true;
          } else if (state is AuthFailureState) {
            SnackBar(content: Text(errorMessage!));
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Log In',
                      style: Styles.textStyle30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Username'),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextFormField(
                      onChanged: (userName) {
                        this.userName = userName;
                      },
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Password'),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextFormField(
                      onChanged: (password) {
                        this.password = password;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        text: 'Log In',
                        textColor: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .fetchUserDetails(
                                    userName: userName, password: password);
                            context.go(AppRouter.tasksPage);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
