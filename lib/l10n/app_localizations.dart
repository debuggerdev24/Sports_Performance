import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @bodyCompoTitle.
  ///
  /// In en, this message translates to:
  /// **'Body Composition'**
  String get bodyCompoTitle;

  /// No description provided for @bodyCompoOption1.
  ///
  /// In en, this message translates to:
  /// **'Current Evaluation'**
  String get bodyCompoOption1;

  /// No description provided for @bodyCompoOption2.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get bodyCompoOption2;

  /// No description provided for @bodyCompoOption3.
  ///
  /// In en, this message translates to:
  /// **'KPI'**
  String get bodyCompoOption3;

  /// No description provided for @bodyCompoOption4.
  ///
  /// In en, this message translates to:
  /// **'Previous evaluations'**
  String get bodyCompoOption4;

  /// No description provided for @bodyCompoOption5.
  ///
  /// In en, this message translates to:
  /// **'Old Data'**
  String get bodyCompoOption5;

  /// No description provided for @weight_kg.
  ///
  /// In en, this message translates to:
  /// **'Weight kg'**
  String get weight_kg;

  /// No description provided for @height_cm.
  ///
  /// In en, this message translates to:
  /// **'Height cm'**
  String get height_cm;

  /// No description provided for @triceps.
  ///
  /// In en, this message translates to:
  /// **'Triceps'**
  String get triceps;

  /// No description provided for @subscapular.
  ///
  /// In en, this message translates to:
  /// **'Subscapular'**
  String get subscapular;

  /// No description provided for @supraespinal.
  ///
  /// In en, this message translates to:
  /// **'Supraespinal'**
  String get supraespinal;

  /// No description provided for @abdominal.
  ///
  /// In en, this message translates to:
  /// **'Abdominal'**
  String get abdominal;

  /// No description provided for @biceps.
  ///
  /// In en, this message translates to:
  /// **'Calf'**
  String get biceps;

  /// No description provided for @thigh.
  ///
  /// In en, this message translates to:
  /// **'Thigh'**
  String get thigh;

  /// No description provided for @iiiac_crest.
  ///
  /// In en, this message translates to:
  /// **'IIiac Crest'**
  String get iiiac_crest;

  /// No description provided for @head.
  ///
  /// In en, this message translates to:
  /// **'Head'**
  String get head;

  /// No description provided for @relaxed_arm.
  ///
  /// In en, this message translates to:
  /// **'Relaxed Arm'**
  String get relaxed_arm;

  /// No description provided for @contracted_arm.
  ///
  /// In en, this message translates to:
  /// **'Contracted Arm'**
  String get contracted_arm;

  /// No description provided for @forearm.
  ///
  /// In en, this message translates to:
  /// **'Forearm'**
  String get forearm;

  /// No description provided for @chest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get chest;

  /// No description provided for @minimum_waist.
  ///
  /// In en, this message translates to:
  /// **'Minimum Waist'**
  String get minimum_waist;

  /// No description provided for @max_hip.
  ///
  /// In en, this message translates to:
  /// **'Max Hip'**
  String get max_hip;

  /// No description provided for @thigh_buttock.
  ///
  /// In en, this message translates to:
  /// **'Thigh Buttock'**
  String get thigh_buttock;

  /// No description provided for @medium_muscle.
  ///
  /// In en, this message translates to:
  /// **'Medium Muscle'**
  String get medium_muscle;

  /// No description provided for @leg.
  ///
  /// In en, this message translates to:
  /// **'Leg'**
  String get leg;

  /// No description provided for @editProfTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfTitle;

  /// No description provided for @editProfName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get editProfName;

  /// No description provided for @editProfNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get editProfNameHint;

  /// No description provided for @editProfPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get editProfPhone;

  /// No description provided for @editProfPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone'**
  String get editProfPhoneHint;

  /// No description provided for @editProfMail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get editProfMail;

  /// No description provided for @editProfMailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get editProfMailHint;

  /// No description provided for @editProfWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get editProfWeight;

  /// No description provided for @editProfHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get editProfHeight;

  /// No description provided for @editProfGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get editProfGender;

  /// No description provided for @editProfGenderHint.
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get editProfGenderHint;

  /// No description provided for @editProfAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get editProfAge;

  /// No description provided for @editProfAgeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Age'**
  String get editProfAgeHint;

  /// No description provided for @editProfTextButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editProfTextButton;

  /// No description provided for @editProfTextButtonSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get editProfTextButtonSaving;

  /// No description provided for @entertainmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainmentTitle;

  /// No description provided for @entertainmentWorkPlan.
  ///
  /// In en, this message translates to:
  /// **'Workout Plan'**
  String get entertainmentWorkPlan;

  /// No description provided for @entertainmentVisualize.
  ///
  /// In en, this message translates to:
  /// **'Visualize the workout'**
  String get entertainmentVisualize;

  /// No description provided for @homeContent.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get homeContent;

  /// No description provided for @homeItem1.
  ///
  /// In en, this message translates to:
  /// **'Training Session'**
  String get homeItem1;

  /// No description provided for @homeItem2.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get homeItem2;

  /// No description provided for @homeItem3.
  ///
  /// In en, this message translates to:
  /// **'Planning &\n Programming'**
  String get homeItem3;

  /// No description provided for @homeItem4.
  ///
  /// In en, this message translates to:
  /// **'Indicators'**
  String get homeItem4;

  /// No description provided for @trainingSession.
  ///
  /// In en, this message translates to:
  /// **'Training Session'**
  String get trainingSession;

  /// No description provided for @loginTitle1.
  ///
  /// In en, this message translates to:
  /// **'Hello there, sign in to'**
  String get loginTitle1;

  /// No description provided for @loginTitle2.
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get loginTitle2;

  /// No description provided for @loginEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get loginEmail;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get loginEmailHint;

  /// No description provided for @loginPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get loginPasswordHint;

  /// No description provided for @loginForgotPass.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password ?'**
  String get loginForgotPass;

  /// No description provided for @loginTextButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTextButton;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @mainTab1.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get mainTab1;

  /// No description provided for @mainTab2.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get mainTab2;

  /// No description provided for @mainTab3.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get mainTab3;

  /// No description provided for @mainTab4.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get mainTab4;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationTitle;

  /// No description provided for @planningProgrammingTitle.
  ///
  /// In en, this message translates to:
  /// **'Planning & Programming'**
  String get planningProgrammingTitle;

  /// No description provided for @planItem1.
  ///
  /// In en, this message translates to:
  /// **'Plans'**
  String get planItem1;

  /// No description provided for @planItem2.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get planItem2;

  /// No description provided for @planItem3.
  ///
  /// In en, this message translates to:
  /// **'Gear'**
  String get planItem3;

  /// No description provided for @planItem4.
  ///
  /// In en, this message translates to:
  /// **'Body Composition'**
  String get planItem4;

  /// No description provided for @planTitle1.
  ///
  /// In en, this message translates to:
  /// **'Pagos'**
  String get planTitle1;

  /// No description provided for @planTitle2.
  ///
  /// In en, this message translates to:
  /// **'Plans'**
  String get planTitle2;

  /// No description provided for @metrics.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get metrics;

  /// No description provided for @indicatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Indicators'**
  String get indicatorTitle;

  /// No description provided for @strengthTitle.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strengthTitle;

  /// No description provided for @fmsTitle.
  ///
  /// In en, this message translates to:
  /// **'FMS'**
  String get fmsTitle;

  /// No description provided for @limitationTitle.
  ///
  /// In en, this message translates to:
  /// **'Limitations'**
  String get limitationTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileAccount;

  /// No description provided for @profilePersonalData.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get profilePersonalData;

  /// No description provided for @profileCouch.
  ///
  /// In en, this message translates to:
  /// **'Coach Name'**
  String get profileCouch;

  /// No description provided for @profileNotification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get profileNotification;

  /// No description provided for @profileNotificationSub.
  ///
  /// In en, this message translates to:
  /// **'Pop-Up Notification'**
  String get profileNotificationSub;

  /// No description provided for @profileOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get profileOther;

  /// No description provided for @profileContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get profileContactUs;

  /// No description provided for @profilePrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get profilePrivacyPolicy;

  /// No description provided for @profileSetting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSetting;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @profileGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get profileGoal;

  /// No description provided for @settingTitle.
  ///
  /// In en, this message translates to:
  /// **'App Setting'**
  String get settingTitle;

  /// No description provided for @settingChangePass.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingChangePass;

  /// No description provided for @settingDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingDarkMode;

  /// No description provided for @settingLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingLanguage;

  /// No description provided for @settingVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingVersion;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @paymentOptions.
  ///
  /// In en, this message translates to:
  /// **'Payment Options'**
  String get paymentOptions;

  /// No description provided for @isTraining.
  ///
  /// In en, this message translates to:
  /// **'is Training'**
  String get isTraining;

  /// No description provided for @isNutrition.
  ///
  /// In en, this message translates to:
  /// **'is Nutrition'**
  String get isNutrition;

  /// No description provided for @isEvaluations.
  ///
  /// In en, this message translates to:
  /// **'is Evaluations'**
  String get isEvaluations;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @quarterly.
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get quarterly;

  /// No description provided for @biannual.
  ///
  /// In en, this message translates to:
  /// **'Biannual'**
  String get biannual;

  /// No description provided for @annual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get annual;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @toolsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get toolsTitle;

  /// No description provided for @toolsOption1.
  ///
  /// In en, this message translates to:
  /// **'Video Training'**
  String get toolsOption1;

  /// No description provided for @toolsOption2.
  ///
  /// In en, this message translates to:
  /// **'Tutorial videos'**
  String get toolsOption2;

  /// No description provided for @toolsOption3.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get toolsOption3;

  /// No description provided for @toolsOption4.
  ///
  /// In en, this message translates to:
  /// **'YouTube Channel'**
  String get toolsOption4;

  /// No description provided for @toolsOption5.
  ///
  /// In en, this message translates to:
  /// **'Audio books'**
  String get toolsOption5;

  /// No description provided for @audioTitle.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audioTitle;

  /// No description provided for @sportNutritionTitle.
  ///
  /// In en, this message translates to:
  /// **'Sport Nutrition'**
  String get sportNutritionTitle;

  /// No description provided for @sportNutritionTableTitle.
  ///
  /// In en, this message translates to:
  /// **'Count of Grams per Intake'**
  String get sportNutritionTableTitle;

  /// No description provided for @sportNutritionHeader1.
  ///
  /// In en, this message translates to:
  /// **'TYPE'**
  String get sportNutritionHeader1;

  /// No description provided for @sportNutritionHeader2.
  ///
  /// In en, this message translates to:
  /// **'HOUR'**
  String get sportNutritionHeader2;

  /// No description provided for @sportNutritionHeader3.
  ///
  /// In en, this message translates to:
  /// **'PROT'**
  String get sportNutritionHeader3;

  /// No description provided for @sportNutritionHeader4.
  ///
  /// In en, this message translates to:
  /// **'CHO'**
  String get sportNutritionHeader4;

  /// No description provided for @sportNutritionHeader5.
  ///
  /// In en, this message translates to:
  /// **'FATS'**
  String get sportNutritionHeader5;

  /// No description provided for @subscribeTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to permium'**
  String get subscribeTitle;

  /// No description provided for @subscribeSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy unlimited access to our\npermium content'**
  String get subscribeSubTitle;

  /// No description provided for @subscribeTextButton.
  ///
  /// In en, this message translates to:
  /// **'Unlock Permium'**
  String get subscribeTextButton;

  /// No description provided for @studentTitle1.
  ///
  /// In en, this message translates to:
  /// **'Basic Measurements'**
  String get studentTitle1;

  /// No description provided for @studentTitle2.
  ///
  /// In en, this message translates to:
  /// **'Skin Folds (mm)'**
  String get studentTitle2;

  /// No description provided for @studentTitle3.
  ///
  /// In en, this message translates to:
  /// **'Muscle Girths (cm)'**
  String get studentTitle3;

  /// No description provided for @studentTitle4.
  ///
  /// In en, this message translates to:
  /// **'Summary 5 Components'**
  String get studentTitle4;

  /// No description provided for @datePartTitle1.
  ///
  /// In en, this message translates to:
  /// **'Objectives'**
  String get datePartTitle1;

  /// No description provided for @sum_of_skin_folds.
  ///
  /// In en, this message translates to:
  /// **'Sum of skin folds'**
  String get sum_of_skin_folds;

  /// No description provided for @muscle_bone_index.
  ///
  /// In en, this message translates to:
  /// **'Muscle-Bone Index'**
  String get muscle_bone_index;

  /// No description provided for @kg_of_muscle_mass.
  ///
  /// In en, this message translates to:
  /// **'kg of muscle mass'**
  String get kg_of_muscle_mass;

  /// No description provided for @kg_of_adipose_tissue.
  ///
  /// In en, this message translates to:
  /// **'kg of adipose tissue'**
  String get kg_of_adipose_tissue;

  /// No description provided for @ideal_body_mass_8_weeks.
  ///
  /// In en, this message translates to:
  /// **'Ideal body mass (8 weeks)'**
  String get ideal_body_mass_8_weeks;

  /// No description provided for @adipose_mass.
  ///
  /// In en, this message translates to:
  /// **'Adipose mass'**
  String get adipose_mass;

  /// No description provided for @muscle_mass.
  ///
  /// In en, this message translates to:
  /// **'Muscle mass'**
  String get muscle_mass;

  /// No description provided for @masa_residual.
  ///
  /// In en, this message translates to:
  /// **'Masa residual'**
  String get masa_residual;

  /// No description provided for @masa_osea.
  ///
  /// In en, this message translates to:
  /// **'Masa osea'**
  String get masa_osea;

  /// No description provided for @skin_mass.
  ///
  /// In en, this message translates to:
  /// **'Skin mass'**
  String get skin_mass;

  /// No description provided for @total_body_mass.
  ///
  /// In en, this message translates to:
  /// **'Total body mass'**
  String get total_body_mass;

  /// No description provided for @generalStart.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get generalStart;

  /// No description provided for @audioBookChapter1.
  ///
  /// In en, this message translates to:
  /// **'Chapter'**
  String get audioBookChapter1;

  /// No description provided for @forgotPasswordForgotpassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordForgotpassword;

  /// No description provided for @forgotPasswordResetcode.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email below to receive your password reset code'**
  String get forgotPasswordResetcode;

  /// No description provided for @forgotPasswordEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forgotPasswordEmail;

  /// No description provided for @myNotificationNewexercise.
  ///
  /// In en, this message translates to:
  /// **'Coach added new Exercise'**
  String get myNotificationNewexercise;

  /// No description provided for @gettingStartedSpecialized.
  ///
  /// In en, this message translates to:
  /// **'Specialized Sports and nutritional coaching'**
  String get gettingStartedSpecialized;

  /// No description provided for @gettingStartedStart.
  ///
  /// In en, this message translates to:
  /// **'LET\'S START'**
  String get gettingStartedStart;

  /// No description provided for @planListTitle.
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get planListTitle;

  /// No description provided for @equipmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get equipmentTitle;

  /// No description provided for @metricTitle.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get metricTitle;

  /// No description provided for @lowerBodyPush.
  ///
  /// In en, this message translates to:
  /// **'Lower Body Push'**
  String get lowerBodyPush;

  /// No description provided for @upperBodyPush.
  ///
  /// In en, this message translates to:
  /// **'Upper Body Push'**
  String get upperBodyPush;

  /// No description provided for @lowerBodyPull.
  ///
  /// In en, this message translates to:
  /// **'Lower Body Pull'**
  String get lowerBodyPull;

  /// No description provided for @upperBodyPull.
  ///
  /// In en, this message translates to:
  /// **'Upper Body Pull'**
  String get upperBodyPull;

  /// No description provided for @enero.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get enero;

  /// No description provided for @marzo.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get marzo;

  /// No description provided for @mayo.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get mayo;

  /// No description provided for @julio.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get julio;

  /// No description provided for @sept.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get sept;

  /// No description provided for @nov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get nov;

  /// No description provided for @macronutrients.
  ///
  /// In en, this message translates to:
  /// **'Macronutrients'**
  String get macronutrients;

  /// No description provided for @dailyIntake.
  ///
  /// In en, this message translates to:
  /// **'Daily Intake'**
  String get dailyIntake;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Perc.'**
  String get percentage;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @skinFoldsGraph.
  ///
  /// In en, this message translates to:
  /// **'Skin Folds Graph'**
  String get skinFoldsGraph;

  /// No description provided for @boneMuscleIndexGraph.
  ///
  /// In en, this message translates to:
  /// **'Bone-Muscle Index Graph'**
  String get boneMuscleIndexGraph;

  /// No description provided for @adiposeTissueGraph.
  ///
  /// In en, this message translates to:
  /// **'Adipose Tissue Graph'**
  String get adiposeTissueGraph;

  /// No description provided for @muscularTissueGraph.
  ///
  /// In en, this message translates to:
  /// **'Muscular Tissue Graph'**
  String get muscularTissueGraph;

  /// No description provided for @deepSquat.
  ///
  /// In en, this message translates to:
  /// **'Deep Squat'**
  String get deepSquat;

  /// No description provided for @fencePass.
  ///
  /// In en, this message translates to:
  /// **'Fence Pass'**
  String get fencePass;

  /// No description provided for @stringInLine.
  ///
  /// In en, this message translates to:
  /// **'String In Line'**
  String get stringInLine;

  /// No description provided for @shoulderMobility.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Mobility'**
  String get shoulderMobility;

  /// No description provided for @shoulderDiscardTest.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Discard Test'**
  String get shoulderDiscardTest;

  /// No description provided for @shoulderMobilityAgain.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Mobility'**
  String get shoulderMobilityAgain;

  /// No description provided for @activeStraightLegRaise.
  ///
  /// In en, this message translates to:
  /// **'Active Straight Leg Raise'**
  String get activeStraightLegRaise;

  /// No description provided for @trunkStabilityFlexion.
  ///
  /// In en, this message translates to:
  /// **'Bending With Trunk Stability`'**
  String get trunkStabilityFlexion;

  /// No description provided for @extensionDiscardTest.
  ///
  /// In en, this message translates to:
  /// **'Extension Discard Test'**
  String get extensionDiscardTest;

  /// No description provided for @rotaryStability.
  ///
  /// In en, this message translates to:
  /// **'Rotary Stability'**
  String get rotaryStability;

  /// No description provided for @flexionDiscardTest.
  ///
  /// In en, this message translates to:
  /// **'Flexion Discard Test'**
  String get flexionDiscardTest;

  /// No description provided for @ankleFlexibility.
  ///
  /// In en, this message translates to:
  /// **'Ankle Flexibility'**
  String get ankleFlexibility;

  /// No description provided for @noWorkOutFor.
  ///
  /// In en, this message translates to:
  /// **'No work out for'**
  String get noWorkOutFor;

  /// No description provided for @workOut.
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get workOut;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @noNotificationsRightNow.
  ///
  /// In en, this message translates to:
  /// **'No Notifications Right Now'**
  String get noNotificationsRightNow;

  /// No description provided for @noNotification.
  ///
  /// In en, this message translates to:
  /// **'No Notification'**
  String get noNotification;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
