import 'package:exit_app/common_widgets/filter_widget.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../../../controller/investor_dashboard_controller.dart';

class FounderDiscoverScreen extends StatelessWidget {
  List investors = [
    {
      'name': 'NovaNest',
      'type': 'Fintech',
      'location': 'Bengaluru, India',
      'raising': '₹25L',
      'timeLine': '1-2 Months',
      'tags': ['SaaS', 'FinTech', 'B2B'],
      'logo': 'N',
    },
    {
      'name': 'CloudXcel',
      'type': 'Venture Capital',
      'location': 'Mumbai, India',
      'raising': '₹50L',
      'timeLine': '2-4 Months',
      'tags': ['SaaS', 'AI / ML'],
      'logo': 'E',
    },
    {
      'name': 'Artha Ventures',
      'type': 'VC Fund',
      'location': 'Delhi, India',
      'raising': '₹25L – ₹1.5Cr',
      'timeLine': '1-2 Months',
      'tags': ['FinTech', 'Consumer'],
      'logo': 'A',
    },
    {
      'name': 'Momentum Capital',
      'type': 'Venture Capital',
      'location': 'Bengaluru, India',
      'raising': '₹1Cr',
      'timeLine': '2-4 Months',
      'tags': ['SaaS', 'Deep Tech'],
      'logo': 'M',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvestorDashboardController>(
        builder: (discoverFounderController) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        body:  discoverFounderController.isLoading.value
            ? const Center(
            child: CupertinoActivityIndicator(
              radius: 15,
              color: Colors.white,
            ))
            :SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(children: [  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          discoverFounderController.selectedIndex.value = 0;
                          // Get.back();
                        },
                        child: Image.asset(
                          AppImages.backIcon,
                          width: 42,
                          height: 42,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Discover Founders',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFF292929),
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                'Search by investor name, fund, or industry',
                                hintStyle: TextStyle(
                                  color: Color(0xFF9A9A9A),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),],),
                ),
               Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       SizedBox(
                         height: 40,
                         child: FilterHandleWidget(
                           items: discoverFounderController.filterListItems,
                           backgroundColor: Colors.black,
                           showArrow: true,
                           selectedFor: discoverFounderController.selectedFor,
                           onFilterSelected: discoverFounderController.onFilterSelected,),
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: const EdgeInsets.all(24.0),
                         child: Column(children: [
                            Row(
                             children: [
                               Text(
                                 '${discoverFounderController.founderList.length} founders found',
                                 style: const TextStyle(
                                   color: AppColors.darkGreyColor,
                                   fontSize: 12,
                                 ),
                               ),
                               const Spacer(),
                               const Text(
                                 'Sort by:',
                                 style: TextStyle(
                                   color: AppColors.darkGreyColor,
                                   fontSize: 12,
                                 ),
                               ),
                               const SizedBox(width: 5),
                               const Text(
                                 'Relevance',
                                 style: TextStyle(
                                   color: AppColors.whiteColor,
                                   fontSize: 12,
                                 ),
                               ),
                               const Icon(
                                 Icons.keyboard_arrow_down,
                                 color: AppColors.darkGreyColor,
                                 size: 17,
                               ),
                             ],
                           ),
                           const SizedBox(
                             height: 20,
                           ),
                           ListView.builder(
                             shrinkWrap: true,
                             physics: const NeverScrollableScrollPhysics(),
                             itemCount: discoverFounderController.founderList.length,
                             itemBuilder: (context, index) {
                               final founder = discoverFounderController.founderList[index];
                               return GestureDetector(
                                 onTap: () {
                                   discoverFounderController.clickFounderDetails(founder);
                                 },
                                 child: Container(
                                   margin: const EdgeInsets.symmetric(vertical: 10),
                                   padding: const EdgeInsets.all(24),
                                   decoration: BoxDecoration(
                                     color: AppColors.blackColor,
                                     borderRadius: BorderRadius.circular(11),
                                     border: Border.all(
                                         color: const Color(0xFF292929), width: 1),
                                   ),
                                   child: InvestorWidget(
                                       name: founder.firstName,
                                       type:  '',
                                       location: founder.currentLocation,
                                       investment: founder.preferredInvestment,
                                       stage: founder.preferredStage,
                                       logo:  'M',
                                       controller: discoverFounderController,
                                       context: context),
                                 ),
                               );
                             },
                           )
                         ],),
                       )
                     ],
                   ),
                 ),
               )
              ],
            )),
      );
    });
  }

  Widget InvestorWidget(
      {required String name,
      required String type,
      required String location,
      required String investment,
      required String stage,
      required String logo,
      InvestorDashboardController? controller,
      required BuildContext context}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: const Color(0xFF292929), width: 1),
              ),
              child: Center(
                child: Text(
                  logo,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 11,
                        height: 11,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF9654FF),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 8,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$type · $location',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.bookmark_border,
                color: Color(0xFF8A8A8A),
                size: 22,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Raising',
                    style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '₹25L',
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TimeLine',
                    style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '1-3 Months',
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                              color: const Color(0xFF292929), width: 1),
                        ),
                        child: const Text(
                          'Fintech',
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
