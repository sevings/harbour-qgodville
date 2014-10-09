#include <QtQuick>
#include <sailfishapp.h>

class TranslationTest : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:
    TranslationTest() {
        translator = new QTranslator(this);
    }

    QString getEmptyString() {
        return "";
    }

    Q_INVOKABLE void selectLanguage(QString language) {
        if(language == QString("en")) {
            if (!translator->load("harbour-qgodville_en", "/usr/share/harbour-qgodville/translations"))
                qDebug("translation loading error");
            qApp->installTranslator(translator);
        }
        if(language == QString("ru")){
            qApp->removeTranslator(translator);
        }
        emit languageChanged();
    }
signals:
    void languageChanged();
private:
    QTranslator *translator;
};

int main(int argc, char *argv[])
{
    // SailfishApp::main() will display "qml/template.qml", if you need more
    // control over initialization, you can use:
    //
    //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
    //   - SailfishApp::createView() to get a new QQuickView * instance
    //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
    //
    // To display the view, call "show()" (will show fullscreen on device).

    QGuiApplication *app = SailfishApp::application(argc, argv);
    TranslationTest myObj;
    QQuickView *view = SailfishApp::createView();
    view->rootContext()->setContextProperty("translator", (QObject *)&myObj);
    view->setSource(SailfishApp::pathTo("qml/harbour-qgodville.qml"));
    view->show();
    return app->exec();
    //return SailfishApp::main(argc, argv);
}

#include "harbour-qgodville.moc"
