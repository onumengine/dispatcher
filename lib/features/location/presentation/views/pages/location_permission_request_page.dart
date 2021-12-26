import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/core/theming/color_palettes.dart';
import 'package:dispatcher/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPermissionRequestPage extends StatelessWidget {
  const LocationPermissionRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width / 13.8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: SizedBox(),
                ),
                SvgPicture.asset(VECTOR_IMAGES_PATH + 'enable_location.svg'),
                Expanded(
                  flex: 117,
                  child: SizedBox(),
                ),
                Column(
                  children: [
                    Text(
                      'Enable your Location',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        height: 51 / 34,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: constraints.maxHeight / 38.96,
                    ),
                    Text(
                      'To find dispatch riders around your package\’s location, we need to know your current location',
                      style: TextStyle(
                        fontSize: 18,
                        height: 25.23 / 18,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Expanded(
                  flex: 100,
                  child: SizedBox(),
                ),
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.HOME);
                        // TODO: request location permissions on press of this button
                      },
                      icon: Icon(Icons.location_on_outlined),
                      label: Text('Use your location'),
                      style:
                          Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(
                                    MediaQuery.of(context).size.width,
                                    50,
                                  ),
                                ),
                              ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight / 56,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteNames.HOME);
                        // TODO: Implement this method in the app release version
                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //   RouteNames.HOME,
                        //   (route) => route.settings.name == RouteNames.SPLASH,
                        // );
                      },
                      child: Text(
                        'Skip for now',
                        style: TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          color: ColorPalette.PALE_TEXT_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 32,
                  child: SizedBox(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
