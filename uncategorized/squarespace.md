# Squarespace Evaluation

First attempt at using squarespace for a fully-custom client site/cms

## Initial observations

-   Bad search functionality in forums. Low use in general. Few helpful questions answered.
-   No big dev features since 2015.
-   Lack of custom fields. Either have to use an open block that can’t be reused.
-   Custom fields are possible, but restricted to the built in types, on a Post-type page that doesn’t allow the same site builder interface.

## Setup

-   Install the Squarespace dev server if you have not already done so: npm install -g @squarespace/server
-   Clone the template: git clone https://site-name.squarespace.com/template.git
-   Start the dev server. Example: squarespace-server https://site-name.squarespace.com -p 3000 --auth.

## Notes for starting a new Squarespace site:

-   Ideally the designers would have Squarespace in mind and design around some modifications to a default template. If they do this, you can create the site in Squarespace from that template in the regular way.
-   If the design is custom and does not match an existing template (like Carolina Custom Sound), you should start with the base template, which is a minimal starting point. Follow this url and create a new site from it: http://base-template.squarespace.com/. That'll create a new site in the account with some unique site name. Cloning the base template from Github does not work.
-   Open the site in Squarespace, go to settings -> advanced and turn on developer mode. This is dangerous to do on an existing site.
-   Clone the site: git clone https://site-name.squarespace.com/template.git. It'll clone itself with the name template/. Feel free to rename it to something more identifiable.
-   Create a new project on your git host. Add this as another remote so we can track the code there as well.
-   Install the Squarespace dev server: npm install -g @squarespace/server
-   Start the dev server. Example: squarespace-server https://site-name-tptx.squarespace.com -p 3000 --auth. It defaults to port 9000, which didn't work for me, so you can specify a different port with -p. Trial sites must use --auth, but also try without if it doesn't work. ¯\_(ツ)\_/¯
-   Pushing to origin master will deploy to squarespace and make the change live.

## Issues

-   Squarespace adds some styles when in edit mode. Some of these will need to be adjusted, but just avoid it when possible. It requires the use of more `!important`s.
-   Sometimes gallery images don't load when viewing the site in edit mode. Refreshing sometimes fixes it. It doesn't seem to be related to the default lazy loader that the starter theme comes with.
-   Page changes, website settings changes, and other various edits within Squarespace require restarting the development server to be pulled locally. If something isn't working as expected, restart the server.
-   The base theme leaves out some default collection types, like folder. Try cloning one of their other templates and note the differences if you need to figure out a feature when the docs are lacking.
-   No staging area without separate site.

## What would make Squarespace okay

-   A reusable global-style fields section.
-   A plain text block type.
-   Custom block types (fields), or even position-editable version of the open block type. This would allow for styles without having to use weird nesting rules.

## Other Tips

-   Wrap your site in a container with a custom class, so you can use this to override Squarespace default styles and easily beat its specificity with fewer `!importants`. Note fewer, but not all. Some default styles are nested within body classes.
-   Use custom collections for reusable image galleries.
-   A custom text collection could be used to reuse text sections, but only if you don't need it to be user-orderable and can set its location in the template.
