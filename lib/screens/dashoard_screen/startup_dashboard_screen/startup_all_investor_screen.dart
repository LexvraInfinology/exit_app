import 'package:exit_app/controller/startUp_dashboard_controller.dart';
import 'package:exit_app/models/marketplace_Industries_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../founder_dashboard/widgets/filtter_button_widget.dart';

class StartUpAllInvestorScreen extends StatelessWidget{
  List investors = [
    {
      'name': 'Northstar Ventures',
      'type': 'VC Fund',
      'location': 'Bengaluru, India',
      'investment': '₹25L – ₹2Cr',
      'stage': 'Seed – Series A',
      'tags': ['SaaS', 'FinTech', 'B2B'],
      'logo': 'N',
    },
    {
      'name': 'Elevate Capital',
      'type': 'Venture Capital',
      'location': 'Mumbai, India',
      'investment': '₹50L – ₹3Cr',
      'stage': 'Seed – Series B',
      'tags': ['SaaS', 'AI / ML'],
      'logo': 'E',
    },
    {
      'name': 'Artha Ventures',
      'type': 'VC Fund',
      'location': 'Delhi, India',
      'investment': '₹25L – ₹1.5Cr',
      'stage': 'Pre-Seed – Series A',
      'tags': ['FinTech', 'Consumer'],
      'logo': 'A',
    },
    {
      'name': 'Momentum Capital',
      'type': 'Venture Capital',
      'location': 'Bengaluru, India',
      'investment': '₹1Cr – ₹5Cr',
      'stage': 'Series A – Series C',
      'tags': ['SaaS', 'Deep Tech'],
      'logo': 'M',
    },
  ];

  @override
  Widget build(BuildContext context) {
   return GetBuilder<StartUpDashBoardController>(builder: (controller){
     return Scaffold(
       backgroundColor: AppColors.blackColor,
       body: SafeArea(
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(24.0),
               child: Column(
                 children: [
                   Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           controller.selectedIndex.value = 0;
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
                           'Investors',
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                       ),
                       const Icon(
                         Icons.bookmark_border,
                         color: Colors.white,
                         size: 23,
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
                     child: Row(
                       children: [
                         const SizedBox(width: 20),
                         const Icon(
                           Icons.search,
                           color: Colors.white,
                           size: 20,
                         ),
                         const SizedBox(width: 20),
                         Expanded(
                           child: TextField(
                             style: const TextStyle(
                               color: Colors.white,
                               fontSize: 14,
                             ),
                             cursorColor: Colors.white,
                             decoration: const InputDecoration(
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
                         const SizedBox(width: 12),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 60,
                     child: ListView(
                       scrollDirection: Axis.horizontal,
                       padding: const EdgeInsets.only(
                         right: 24,
                         top: 20,
                       ),
                       children: [
                         FilterButtonWidget(
                           context: context,
                           text: 'Stage',
                           showArrow: true,
                           options: [
                             MarketplaceIndustry(id: "1",name: "Pre-Seed"),
                             MarketplaceIndustry(id: "2",name: "Seed"),
                             MarketplaceIndustry(id: "3",name: "Series A"),
                             MarketplaceIndustry(id: "4",name: "Series B")
                           ],
                         ),
                         const SizedBox(width: 8),
                         FilterButtonWidget(
                           context: context,
                           text: 'Sector',
                           showArrow: true,
                           options: [
                             MarketplaceIndustry(id: "1",name: "SaaS"),
                             MarketplaceIndustry(id: "2",name: "FinTech"),
                             MarketplaceIndustry(id: "3",name: "AI / ML"),
                             MarketplaceIndustry(id: "4",name: "HealthTech")
                           ],
                         ),
                         const SizedBox(width: 8),
                         FilterButtonWidget(
                           context: context,
                           text: 'Under ₹25L',
                           showArrow: true,
                           options: [
                             MarketplaceIndustry(id: "1",name: "Under ₹25L"),
                             MarketplaceIndustry(id: "2",name: "₹25L–₹50L"),
                             MarketplaceIndustry(id: "3",name: "₹50L–₹1Cr"),
                             MarketplaceIndustry(id: "4",name: "₹1Cr–₹5Cr")
                           ],
                         ),
                         const SizedBox(width: 8),
                         FilterButtonWidget(
                           context: context,
                           text: 'India',
                           showArrow: true,
                           options: [
                             MarketplaceIndustry(id: "1",name: "India"),
                             MarketplaceIndustry(id: "2",name: "Delhi NCR"),
                             MarketplaceIndustry(id: "3",name: "Mumbai"),
                             MarketplaceIndustry(id: "4",name: "Bengaluru")
                           ],
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   const Row(
                     children: [
                       Text(
                         '132 investors found',
                         style: TextStyle(
                           color: AppColors.darkGreyColor,
                           fontSize: 12,
                         ),
                       ),
                       Spacer(),
                       Text(
                         'Sort by:',
                         style: TextStyle(
                           color: AppColors.darkGreyColor,
                           fontSize: 12,
                         ),
                       ),
                       SizedBox(width: 5),
                       Text(
                         'Relevance',
                         style: TextStyle(
                           color: AppColors.whiteColor,
                           fontSize: 12,
                         ),
                       ),
                       Icon(
                         Icons.keyboard_arrow_down,
                         color: AppColors.darkGreyColor,
                         size: 17,
                       ),
                     ],
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   SizedBox(
                     height: 570,
                     child: ListView.builder(
                       itemCount: investors.length,
                       itemBuilder: (context, index) {
                         final investor = investors[index];
                         return GestureDetector(
                           onTap: (){
                             controller?.InvestorDetails();
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
                                 name: investor['name']?.toString() ?? '',
                                 type: investor['type']?.toString() ?? '',
                                 location: investor['location']?.toString() ?? '',
                                 investment:
                                 investor['investment']?.toString() ?? '',
                                 stage: investor['stage']?.toString() ?? '',
                                 logo: investor['logo']?.toString() ?? '',
                                 controller: controller),
                           ),
                         );
                       },
                     ),
                   )
                 ],
               ),
             ),
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
        StartUpDashBoardController? controller}) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Range',
                  style: GoogleFonts.montserrat(
                    color: AppColors.darkGreyColor,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '₹25L – ₹2Cr',
                  style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stage',
                  style: GoogleFonts.montserrat(
                    color: AppColors.darkGreyColor,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'Seed – Series A',
                  style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ],
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
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Profile',
                    style: GoogleFonts.montserrat(
                      color: AppColors.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.whiteColor,
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