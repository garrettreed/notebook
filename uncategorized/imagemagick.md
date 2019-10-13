# Imagemagick

-   Convert file type, keep base name, make 72 dpi: `convert *.png -density 72 -units pixelsperinch -set filename:basename "%[basename]" "%[filename:basename].jpg"`
