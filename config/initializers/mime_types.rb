# Register PDF MIME type if not already registered
Mime::Type.register "application/pdf", :pdf unless Mime::Type.lookup_by_extension(:pdf)
