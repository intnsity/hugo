# Deploying a Hugo Site using Docker

## Site setup from scratch
Assemble the Hugo site using a theme and using Hugo's default initialization command
```
hugo new site my_new_site
```
Specifically, using the Docker containers, cd to the docker container directory for hugo (where the docker-compose.yml lives and where your folders for the container live). Create a new site with a name matching our volume name in docker-compose.yml:

docker-compose.yml volumes

```
volumes:
    - ./hugo-site:/src
    - ./public:/target
```
new site command
```
hugo new site hugo-site
```

## Hugo Blowfish theme
https://blowfish.page/

theme installation:
https://blowfish.page/docs/installation/

theme initial setup:
https://blowfish.page/docs/getting-started/


## Build the site after making content changes

Make content changes inside hugo-site/content/

Run hugo
```
hugo
```

cd to your hugo docker container folder, copy the contents of hugo-site/public* to public/
```
cp -r hugo-site/public/* public*
```

## Folder Structure

The typical folder structure for hugo is:
```
.
├── archetypes
│   └── default.md
├── assets
│   ├── js
│   │   └── script.js
│   └── scss
│       └── style.scss
├── config.toml
├── content
│   └── posts
│       └── my-first-post.md
├── data
├── layouts
│   ├── _default
│   │   ├── baseof.html
│   │   ├── list.html
│   │   └── single.html
│   └── partials
│       ├── footer.html
│       └── header.html
├── static
│   ├── css
│   │   └── style.css
│   └── img
└── themes
    └── your_theme
        ├── archetypes
        ├── layouts
        ├── static
        └── theme.toml

```

### Folder Types
- archetypes: Directory for archetype files, which are used to create new content with pre-filled front matter
- assets: Directory is not for static files; instead, it's where you place resources like SCSS or Sass files that need to be compiled into CSS, or JavaScript that needs to be minified.
- config.toml: The site configuration file
- content: The directory where your content files (in Markdown or other formats) go.
- data: A directory where Hugo stores any additional data files you're using for your site (like JSON or YAML files).
- layouts: This directory contains the HTML templates that Hugo uses to construct your site.
- static: A directory for static files such as images, CSS, JavaScript, etc.
- themes: Contains the themes that you've added to your site.

##### Inside the layouts directory:
- _default: Contains base templates that Hugo will use if no other template is found.
- partials: Contains reusable chunks of HTML that can be used in multiple templates.

#### Inside the themes directory is the your_theme directory:

- archetypes, layouts, static: These directories function just like the ones in the root directory, but they're specific to the theme.
- theme.toml: The theme's configuration file.

#### Inside the config directory:
- languages.en.toml: This file contains the configuration for the English language version of your site. It might include the language name, language direction, and other language-specific settings.
- markup.toml: This file contains the configuration for the markup options that Hugo uses when rendering your site. It could contain settings for the rendering of code highlighting, table of contents, etc.
- menus.en.toml: This file contains the definition of your site's menus in English. 
- module.toml: This file would include any Hugo module configurations. Hugo Modules allow you to add, replace, and mount any number of file and directory trees in your project, where each such entry can come from your own disk, or from a variety of sources such as GitHub, GitLab etc. It could include settings for importing other Hugo modules (for themes, for example), or to define how your own project could be used as a module. 
- params.toml: This file contains custom parameters that you can use anywhere in your site. These parameters can be whatever you need. They might be used to customize the look and feel of your site, provide information to be displayed in your templates, etc.

## Making changes to the base content from your theme

### Edit the menu

Modify the menus.en.toml file:
This will show all of the pages you want to be able to link to on your site, each page should have a corresponding folders in the /content folder of your hugo project. 

Use the menu in the template by editing layouts/partials/header.html:
```
<nav>
  {{ range .Site.Menus.main }}
    <a href="{{ .URL }}">{{ .Name }}</a>
  {{ end }}
</nav>
```
### Edit the theme displays
Different options for the Blowfish theme are here: https://blowfish.page/docs/homepage-layout/

edit the params.toml file to use a different tamplate layout, example:
```
homepage.layout "hero"
homepage.homepageImage
```

Show recent posts or articles editing the params.toml:
```
  showRecent = true
  showRecentItems = 6
  showMoreLink = false
  showMoreLinkDest = "/posts"
```

### 