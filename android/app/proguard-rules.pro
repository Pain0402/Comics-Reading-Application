# Giữ lại các class của thư viện Local Notifications
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# Giữ lại class của thư viện lấy Múi Giờ (QUAN TRỌNG ĐỂ SỬA LỖI HẸN GIỜ)
-keep class com.simonpham.flutter_timezone.** { *; }

# Giữ lại các Receiver quan trọng
-keep public class com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver
-keep public class com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver

# Giữ lại tất cả các BroadcastReceiver do người dùng định nghĩa
-keep public class * extends android.content.BroadcastReceiver

# Giữ lại các Annotation và Metadata
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable

-dontwarn com.dexterous.flutterlocalnotifications.**
-dontwarn com.simonpham.flutter_timezone.**