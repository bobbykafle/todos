import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/authentication/auth_provider.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
import 'package:to_do_app/widgets/app_text.dart';

class SignOutTile extends StatelessWidget {
  const SignOutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.logout,
        color: ThemeColor.drawerIcon(context),
      ),
      title: Text(
        'LogOut',
        style: TextStyle(
          color: ThemeColor.drawerText(context),
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
      final authProvider = context.read<AuthProvider>();
      final confirm = await showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
    backgroundColor: Theme.of(context).cardColor,
    content: SizedBox(
        width: 280,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(text: 'Are you sure you want to Log out?',
            fontSize: 16,
            textAlign: TextAlign.center,),

            const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: AppText(text: 'Cancel',
                      fontSize: 12,),
                    ),
                    const SizedBox(width: 10),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // highlight LogOut
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const AppText(text: 'Log Out',
                      fontSize: 12,),
                    ),
                  ],
                ),
          ],
        ),
      ),
      
    ),
      );
    
      if (confirm == true) {
        if(Scaffold.of(context).isDrawerOpen){
         Navigator.of(context).pop(); 
        }
    await authProvider.signOut();
    
     // Navigate to login screen after logout
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false); 
      }
    },
    
    );
  }
}
