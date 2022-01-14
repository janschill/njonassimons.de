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
    {name: "text", title: "Body", part_type: "Spina::Parts::Text"},
    {name: "image", title: "Image", part_type: "Spina::Parts::Image"},
    {name: "image_caption", title: "Caption", part_type: "Spina::Parts::Line"},
    {
      name: "image_show_caption?",
      title: "Show Caption?",
      part_type: "Spina::Parts::Option",
      options: ["Show", "Hide"]
    },
    {
      name: "images",
      title: "Images",
      parts: %w[image image_caption image_show_caption?],
      part_type: "Spina::Parts::Repeater"
    },
    {name: "video_id", title: "Video ID", part_type: "Spina::Parts::Line"},
    {
      name: "video_platform_option",
      title: "Platform",
      part_type: "Spina::Parts::Option",
      options: ["YouTube", "Vimeo"]
    },
    {
      name: "videos",
      title: "Videos",
      parts: %w[video_platform_option video_id],
      part_type: "Spina::Parts::Repeater"
    }
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    {name: "project", title: "Project", description: "Template for project", parts: %w[text images videos]},
    {name: "portfolio", title: "Portfolio", description: "Template for portfolio", parts: %w[]},
    {name: "blog", title: "Blog", description: "Template for blog", parts: %w[]},
    {name: "contact", title: "Kontakt", description: "Template for contact", parts: %w[text]}
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
    {name: "projects", label: "Projects", view_template: "project"}
  ]

  # Plugins (optional)
  theme.plugins = []

  # Embeds (optional)
  theme.embeds = []
end
