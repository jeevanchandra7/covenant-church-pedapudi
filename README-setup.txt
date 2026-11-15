COVENANT CHURCH PEDAPUDI — WEBSITE UPDATE

The ZIP contains these four files. Upload all four to the top level of your existing GitHub repository and commit the update:
  index.html       Public church website
  admin.html       Private editor for the approved administrator
  admin-setup.sql  Supabase database and access rules
  README-setup.txt These instructions

Upload and publish
1. Open the church repository on GitHub, choose Add file > Upload files, select all four files from this ZIP, and commit directly to main.
2. GitHub Pages will update the existing website after the commit. Open the website and refresh it after a minute or two.
3. If the old setup is in Supabase, open Supabase > SQL Editor, create a new query, paste the full updated admin-setup.sql, and click Run. This also updates the member directory so only approved administrators can read it.
4. In Supabase Authentication, make sure the administrator account for jeevanchandra.lifecare@gmail.com has been created and its email confirmed. Then run the SQL so that account is granted editor access.
5. Open https://jeevanchandra7.github.io/covenant-church-pedapudi/admin.html and sign in with the administrator account.

What the update includes
- Home, Events, Bible, Messages, Groups, Children, Prayer, and Giving each open as a screen in the same browser tab.
- A Bible verse is selected by date and updates daily. The short devotional prayer changes every two days.
- The Members link opens the admin editor. The directory is not shown to public visitors; the admin can add and edit name, age, gender, group, role, and description.
- In the editor, use Children to add sports, Bible competitions, Sunday school, dance performances, prizes, seasonal celebrations, and related photos. Use Events and Gallery for church events and photos.
- The location button uses the Google Maps share link supplied by the church.
- The home screen has a gentle, animated nativity-inspired illustration made with the page design.
- Bible quotations use the World English Bible (public domain), with a source link on the page.

Editing content
Use the admin editor tabs to change the home and service details, events, Bible resources, groups, children’s activities, photos, UPI information, and members. Click Save changes to publish text and list updates. Uploaded photos are stored in the church-gallery bucket; the setup SQL creates the bucket and its access rules.

Giving and security
- The giving page displays the church’s official UPI QR and instructions. Donors complete payment in their own UPI app. This site does not confirm payment or collect payment details.
- The browser uses the Supabase Publishable key. Never put a Supabase Secret key or database password in these files.
- Only approved administrators can use the editor or read/change the member directory. Add personal member details only with their permission.
