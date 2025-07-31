import 'package:flutter/material.dart';
import 'package:message_app_training/constans/my-colors.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  final Map<String, String> _keypadLetters = {
    '2': 'ABC',
    '3': 'DEF',
    '4': 'GHI',
    '5': 'JKL',
    '6': 'MNO',
    '7': 'PQRS',
    '8': 'TUV',
    '9': 'WXYZ',
  };

  void handleDigitInput(int digit) {
    for (int i = 0; i < 5; i++) {
      if (controllers[i].text.isEmpty) {
        controllers[i].text = digit.toString();
        if (i < 4) {
          FocusScope.of(context).requestFocus(focusNodes[i + 1]);
        } else {
          FocusScope.of(context).unfocus();
        }
        setState(() {});
        break;
      }
    }
  }

  void handleBackspace() {
    for (int i = 4; i >= 0; i--) {
      if (controllers[i].text.isNotEmpty) {
        controllers[i].clear();
        if (i > 0) {
          FocusScope.of(context).requestFocus(focusNodes[i - 1]);
        }
        setState(() {});
        break;
      }
    }
  }

  bool isOTPComplete() {
    return controllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.deepTeal,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Confirm OTP code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                children: [
                  // Phone number
                  Container(
                    width: 200, 
                    height: 50, 
                    child: Text(
                      '081234567891',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C3C3C),
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  Container(
                    width: 334,
                    height: 36,
                    alignment:
                        Alignment.center, 
                    child: Text(
                      'Enter the 5-digit OTP code that has been sent from SMSto complete your account registration',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        height: 1.5, 
                        letterSpacing: 0.0,
                        color: Color(
                          0xFF3C3C3C,
                        ), 
                      ),
                    ),
                  ),

                  SizedBox(height: 48),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        5,
                        (index) => Container(
                          width: 60,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: controllers[index].text.isEmpty
                                  ? Colors.transparent
                                  : Color(0xFF4A9B8A),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: controllers[index].text.isEmpty
                                ? Color(0xFFF0F0F0)
                                : Colors.white,
                          ),
                          child: TextField(
                            controller: controllers[index],
                            focusNode: focusNodes[index],
                            keyboardType:
                                TextInputType.none,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              height: 36 / 40,
                              color: Color(0xFF3C3C3C),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                              contentPadding: EdgeInsets.zero,
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 4) {
                                FocusScope.of(
                                  context,
                                ).requestFocus(focusNodes[index + 1]);
                              }
                              setState(() {}); 
                            },
                            onTap: () {
                              controllers[index].selection =
                                  TextSelection.fromPosition(
                                    TextPosition(
                                      offset: controllers[index].text.length,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Haven\'t got the confirmation code yet? ',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle resend
                        },
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF0000FF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Confirm button
                  Container(
                    width: 335,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: isOTPComplete()
                          ? () {
                              // Handle confirm
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF106967),
                        disabledBackgroundColor: Color(0xFF4FBC9C),
                        padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 20 / 14, // line-height / font-size
                          color: Color(0xFFFEFEFE),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // This is the space between the confirm button and the custom keyboard
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SizedBox(height: 86),
          // Custom keyboard
          Container(
            width: double.infinity,
            height: 255,
            color: Color(0xFFD1D3D9),
            padding: EdgeInsets.only(top: 6, left: 0, right: 0),
            child: Column(
              children: [
                _buildKeyboardRow(['1', '2', '3']),
                _buildKeyboardRow(['4', '5', '6']),
                _buildKeyboardRow(['7', '8', '9']),
                _buildKeyboardRow(['', '0', 'backspace']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Container(
      height: 53,
      width: 415,
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: keys.map((key) {
          if (key == 'backspace') {
            return _buildBackspaceButton();
          } else if (key == '') {
            return Expanded(child: SizedBox());
          } else {
            return _buildKeypadButton(key, _keypadLetters[key] ?? '');
          }
        }).toList(),
      ),
    );
  }

  Widget _buildKeypadButton(String number, String letters) {
    return Expanded(
      child: GestureDetector(
        onTap: () => handleDigitInput(int.parse(number)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Expanded(
      child: GestureDetector(
        onTap: handleBackspace,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.5),
          decoration: BoxDecoration(
            color: Color(0xFFD1D3D9),
            borderRadius: BorderRadius.circular(4.6),
          ),
          child: Icon(Icons.backspace_outlined, size: 24, color: Colors.black),
        ),
      ),
    );
  }
}
