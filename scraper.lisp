(in-package :scraper)
(defparameter *agent* "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36")
(defparameter *base-url* "http://me2-sex.lofter.com/tag/%E7%BE%8E%E5%A5%B3%E6%91%84%E5%BD%B1?page=")
(defparameter *current-page* 0)
(defun rest()
  (setf *current-page* 0)
  )
(defun next-page ()
  (setf *current-page* (+ 1 *current-page*))
  (let ((url (concatenate 'string  *base-url* (write-to-string *current-page*))))
	(scrape-pages url 10)))

(defun scrape-pages (url timeout)
  (multiple-value-bind (body status)
	  (drakma:http-request url :method :get :user-agent *agent*
						  :connection-timeout timeout)
	(if (= 200 status)
		(parse-img body))))

(defun parse-img (body)
  (let ((doc (chtml:parse body (cxml-stp:make-builder)))
		(results '()))
	(stp:do-recursively (img doc)
	  (when (and (typep img 'stp:element)
				 (equal (stp:local-name img) "img"))
		(let ((src (stp:attribute-value img "src")))
		  (push src results))))
	results))
















