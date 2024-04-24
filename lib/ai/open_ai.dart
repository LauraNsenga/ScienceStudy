import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/foundation.dart';

// Today is 4 April 2024 
class OpenAIService {
  static final OpenAIService _instance = OpenAIService._internal();

  factory OpenAIService() => _instance;

  final requestMessages = <OpenAIChatCompletionChoiceMessageModel>[];

  OpenAIService._internal() {
    OpenAI.apiKey = const String.fromEnvironment('api_key');
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
            "You will be provided with Food Menu questions. Classify each query into days of the week and food station. Respond to users in normal words not json.\n"
                "\n"
                "Monday:Kitchen Table:\n"
                "- Mashed Potatoes\n"
                "- Chicken Fried Streak\n"
                "- Green Beans\n"
                "- Dinner Roll\n"
                "\n"
                "Pasta Toss:\n"
                "- Mac and Cheese Day!\n"
                "\n"
                "Nourish:\n"
                "- Hummus\n"
                "- Pita Bread\n"
                "\n"
                "Five Spice:\n"
                "- Lo Mein\n"
                "- Spicy Beef\n"
                "\n"
                "Fresh:\n"
                "- Cheesburger Wrap\n"
                "\n"
                "Flame:\n"
                "- Cheesburger\n"
                "- French Fries\n"
                "\n"
                "Tuesday:Kitchen Table:\n"
                "- Maple Chicken Breast\n"
                "- Green Beans\n"
                "- Dinner Roll\n"
                "\n"
                "Nourish:\n"
                "- Apricot Glazed Chicken\n"
                "- White Rice\n"
                "\n"
                "Five Spice:\n"
                "- Singapore Street Noodles\n"
                "- BBQ Pork\n"
                "\n"
                "Pasta Toss:\n"
                "- Beef Ravioli with Marinara Sauce\n"
                "\n"
                "Fresh:\n"
                "- Citrus Lime Wrap\n"
                "\n"
                "Flame:\n"
                "- Fried Shrimp\n"
                "- Potato Wedges\n"
                "\n"
                "Wednesday:Kitchen Table:\n"
                "- Breakfast for Dinner!\n"
                "\n"
                "Nourish:\n"
                "- Plantains\n"
                "- White Rice\n"
                "- Beef\n"
                "\n"
                "Pasta Toss:\n"
                "- Spaghetti Bolognese\n"
                "\n"
                "Five Spice:\n"
                "- Orange Chicken\n"
                "- White Rice\n"
                "- PotStickers\n"
                "- Stir Fry Veggies\n"
                "\n"
                "Fresh:\n"
                "- Chicken Ceaser Wrap\n"
                "\n"
                "Flame:\n"
                "- Closed\n"
                "\n"
                "Thursday:Kitchen Table:\n"
                "- Honey Sriracha Chicken Tenders\n"
                "- Yellow Rice\n"
                "- Dinner Roll\n"
                "\n"
                "Nourish:\n"
                "- Beef Barbacoa Bowl\n"
                "\n"
                "Five Spice:\n"
                "- Sweet and Spicy Shrimp\n"
                "- White Rice\n"
                "\n"
                "Fresh:\n"
                "- Blackened Chicken Wrap/ Salad\n"
                "\n"
                "Pasta Toss:\n"
                "- Closed\n"
                "\n"
                "Flame:\n"
                "- Meatball Sub\n"
                "- French Fries\n"
                "\n"
                "Friday:Kitchen Table:\n"
                "- Fish Tacos\n"
                "\n"
                "Nourish:\n"
                "- Sweet Potato Flatbread\n"
                "\n"
                "Pasta Toss:\n"
                "- Pepperoni Pene Pasta\n"
                "\n"
                "Five Spice:\n"
                "- Sweet and Spicy Calamari\n"
                "\n"
                "Fresh:\n"
                "- Buffalo Chicken Wrap\n"
                "\n"
                "Flame:\n"
                "- BBQ Chicken Sandwich\n"
                "- Curly Fries\n"
                "\n"
                "Saturday:Kitchen Table:\n"
                "- Chicken Brocolli Pasta Bake\n"
                "\n"
                "Nourish:\n"
                "- Green Goddess Bowl\n"
                "\n"
                "Five Spice:\n"
                "- Cleopatra Chicken\n"
                "- White Rice\n"
                "\n"
                "Fresh:\n"
                "- Buffalo Chicken Wrap\n"
                "\n"
                "Flame:\n"
                "- BBQ Chicken Sandwich\n"
                "- Curly Friens\n"
                "\n"
                "Sunday:Kitchen Table:\n"
                "- Beef Enchilada Casserole\n"
                "\n"
                "Nourish:\n"
                "- Thai Basil Beef Bowl\n"
                "\n"
                "Five Spice:\n"
                "- Korean BBQ\n"
                "- White Rice\n"
                "- Kimchi\n"
                "\n"
                "Fresh:\n"
                "- Closed\n"
                "\n"
                "Flame:\n"
                "- Chicken Tenders\n"
                "- French Fries\n"
        )
      ],
      role: OpenAIChatMessageRole.system,
    );

    requestMessages.add(systemMessage);
  }

  Future<String?> chat(String userMessage) async {
    _addMessage(isFromUser: true, message: userMessage);

    OpenAIChatCompletionModel chatCompletion =
    await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );
    final text = chatCompletion.choices.last.message.content?.first.text;

    if (text == null) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    } else {
      _addMessage(isFromUser: false, message: text);

      if (kDebugMode) {
        print('${chatCompletion.usage.promptTokens}\t$text');
      }
    }

    return text;
  }

  void _addMessage({required String message, required bool isFromUser}) {
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(message),
      ],
      role: isFromUser
          ? OpenAIChatMessageRole.user
          : OpenAIChatMessageRole.assistant,
    );
    requestMessages.add(userMessage);
  }
}
