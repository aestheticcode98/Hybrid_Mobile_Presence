import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tester_app/features/profile/controller_profile.dart';

import '../../pages/app_routes.dart';

class PageProfile extends GetView<ControllerProfile>{
  const PageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5C94E8),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
          controller.onsiteExe();
          controller.offsiteExe();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: [
                      CachedNetworkImage(
                        height: Get.height * 0.42,
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                        imageUrl: 'http://192.168.1.13:4500/uploads/${controller.controllerGlobalUser.user.value.picture}',
                        progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                                color: Colors.white
                            )
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.rectangle
                          ),
                          child: const Icon(CupertinoIcons.person, color: Colors.white, size: 60),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.42,
                        width: Get.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  const Color(0xff1d1d1d).withOpacity(0.5)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 310),
                              child: IconButton(
                                  onPressed: ()=> Get.toNamed(Routes.set_password),
                                  icon: const Icon(
                                    CupertinoIcons.pencil,
                                    color: Colors.white,
                                    size: 40
                                  )),
                            ),
                            const Spacer(),
                            Text(
                              controller.controllerGlobalUser.user.value.idUser.toString(),
                              style: GoogleFonts.nunitoSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                                controller.controllerGlobalUser.user.value.name ?? "Username",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Text(
                                controller.controllerGlobalUser.user.value.division ?? "Role",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            const SizedBox(
                              height: 14,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: Get.height * 0.13,
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.25)
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "On-Site",
                                  style: GoogleFonts.nunitoSans(
                                      color: const Color(0xff6496E6),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Obx(() => Text(
                                  controller.onsiteData.value.toString(),
                                  style: GoogleFonts.nunitoSans(
                                      color: const Color(0xff6496E6),
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold
                                  )
                              )),
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height * 0.13,
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.25)
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Off-Site",
                                  style: GoogleFonts.nunitoSans(
                                      color: const Color(0xff6496E6),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Obx(() => Text(
                                  controller.offsiteData.value.toString(),
                                  style: GoogleFonts.nunitoSans(
                                      color: const Color(0xff6496E6),
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold
                                  )
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.25)
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: Get.height * 0.93,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black45
                                  )
                              )
                          ),
                          child: Text(
                              "Contact",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                          width: Get.height * 0.93,
                          child: Text(
                              "Email",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          width: Get.height * 0.93,
                          child: Text(
                              controller.controllerGlobalUser.user.value.email ?? "Email",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                          width: Get.height * 0.93,
                          child: Text(
                              "Role",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          width: Get.height * 0.93,
                          child: Text(
                              controller.controllerGlobalUser.user.value.role ?? "Email",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}