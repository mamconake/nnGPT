import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(receiveTimeout: 20000),
  );
  Future<String> getResponse(String message) async {
    try {
      final request =
          CompleteText(prompt: message, model: kTranslateModelV3);
      final response = await _openAI.onCompleteText(request: request);
      if (response != null) {
        return response.choices[0].text.trim();
      }
      return 'Something went wrong';
    } catch (e) {
      return 'Worry less we got you';
    }
  }

  void dispose() {
    _openAI.close();
  }
}
