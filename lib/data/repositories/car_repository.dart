import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../models/app_notification.dart';
import '../models/brand.dart';
import '../models/car.dart';
import '../models/onboarding_page_data.dart';
import '../models/payment_card.dart';
import '../models/setting_option.dart';
import '../models/transaction_item.dart';
import '../models/user_profile.dart';

class CarRepository {
  const CarRepository._();

  static const UserProfile profile = UserProfile(
    name: 'Anas Hussain',
    email: 'engineer.anas47@gmail.com',
    subtitle: 'BMW 3 Series owner',
    avatar: AppAssets.avatar,
    balance: '\$70,564',
  );

  static final List<OnboardingPageData> onboarding = [
    OnboardingPageData(
      title: 'Find your\nperfect ride',
      subtitle:
          'Hundreds of verified premium cars, ek hi jagah - filter karo aur apni pasand chuno.',
      image: AppAssets.onboardingOne,
    ),
    const OnboardingPageData(
      title: 'Compare specs\nside by side',
      subtitle:
          'Capacity, speed aur engine output - har detail transparent, bina kisi guess-work ke.',
      image: AppAssets.onboardingTwo,
    ),
    const OnboardingPageData(
      title: 'Own it in a\nfew taps',
      subtitle:
          'Secure wallet, saved cards aur instant checkout ke saath apni dream car ghar le jao.',
      image: AppAssets.onboardingThree,
    ),
  ];

  static const List<Brand> brands = [
    Brand(id: 'cadillac', name: 'Cadillac', logo: AppAssets.cadillac),
    Brand(id: 'tesla', name: 'Tesla', logo: AppAssets.tesla),
    Brand(id: 'bmw', name: 'BMW', logo: AppAssets.bmw),
    Brand(id: 'mazda', name: 'Mazda', logo: AppAssets.mazda),
  ];

  static const List<Car> cars = [
    Car(
      id: 'tesla-model-3',
      name: 'Tesla Model 3',
      brand: 'Tesla',
      image: AppAssets.teslaModel3,
      price: '\$45,590',
      rating: 4.5,
      reviews: 230,
      seats: '6 seats',
      topSpeed: '200 KM/H',
      power: '500 HP',
      description:
          'Tesla Model 3 is an all-electric compact sedan produced by Tesla, Inc. '
          'It is designed to deliver long range, class leading safety and an '
          'uncompromised driving experience for everyday journeys.',
    ),
    Car(
      id: 'tesla-model-x',
      name: 'Tesla Model X',
      brand: 'Tesla',
      image: AppAssets.teslaModelX,
      price: '\$25,680',
      rating: 4.8,
      reviews: 208,
      seats: '7 seats',
      topSpeed: '250 KM/H',
      power: '670 HP',
      description:
          'Tesla Model X ek premium electric SUV hai jo falcon-wing doors, '
          'spacious cabin aur blistering acceleration ke saath aati hai.',
    ),
    Car(
      id: 'bmw-3-series',
      name: 'BMW 3 Series',
      brand: 'BMW',
      image: AppAssets.bmw3Series,
      price: '\$34,130',
      rating: 4.5,
      reviews: 194,
      seats: '5 seats',
      topSpeed: '240 KM/H',
      power: '382 HP',
      description:
          'The BMW 3 Series blends sharp handling with an elegant interior, '
          'making it the benchmark sports sedan for over four decades.',
    ),
    Car(
      id: 'mercedes-e-class',
      name: 'Mercedes E-Class',
      brand: 'Mercedes',
      image: AppAssets.mercedesEClass,
      price: '\$50,525',
      rating: 4.7,
      reviews: 312,
      seats: '5 seats',
      topSpeed: '250 KM/H',
      power: '429 HP',
      description:
          'Mercedes-Benz E-Class luxury, technology aur comfort ka perfect '
          'balance deti hai - long drives ke liye ideal.',
    ),
    Car(
      id: 'audi-a6',
      name: 'Audi A6 Quattro',
      brand: 'Audi',
      image: AppAssets.audiA6,
      price: '\$41,900',
      rating: 4.6,
      reviews: 176,
      seats: '5 seats',
      topSpeed: '250 KM/H',
      power: '335 HP',
      description:
          'Audi A6 quattro all-wheel drive grip, refined cabin aur '
          'cutting edge infotainment offer karti hai.',
    ),
    Car(
      id: 'chevrolet-silverado',
      name: 'Chevrolet Silverado',
      brand: 'Chevrolet',
      image: AppAssets.chevroletSilverado,
      price: '\$45,680',
      rating: 4.4,
      reviews: 148,
      seats: '6 seats',
      topSpeed: '180 KM/H',
      power: '420 HP',
      description:
          'Silverado ek full-size pickup hai jo heavy-duty towing aur '
          'day-to-day comfort dono me excel karti hai.',
    ),
  ];

