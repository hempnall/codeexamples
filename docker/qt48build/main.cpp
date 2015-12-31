#include <poppler-qt4.h>
#include <iostream>
#include <QString>
#include <QImage>

int main() {


	QString filename = "/page.pdf";
	Poppler::Document* doc = Poppler::Document::load(filename);
	if (!doc) {
		std::cout << "err1";
		return 0;
	}
	Poppler::Page* pdfPage = doc->page(0);
	if (pdfPage==0) {
		std::cout << "err2";
		return 0;
	}

// Generate a QImage of the rendered page
QImage image = pdfPage->renderToImage();
if (image.isNull()) {
  // ... error message ...
  std::cout << "err3";
	return 0;
}
// ... use image ...

	image.save("out.jpg");
// after the usage, the page must be deleted
delete pdfPage;
delete doc;
}
