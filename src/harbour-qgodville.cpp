/*
    Godville Viewer for SailfishOS
    Copyright ⓒ 2014 Vasily Khodakov <binque@ya.ru>.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

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