  static const List<PaymentCard> paymentCards = [
    PaymentCard(
      id: 'visa-6240',
      label: 'Current Balance',
      balance: '\$3,370,70',
      last4: '6240',
      expiry: '09/24',
      cvc: '682',
      network: 'VISA',
    ),
    PaymentCard(
      id: 'master-8841',
      label: 'Current Balance',
      balance: '\$1,204,15',
      last4: '8841',
      expiry: '11/26',
      cvc: '310',
      network: 'Mastercard',
    ),
  ];

  static const List<TransactionItem> transactions = [
    TransactionItem(
      id: 't1',
      title: 'Mercedes-Benz E-Class',
      date: '23 May 2023',
      amount: '\$50,525',
      method: 'Master card',
    ),
    TransactionItem(
      id: 't2',
      title: 'Chevrolet Silverado',
      date: '11 May 2023',
      amount: '\$45,680',
      method: 'Visa card',
    ),
    TransactionItem(
      id: 't3',
      title: 'BMW 3 Series',
      date: '02 May 2023',
      amount: '\$34,130',
      method: 'Visa card',
    ),
  ];

  static const List<AppNotification> notifications = [
    AppNotification(
      id: 'n1',
      date: 'May 20',
      time: '8:00 AM',
      message: 'A new model car added to our company.',
    ),
    AppNotification(
      id: 'n2',
      date: 'May 15',
      time: '8:00 AM',
      message: 'A promo offer is running for BMW series.',
    ),
    AppNotification(
      id: 'n3',
      date: 'May 10',
      time: '8:00 AM',
      message: 'You will get 30% discount of the first purchase.',
    ),
    AppNotification(
      id: 'n4',
      date: 'May 08',
      time: '9:30 AM',
      message: 'Your saved car Tesla Model X price dropped.',
    ),
    AppNotification(
      id: 'n5',
      date: 'May 02',
      time: '11:15 AM',
      message: 'Wallet top-up successful - happy shopping!',
    ),
  ];

  static const List<SettingOption> settings = [
    SettingOption(
      id: 'reminders',
      title: AppStrings.appointmentReminders,
      icon: Icons.event_note_rounded,
    ),
    SettingOption(
      id: 'location',
      title: AppStrings.preferredLocation,
      icon: Icons.place_outlined,
    ),
    SettingOption(id: 'faqs', title: AppStrings.faqs, icon: Icons.help_outline),
    SettingOption(
      id: 'support',
      title: AppStrings.contactSupport,
      icon: Icons.headset_mic_outlined,
    ),
    SettingOption(
      id: 'reviews',
      title: AppStrings.ratingsReviews,
      icon: Icons.star_border_rounded,
    ),
    SettingOption(
      id: 'incentives',
      title: AppStrings.incentives,
      icon: Icons.local_offer_outlined,
      isToggle: true,
    ),
    SettingOption(
      id: 'notification',
      title: AppStrings.notification,
      icon: Icons.notifications_none_rounded,
      isToggle: true,
    ),
  ];

  static Car byId(String id) => cars.firstWhere((car) => car.id == id);

  static List<Car> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return cars;
    return cars
        .where((c) =>
            c.name.toLowerCase().contains(q) || c.brand.toLowerCase().contains(q))
        .toList(growable: false);
  }
}
