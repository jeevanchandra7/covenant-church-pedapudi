COVENANT CHURCH PEDAPUDI — WEBSITE UPDATE

The ZIP contains these files. Extract them, upload every file to the top level of your existing GitHub repository, and commit the update:
  index.html             Public church website and installable app
  admin.html             Private church content editor
  admin-setup.sql        Supabase tables, access rules, and public member view
  manifest.webmanifest   Phone app name and icon settings
  service-worker.js      App install and offline page shell
  app-icon.png           Church app icon
  README-setup.txt       These instructions

Publish this update
1. Open your GitHub repository, choose Add file > Upload files, select all seven extracted files, and commit directly to main. Do not upload the ZIP itself.
2. In Supabase, open SQL Editor, paste the complete updated admin-setup.sql, and click Run. This creates the public member directory view. The member table itself remains admin-only.
3. Wait a minute or two, then refresh the GitHub Pages site.

Install it on a phone
- Android: open the church website in Chrome, tap ⋮, then choose Install app or Add to Home screen.
- iPhone: open the website in Safari, tap Share, then Add to Home Screen.
The installed app uses the same animated sunrise scene as the website.

Members and admin
- Members opens inside the website. Visitors see names, groups, roles, and descriptions that the admin has added. Age and gender stay private in the admin editor.
- The Admin button beside Sign in opens the approved admin editor: https://jeevanchandra7.github.io/covenant-church-pedapudi/admin.html
- Admins can add, change, and remove member entries in the Members tab. Add people only with their agreement.

Bible story background and devotionals
- The website and installed app use a full-screen sunrise scene with a cross and a gentle robed Jesus silhouette, layered mountains, drifting clouds, warm sun glow, birds, and grasses moving in the wind. The scene is drawn in the page rather than loaded from a video file.
- The Bible verse changes daily. The short devotional prayer changes every two days.

Children’s activities and videos
In the admin editor, open Children & festivals to add activity descriptions, dates, age groups, prizes, photos, and short MP4/WebM videos. Use compressed, shorter videos. Upload children’s photos and videos only with parent or guardian permission.

Prayer requests and WhatsApp
The prayer form asks for the visitor’s name, mobile number, request, and consent. It opens WhatsApp with a prefilled message to +91 9885885054. The visitor reviews the details and taps Send. The church admin can reply from WhatsApp.

To set an automatic welcome reply, use WhatsApp Business on the admin phone: Tools > Greeting message > turn on Send greeting message > edit the wording > choose recipients > Save. Suggested text: “Thank you for sharing your prayer request with Covenant Church Pedapudi. We are praying with you. May God comfort and strengthen you. Amen.” WhatsApp Business sends this greeting to first-time contacts and people who return after 14 days of inactivity. Sending a custom automatic reply after every prayer request requires the WhatsApp Business Platform and a secure server integration.

Safety, security, and giving
- Never put a Supabase Secret key or database password in website files. The browser uses the Publishable key.
- The public directory view contains only name, group, role, and description. Age and gender remain in the protected member table.
- The Gift page shows the church UPI QR. Donors complete payment in their UPI app; the website does not verify or record payments.
