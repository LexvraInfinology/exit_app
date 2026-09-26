import 'package:exit_app/controller/add_credits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class AddCreditsScreen extends StatelessWidget {
  const AddCreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCreditsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                // ---- Header ----
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: const EdgeInsets.all(1.4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.white54,
                                Colors.white12,
                              ],
                              stops: [0.0, 0.45, 1.0],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF1A1A1A),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        'Add Credits',
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---- Credits card ----
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFF111111),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF292929)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'YOUR CREDITS',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 11,
                                      letterSpacing: 0.5,
                                      color: const Color(0xFF858585),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: controller.onViewUsage,
                                    child: Row(
                                      children: [
                                        Text(
                                          'View usage',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: const Color(0xFF9A9A9A),
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        const Icon(Icons.arrow_forward_rounded,
                                            size: 14,
                                            color: Color(0xFF9A9A9A)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${controller.creditsLeft} credits left',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 14),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: LinearProgressIndicator(
                                  value:
                                  controller.creditsProgress.clamp(0.0, 1.0),
                                  minHeight: 6,
                                  backgroundColor: const Color(0xFF262626),
                                  valueColor:
                                  const AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${controller.usedCredits} of ${controller.totalCredits} used',
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  color: const Color(0xFF777777),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 26),

                        Text(
                          'CHOOSE A CREDIT PACK',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: const Color(0xFF858585),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 14),

                        ...List.generate(controller.packs.length, (index) {
                          final pack = controller.packs[index];
                          final isSelected =
                              index == controller.selectedPackIndex;

                          return GestureDetector(
                            onTap: () => controller.selectPack(index),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 14),
                              padding:  EdgeInsets.all(isSelected ? 1.4 : 1), // border thickness
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: isSelected
                                    ? const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white54,
                                    Colors.white,
                                  ],
                                )
                                    : null,
                                color: isSelected ? null : const Color(0xFF292929), // plain border color when not selected
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF111111),
                                  borderRadius: BorderRadius.circular(15), // slightly smaller so the gradient ring shows
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${pack.credits} Credits',
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              if (pack.isPopular) ...[
                                                const SizedBox(width: 8),
                                                Container(
                                                  padding:
                                                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: Text(
                                                    'POPULAR',
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 9,
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.black,
                                                      letterSpacing: 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            pack.subtitle,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              height: 1.4,
                                              color: const Color(0xFF858585),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          pack.price,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 14),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSelected ? Colors.white : const Color(0xFF444444),
                                              width: 1.4,
                                            ),
                                          ),
                                          child: isSelected
                                              ? Center(
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                // ---- Bottom pay button ----
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: controller.isProcessingPayment
                          ? null
                          :() {
                        controller.proceedToPay();
                        SwitchPlanBottomSheet.show(
                          context,
                          planName: 'Scale Plan',
                          benefits: const [
                            'Basic fundraising tools for early ideation',
                            'Up to 5 investor matches per month',
                            'Startup discovery and recommendations',
                            'Priority support',
                          ],
                          newMonthlyPrice: '₹3,999 / mo',
                          amountDueToday: '₹1,000',
                          nextBillingDate: '12 Sep 2026',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                        elevation: 0,
                      ),
                      child: controller.isProcessingPayment
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      )
                          : Text(
                        'Proceed to Pay ${controller.selectedPack.price}',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




class SwitchPlanBottomSheet extends StatelessWidget {
  final String planName;
  final List<String> benefits;
  final String newMonthlyPrice; // e.g. "₹3,999 / mo"
  final String amountDueToday; // e.g. "₹1,000"
  final String nextBillingDate; // e.g. "12 Sep 2026"

  const SwitchPlanBottomSheet({
    super.key,
    required this.planName,
    required this.benefits,
    required this.newMonthlyPrice,
    required this.amountDueToday,
    required this.nextBillingDate,
  });

  static Future<void> show(
      BuildContext context, {
        required String planName,
        required List<String> benefits,
        required String newMonthlyPrice,
        required String amountDueToday,
        required String nextBillingDate,
      }) {
    if (!Get.isRegistered<AddCreditsController>()) {
      Get.put(AddCreditsController());
    }

    return Get.bottomSheet(
      SwitchPlanBottomSheet(
        planName: planName,
        benefits: benefits,
        newMonthlyPrice: newMonthlyPrice,
        amountDueToday: amountDueToday,
        nextBillingDate: nextBillingDate,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCreditsController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          decoration: const BoxDecoration(
            color: Color(0xFF111111),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // drag handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF444444),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              Text(
                'Switch to $planName?',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'You are changing your subscription',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: const Color(0xFF858585),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'What you\'ll get with $planName',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              ...benefits.map(
                    (benefit) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        margin: const EdgeInsets.only(top: 1),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF3B9EFF),
                        ),
                        child: const Icon(Icons.check,
                            size: 12, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          benefit,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: const Color(0xFFD8D8D8),
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Billing Summary',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF292929)),
                ),
                child: Column(
                  children: [
                    _BillingRow(
                        label: 'New monthly price', value: newMonthlyPrice),
                    const SizedBox(height: 10),
                    _BillingRow(
                        label: 'Amount due today', value: amountDueToday),
                    const SizedBox(height: 10),
                    _BillingRow(
                        label: 'Next billing date', value: nextBillingDate),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: Text(
                  'Your plan will be updated immediately after confirmation.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 10.5,
                    color: const Color(0xFF666666),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: controller.isChangingPlan
                      ? null
                      : () => controller.changePlan(
                    newPlanName: planName,
                    newMonthlyPrice: newMonthlyPrice,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: controller.isChangingPlan
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  )
                      : Text(
                    'Change Plan',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BillingRow extends StatelessWidget {
  final String label;
  final String value;

  const _BillingRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: const Color(0xFF9A9A9A),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

