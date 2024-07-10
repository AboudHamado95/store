import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

// final authController = Get.put(AuthController());

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailAddressController.dispose();
    passwordController.dispose();
    nameController.dispose();

    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    // getIt<AuthBloc>().close();
    // Navigator.pushReplacementNamed(context, Routes.preRegisterScreen);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // final theme = context.read<ThemeCubit>().globalAppTheme;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Container()
      // Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     leading: InkWell(
      //       onTap: () => Navigator.pop(context),
      //       child: Icon(
      //         Icons.arrow_back,
      //         color: HexColor('#272727'),
      //       ),
      //     ),
      //   ),
      //   body: SafeArea(
      //     child: BlocProvider(
      //       create: (context) => getIt<AuthBloc>(),
      //       child: SingleChildScrollView(
      //         child: Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 27.px),
      //           child: Form(
      //             key: formKey,
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 80.px),
      //                 Row(
      //                   children: [
      //                     Text(
      //                       'Create Account',
      //                       style: TextStyle(
      //                         color: HexColor('#272727'),
      //                         fontWeight: FontWeight.w700,
      //                         fontSize: FontManagerStyles.fontSize(32),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(height: 40.px),
      //                 ClipRRect(
      //                     borderRadius: BorderRadius.circular(6.px),
      //                     child: TextFormField(
      //                       controller: nameController,
      //                       validator: (value) {
      //                         if (value!.isEmpty) {
      //                           return 'This field is required!';
      //                         }
      //                         return null;
      //                       },
      //                       decoration: InputDecoration(
      //                           fillColor: HexColor('#F5F5F5'),
      //                           filled: true,
      //                           border: InputBorder.none,
      //                           hintText: 'name',
      //                           hintStyle: TextStyle(
      //                             fontSize: FontManagerStyles.fontSize(12),
      //                             color: HexColor('#545454'),
      //                           )),
      //                     )),
      //                 SizedBox(height: 20.px),
      //                 ClipRRect(
      //                     borderRadius: BorderRadius.circular(6.px),
      //                     child: TextFormField(
      //                       controller: emailAddressController,
      //                       validator: (value) {
      //                         if (value!.isEmpty) {
      //                           return 'This field is required!';
      //                         }
      //                         return null;
      //                       },
      //                       decoration: InputDecoration(
      //                           fillColor: HexColor('#F5F5F5'),
      //                           filled: true,
      //                           border: InputBorder.none,
      //                           hintText: 'Email Address',
      //                           hintStyle: TextStyle(
      //                             fontSize: FontManagerStyles.fontSize(12),
      //                             color: HexColor('#545454'),
      //                           )),
      //                     )),
      //                 SizedBox(height: 20.px),
      //                 ClipRRect(
      //                     borderRadius: BorderRadius.circular(6.px),
      //                     child: TextFormField(
      //                       controller: passwordController,
      //                       validator: (value) {
      //                         if (value!.isEmpty) {
      //                           return 'This field is required!';
      //                         }
      //                         return null;
      //                       },
      //                       decoration: InputDecoration(
      //                         fillColor: HexColor('#F5F5F5'),
      //                         suffixIcon: Padding(
      //                           padding: const EdgeInsets.all(12.0),
      //                           child: Image.asset(
      //                             AssetsPaths.ubscure,
      //                             height: 4.px,
      //                             width: 7.px,
      //                             fit: BoxFit.scaleDown,
      //                           ),
      //                         ),
      //                         filled: true,
      //                         border: InputBorder.none,
      //                         hintText: 'Password',
      //                         hintStyle: TextStyle(
      //                           fontSize: FontManagerStyles.fontSize(12),
      //                           color: HexColor('#545454'),
      //                         ),
      //                       ),
      //                     )),
      //                 SizedBox(height: 20.px),
      //                 ClipRRect(
      //                     borderRadius: BorderRadius.circular(6.px),
      //                     child: TextFormField(
      //                       controller: confirmPasswordController,
      //                       validator: (value) {
      //                         if (value!.isEmpty) {
      //                           return 'This field is required!';
      //                         } else if (value != passwordController.text) {
      //                           return 'Passwords do not match';
      //                         }
      //                         return null;
      //                       },
      //                       decoration: InputDecoration(
      //                         fillColor: HexColor('#F5F5F5'),
      //                         suffixIcon: Padding(
      //                           padding: const EdgeInsets.all(12.0),
      //                           child: Image.asset(
      //                             AssetsPaths.ubscure,
      //                             height: 4.px,
      //                             width: 7.px,
      //                             fit: BoxFit.scaleDown,
      //                           ),
      //                         ),
      //                         filled: true,
      //                         border: InputBorder.none,
      //                         hintText: 'Confirm Password',
      //                         hintStyle: TextStyle(
      //                           fontSize: FontManagerStyles.fontSize(12),
      //                           color: HexColor('#545454'),
      //                         ),
      //                       ),
      //                     )),
      //                 SizedBox(height: 40.px),
      //                 BlocConsumer<AuthBloc, AuthState>(
      //                   listener: (context, state) {
      //                     if (state is Empty) {
      //                     } else {
      //                       if (kDebugMode) {
      //                         print("AuthState:$state");
      //                       }
      //                     }
      //                     if (state is Error) {
      //                       SchedulerBinding.instance.addPostFrameCallback((_) {
      //                         getSnackBarMethod(
      //                             title: 'Error:',
      //                             message: state.message,
      //                             icon: Icons.info,
      //                             colorIcon: AppColors.redColor,
      //                             backgroundColor: AppColors.greyColor);
      //                         context.read<AuthBloc>().add(ClearEvent());
      //                       });
      //                     }
      //                     if (state is SuccessRegisterState) {
      //                       final token = state.param.data.token;
      //                       CacheHelper.saveData(key: 'uId', value: token);

      //                       SchedulerBinding.instance
      //                           .addPostFrameCallback((_) async {
      //                         getSnackBarMethod(
      //                             title: 'Register:',
      //                             message: state.param.message,
      //                             icon: Icons.done,
      //                             colorIcon: AppColors.greenColor,
      //                             backgroundColor: AppColors.greyColor);
      //                       });
      //                       Navigator.pushNamedAndRemoveUntil(
      //                           context, Routes.homeScreen, (route) => false);
      //                       context.read<AuthBloc>().add(ClearEvent());
      //                     }
      //                   },
      //                   builder: (context, state) {
      //                     return state is Loading
      //                         ? Center(
      //                             child: SpinKitFadingCircle(
      //                                 color: AppColors.primaryColor))
      //                         : ClinicButton(
      //                             buttonText: 'Register',
      //                             onPressed: () {
      //                               signUpValidateFunction(context);
      //                             },
      //                             borderRadius: 16.px,
      //                           );
      //                   },
      //                 ),
      //                 SizedBox(height: 20.px),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
   
    );
  }

  // void signUpValidateFunction(BuildContext context) {
  //   if (formKey.currentState!.validate()) {
  //     RegisterParam registerParam = RegisterParam(
  //         email: emailAddressController.text.trim(),
  //         password: passwordController.text.trim(),
  //         name: nameController.text.trim(),
  //         confirmPassword: confirmPasswordController.text.trim());
  //     context.read<AuthBloc>().add(RegisterEvent(param: registerParam));
  //   }
  // }
}
