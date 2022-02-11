# Theme configuration file
# ========================
# This file is used for all theme configuration.
# It's where you define everything that's editable in Spina CMS.

Spina::Theme.register do |theme|
  # All views are namespaced based on the theme's name
  theme.name = "default"
  theme.title = "Default theme"

  # Parts
  # Define all editable parts you want to use in your view templates
  #
  # Built-in part types:
  # - Line
  # - MultiLine
  # - Text (Rich text editor)
  # - Image
  # - ImageCollection
  # - Attachment
  # - Option
  # - Repeater
  theme.parts = [
    {name: "content", title: "Inhalt", part_type: "Spina::Parts::Content"},
    {
      name: "images",
      title: "Images",
      part_type: "Spina::Parts::ImageCollection"
    },
    {name: "video", title: "Video", part_type: "Spina::Parts::Video"},
    {
      name: "videos",
      title: "Videos",
      parts: %w[video],
      part_type: "Spina::Parts::Repeater"
    }
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    {name: "project", title: "Project", description: "Template for project", parts: %w[subtitle thumbnail text images videos]},
    {name: "portfolio", title: "Portfolio", description: "Template for portfolio"},
    {name: "blog_post", title: "Blog Post", description: "Template for blog post", parts: %w[video image text]},
    {name: "blog", title: "Blog", description: "Template for blog"},
    {name: "contact", title: "Kontakt", description: "Template for contact", parts: %w[image text]}
  ]

  # Custom pages
  # Some pages should not be created by the user, but generated automatically.
  # By naming them you can reference them in your code.
  theme.custom_pages = [
    {name: "homepage", title: "Portfolio", deletable: false, view_template: "portfolio"},
    {name: "blog", title: "Blog", deletable: false, view_template: "blog"},
    {name: "contact", title: "Kontakt", deletable: false, view_template: "contact"}
  ]

  # Navigations (optional)
  # If your project has multiple navigations, it can be useful to configure multiple
  # navigations.
  theme.navigations = [
    {name: "main", label: "Main navigation"}
  ]

  # Layout parts (optional)
  # You can create global content that doesn't belong to one specific page. We call these layout parts.
  # You only have to reference the name of the parts you want to have here.
  theme.layout_parts = []

  # Resources (optional)
  # Think of resources as a collection of pages. They are managed separately in Spina
  # allowing you to separate these pages from the 'main' collection of pages.
  theme.resources = [
    {name: "projects", label: "Projects", view_template: "project"},
    {name: "blog_posts", label: "Blog Posts", view_template: "blog_posts"}
  ]

  # Plugins (optional)
  theme.plugins = []

  # Embeds (optional)
  theme.embeds = []
end
