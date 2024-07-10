import 'package:store_app/core/utils/app_exports.dart';
import 'package:store_app/features/auth/data/repositories/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    // getIt<AuthBloc>().close();
    // Navigator.pushReplacementNamed(context, Routes.preLoginScreen);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) => AuthBloc(),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      ImgAssets.planetTopImg,
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(ImgAssets.planetBottomImg)),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.px),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          100.px.vSpace,
                          SvgPicture.asset(ImgAssets.logoImg),
                          20.px.vSpace,
                          Text(
                            'Welcome back! \nlog in using your email account to continue us',
                            style: TextStyle(
                              color: HexColor('4A4A4A'),
                              fontWeight: FontWeight.w500,
                              fontSize: FontManagerStyles.fontSize(14.px),
                            ),
                          ),
                          80.px.vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Mobile',
                                style: TextStyle(
                                  color: HexColor('4A4A4A'),
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontManagerStyles.fontSize(14.px),
                                ),
                              ),
                            ],
                          ),
                          10.px.vSpace,
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6.px),
                              child: TextFormField(
                                controller: mobileController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    fillColor: HexColor('#F5F5F5'),
                                    filled: true,
                                    border: InputBorder.none,
                                    hintText: 'Enter your  number',
                                    hintStyle: TextStyle(
                                      fontSize: FontManagerStyles.fontSize(12),
                                      color: HexColor('#545454'),
                                    )),
                              )),
                          SizedBox(height: 20.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: HexColor('4A4A4A'),
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontManagerStyles.fontSize(14.px),
                                ),
                              ),
                            ],
                          ),
                          10.px.vSpace,
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6.px),
                              child: TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: HexColor('#F5F5F5'),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      AssetsPaths.ubscure,
                                      height: 4.px,
                                      width: 7.px,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(
                                    fontSize: FontManagerStyles.fontSize(12),
                                    color: HexColor('#545454'),
                                  ),
                                ),
                              )),
                          10.px.vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password ? ',
                                style: TextStyle(
                                  color: HexColor('4A4A4A'),
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontManagerStyles.fontSize(14.px),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40.px),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is Empty) {
                              } else {
                                if (kDebugMode) {
                                  print("AuthState:$state");
                                }
                              }
                              if (state is Error) {
                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) {
                                  getSnackBarMethod(
                                      title: 'Error:',
                                      message: state.message,
                                      icon: Icons.info,
                                      colorIcon: AppColors.redColor,
                                      backgroundColor: AppColors.greyColor);
                                  context.read<AuthBloc>().add(ClearEvent());
                                });
                              }
                              if (state is SuccessLoginState) {
                                final token = state.model.content!.token;
                                CacheHelper.saveData(key: 'uId', value: token);

                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) async {
                                  getSnackBarMethod(
                                      title: 'Login:',
                                      message: state.model.message ?? '',
                                      icon: Icons.done,
                                      colorIcon: AppColors.greenColor,
                                      backgroundColor: AppColors.greyColor);
                                });
                                Navigator.pushNamedAndRemoveUntil(context,
                                    Routes.homeScreen, (route) => false);
                                context.read<AuthBloc>().add(ClearEvent());
                              }
                            },
                            builder: (context, state) {
                              return state is Loading
                                  ? Center(
                                      child: SpinKitFadingCircle(
                                          color: AppColors.primaryColor))
                                  : ClinicButton(
                                      buttonText: 'Login',
                                      onPressed: () {
                                        signInValidateFunction(context);
                                      },
                                      borderRadius: 16.px,
                                    );
                            },
                          ),
                          SizedBox(height: 20.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(10.px),
                                onTap: () {
                                  // goTo(context,
                                  //     (context) => const RegisterScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: HexColor('EBB376'),
                                  ))),
                                  child: Text(
                                    'Guest',
                                    style: TextStyle(
                                      color: HexColor('EBB376'),
                                      fontWeight: FontWeight.w400,
                                      fontSize: FontManagerStyles.fontSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signInValidateFunction(BuildContext context) {
    if (formKey.currentState!.validate()) {
      LoginParam loginParam = LoginParam(
        phone: mobileController.text.trim(),
        password: passwordController.text.trim(),
      );

      context.read<AuthBloc>().add(
            LoginEvent(
                param: LoginParam(
                    phone: loginParam.phone, password: loginParam.password)),
          );
      // locationBloc.add(const ChangeFetchingDataVariableEvent());
    }
  }
}
