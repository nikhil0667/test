import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_architecture/core/locator/locator.dart';
import 'package:test_architecture/data/model/request/user_logout.dart';
import 'package:test_architecture/data/model/response/user.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';
import 'package:test_architecture/values/colors.dart';
import 'package:test_architecture/widget/custom_text.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = locator<AuthStore>().user?.data;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: ListTile(
        trailing: Container(
          width: 55,
          height: 100,
          padding: .all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColor.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: InkWell(
            onTap: () => submit(user!.id!, context),
            child: Icon(Icons.email_rounded, color: Colors.white),
          ),
        ),
        leading: CircleAvatar(
          foregroundImage: NetworkImage(
            user?.avatar ?? "https://randomuser.me/api/portraits/men/32.jpg",
          ),
        ),
        title: CustomText(
          textAlign: .start,
          label: "Welcome ${user?.fullName ?? ""}!",
          color: Colors.white,
          fontSize: 18.spMin,
        ),
        subtitle: CustomText(
          textAlign: .start,
          label: "Explore Tasks",
          color: Colors.white,
          fontSize: 18.spMin,
          fontWeight: .w700,
        ),
      ),
    );
  }

  Future<void> submit(int id, BuildContext context) async {
    await locator<AuthStore>().logout(UserLogout(userId: id), context);
  }
}
