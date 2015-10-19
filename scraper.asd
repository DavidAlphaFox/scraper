(asdf:defsystem scraper
  :author "David.Gao <david.alpha.fox@gmail.com>"
  :license "MIT"
  :version "0.1.0"
  :description "A very simple scarper"
  :depends-on (#:drakma
			   #:chtml-matcher
			   #:cxml-stp)
  :components
  ((:file "package")
   (:file "scraper")
			  ))
