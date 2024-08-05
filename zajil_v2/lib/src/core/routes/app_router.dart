import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/src/features/authntication/logic/authntication_cubit.dart';
import 'package:zajil_v2/src/features/authntication/presentation/pages/login_with_phone.dart';
import 'package:zajil_v2/src/features/ask_order/logic/call_cubit/call_cubit_cubit.dart';
import 'package:zajil_v2/src/features/ask_order/logic/chat_cubit/chat_cubit_cubit.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/pages/ask_order.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/pages/audio_call_screen.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/pages/chat_screen.dart';
import 'package:zajil_v2/src/features/contact_us/presentation/pages/contact_us.dart';
import 'package:zajil_v2/src/features/layout/layout.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/menu/presentation/pages/view_all_screen.dart';

class Routes {
  static const String login = '/login';
  static const String menuSearch = '/MenuSearch';

  static const String askOrder = '/askOrder';
  static const String chat = '/Chat';
  static const String menu = '/Menu';
  static const String layout = '/Layout';
  static const String viewAll = '/ViewAll';

  static const String audioCall = '/audioCall';
  static const String orders = '/orders';
  static const String contactUs = '/ContactUs';
}

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.askOrder:
        return MaterialPageRoute(
          builder: (_) => const AskOrderScreen(),
        );
      case Routes.audioCall:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CallCubit()..init(),
            child: const AudioCallScreen(),
          ),
        );
      case Routes.viewAll:
        return MaterialPageRoute(
          builder: (_) => ViewAllScreen(
            products: arguments as List<Product>,
          ),
        );
      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChatCubit()..init(),
            child: const ChatScreen(),
          ),
        );

      case Routes.contactUs:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      case Routes.layout:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthnticationCubit(),
            child: const LoginPhone(),
          ),
        );

      default:
        return null;
    }
  }
}
