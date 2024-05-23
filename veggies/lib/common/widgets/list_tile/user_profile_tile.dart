import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/v_circular_image.dart';

class VUserProfileTile extends StatelessWidget {
  const VUserProfileTile({
    super.key, required this.onPressed,
  });
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller  = UserController.instance;
    return ListTile(
      leading: VCircularImage(
        image: VImages.user,
        width: 50,
        height: 50,
        backgroundColor: Colors.green.shade300,
        padding: 3,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: VColors.light),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodySmall!.apply(color: VColors.light),
      ),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit_copy),),
    );
  }
}
