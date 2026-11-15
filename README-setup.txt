COVENANT CHURCH PEDAPUDI — SITE EDITOR SETUP

The ZIP contains three files. Upload all three to the top level of the existing GitHub repository:
  index.html       Public church website
  admin.html       Private editor screen (requires the approved administrator login)
  admin-setup.sql  One-time Supabase database and access setup

1. In GitHub, open the repository, choose Add file > Upload files, select all three files, and commit the change.

2. In Supabase, open Authentication > URL Configuration. Set Site URL and add this Redirect URL:
   https://jeevanchandra7.github.io/covenant-church-pedapudi/

3. Open the public website, create an account using jeevanchandra.lifecare@gmail.com, and confirm the email.

4. In Supabase, open SQL Editor, create a new query, paste the full contents of admin-setup.sql, and click Run.
   Run this after the administrator has created and confirmed the account. If you already ran an earlier copy, run this updated copy again; it adds the private member directory.

5. Open this page and sign in with that account:
   https://jeevanchandra7.github.io/covenant-church-pedapudi/admin.html

6. Use the editor tabs to change home and service details, events, Bible resources, groups, children and festival text, photos, the church UPI QR image, and the signed-in member directory. Click Save changes. Refresh the public website to see edits.

The exact Google Maps share link supplied for the church is set on the location button. Event cards open their details within the site; event page links use the same browser tab.

Security:
- The website uses the Supabase Publishable key in the browser. Do not place a Supabase Secret key or database password in website files.
- The editor checks the site_admins access table; visitors cannot edit content.
- Only signed-in members can view the member directory; only the administrator can add, edit, or remove listings. Add names only with the people’s agreement.
- The giving QR is a static QR preview. Donors enter the amount in their UPI app. The website does not verify or record payments or send donor form details.
